USE [master]
GO
/****** Object:  Database [Интернет_магазин]    Script Date: 18.04.2022 17:06:05 ******/
CREATE DATABASE [Интернет_магазин]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Интернет_магазин', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Интернет_магазин.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Интернет_магазин_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\Интернет_магазин_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [Интернет_магазин] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Интернет_магазин].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Интернет_магазин] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Интернет_магазин] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Интернет_магазин] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Интернет_магазин] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Интернет_магазин] SET ARITHABORT OFF 
GO
ALTER DATABASE [Интернет_магазин] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Интернет_магазин] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Интернет_магазин] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Интернет_магазин] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Интернет_магазин] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Интернет_магазин] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Интернет_магазин] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Интернет_магазин] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Интернет_магазин] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Интернет_магазин] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Интернет_магазин] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Интернет_магазин] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Интернет_магазин] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Интернет_магазин] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Интернет_магазин] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Интернет_магазин] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Интернет_магазин] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Интернет_магазин] SET RECOVERY FULL 
GO
ALTER DATABASE [Интернет_магазин] SET  MULTI_USER 
GO
ALTER DATABASE [Интернет_магазин] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Интернет_магазин] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Интернет_магазин] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Интернет_магазин] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Интернет_магазин] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'Интернет_магазин', N'ON'
GO
ALTER DATABASE [Интернет_магазин] SET QUERY_STORE = OFF
GO
USE [Интернет_магазин]
GO
/****** Object:  Table [dbo].[Детали_сделки]    Script Date: 18.04.2022 17:06:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Детали_сделки](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ID_Клиента] [bigint] NOT NULL,
	[ID_Заказов] [bigint] NOT NULL,
 CONSTRAINT [PK_Детали_сделки] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Заказы]    Script Date: 18.04.2022 17:06:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Заказы](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ID_Клиентов] [bigint] NOT NULL,
	[ID_Конфигурации] [bigint] NOT NULL,
	[Дата_заказа] [date] NOT NULL,
	[Способ_оплаты] [nvarchar](50) NOT NULL,
	[Сумма_заказа] [money] NOT NULL,
	[Отметка_об_оплате] [nvarchar](50) NOT NULL,
	[Отметка_об_отгрузки] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Заказы] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Клиенты]    Script Date: 18.04.2022 17:06:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Клиенты](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[ФИО] [nvarchar](50) NOT NULL,
	[Телефон] [char](11) NOT NULL,
	[Почтовый_адрес] [nvarchar](100) NOT NULL,
	[email] [nvarchar](50) NOT NULL,
	[Номер_счёта] [char](20) NOT NULL,
 CONSTRAINT [PK_Клиенты] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Компоненты]    Script Date: 18.04.2022 17:06:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Компоненты](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Название] [nvarchar](50) NOT NULL,
	[ID_Производителя] [bigint] NOT NULL,
	[Характеристики] [nvarchar](max) NULL,
	[Описание] [nvarchar](max) NULL,
	[Цена] [money] NOT NULL,
 CONSTRAINT [PK_Компоненты] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Компоненты_в_конфигурации1]    Script Date: 18.04.2022 17:06:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Компоненты_в_конфигурации1](
	[ID] [bigint] NOT NULL,
	[ID_Компонентов] [bigint] NOT NULL,
	[ID_Конфигурации] [bigint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Конфигурация]    Script Date: 18.04.2022 17:06:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Конфигурация](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Наименование] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Конфигурация] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Производители]    Script Date: 18.04.2022 17:06:05 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Производители](
	[ID] [bigint] IDENTITY(1,1) NOT NULL,
	[Название] [nvarchar](50) NOT NULL,
	[Страна] [nvarchar](50) NOT NULL,
	[Адрес] [nvarchar](50) NOT NULL,
	[Телефон] [char](11) NOT NULL,
 CONSTRAINT [PK_Производители] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Детали_сделки] ON 

INSERT [dbo].[Детали_сделки] ([ID], [ID_Клиента], [ID_Заказов]) VALUES (1, 1, 2)
INSERT [dbo].[Детали_сделки] ([ID], [ID_Клиента], [ID_Заказов]) VALUES (2, 2, 1)
INSERT [dbo].[Детали_сделки] ([ID], [ID_Клиента], [ID_Заказов]) VALUES (3, 3, 8)
INSERT [dbo].[Детали_сделки] ([ID], [ID_Клиента], [ID_Заказов]) VALUES (4, 4, 3)
INSERT [dbo].[Детали_сделки] ([ID], [ID_Клиента], [ID_Заказов]) VALUES (5, 5, 5)
SET IDENTITY_INSERT [dbo].[Детали_сделки] OFF
GO
SET IDENTITY_INSERT [dbo].[Заказы] ON 

INSERT [dbo].[Заказы] ([ID], [ID_Клиентов], [ID_Конфигурации], [Дата_заказа], [Способ_оплаты], [Сумма_заказа], [Отметка_об_оплате], [Отметка_об_отгрузки]) VALUES (1, 2, 2, CAST(N'2022-03-25' AS Date), N'Наличные', 180000.0000, N'Оплачено', N'Отправлен')
INSERT [dbo].[Заказы] ([ID], [ID_Клиентов], [ID_Конфигурации], [Дата_заказа], [Способ_оплаты], [Сумма_заказа], [Отметка_об_оплате], [Отметка_об_отгрузки]) VALUES (2, 1, 1, CAST(N'2022-04-18' AS Date), N'Безналичная оплата', 250000.0000, N'Неоплачено ', N'Не отправлено')
INSERT [dbo].[Заказы] ([ID], [ID_Клиентов], [ID_Конфигурации], [Дата_заказа], [Способ_оплаты], [Сумма_заказа], [Отметка_об_оплате], [Отметка_об_отгрузки]) VALUES (3, 4, 1, CAST(N'2022-03-14' AS Date), N'Безналичная оплата', 110000.0000, N'Оплачено', N'Отправлено')
INSERT [dbo].[Заказы] ([ID], [ID_Клиентов], [ID_Конфигурации], [Дата_заказа], [Способ_оплаты], [Сумма_заказа], [Отметка_об_оплате], [Отметка_об_отгрузки]) VALUES (5, 5, 2, CAST(N'2022-04-10' AS Date), N'Наличные ', 150000.0000, N'Оплачено', N'Не отправлено')
INSERT [dbo].[Заказы] ([ID], [ID_Клиентов], [ID_Конфигурации], [Дата_заказа], [Способ_оплаты], [Сумма_заказа], [Отметка_об_оплате], [Отметка_об_отгрузки]) VALUES (8, 3, 1, CAST(N'2022-03-22' AS Date), N'Безналичная оплата', 150000.0000, N'Оплачено', N'Отправлено')
SET IDENTITY_INSERT [dbo].[Заказы] OFF
GO
SET IDENTITY_INSERT [dbo].[Клиенты] ON 

INSERT [dbo].[Клиенты] ([ID], [ФИО], [Телефон], [Почтовый_адрес], [email], [Номер_счёта]) VALUES (1, N'Володин Дмитрий Александрович', N'89065643212', N'г.Омск, ул.Ленина 24', N'Volodin1998@mail.ru', N'9864567891          ')
INSERT [dbo].[Клиенты] ([ID], [ФИО], [Телефон], [Почтовый_адрес], [email], [Номер_счёта]) VALUES (2, N'Асхатова Валерия Владимировна', N'89886754321', N'г.Новосибирск, ул.Багратиона 45', N'Lera18@gmail.com', N'6750981345          ')
INSERT [dbo].[Клиенты] ([ID], [ФИО], [Телефон], [Почтовый_адрес], [email], [Номер_счёта]) VALUES (3, N'Александров Николай Николаевич', N'87006754532', N'г.Москва, ул.Карла Маркса 5', N'Nikola564@mail.ru', N'1876546789          ')
INSERT [dbo].[Клиенты] ([ID], [ФИО], [Телефон], [Почтовый_адрес], [email], [Номер_счёта]) VALUES (4, N'Инкина Лариса Анатольевна', N'89065679843', N'г.Самара, ул.Волховстроя 67', N'Larisa2000@mail.ru', N'5670943126          ')
INSERT [dbo].[Клиенты] ([ID], [ФИО], [Телефон], [Почтовый_адрес], [email], [Номер_счёта]) VALUES (5, N'Игнатова Валентина Борисовна', N'89034560981', N'г.Новокузнецк, ул.Авангардная 15', N'Valentina42@gmail.com', N'1348976542          ')
SET IDENTITY_INSERT [dbo].[Клиенты] OFF
GO
SET IDENTITY_INSERT [dbo].[Компоненты] ON 

INSERT [dbo].[Компоненты] ([ID], [Название], [ID_Производителя], [Характеристики], [Описание], [Цена]) VALUES (1, N'Процессор', 3, NULL, NULL, 50000.0000)
INSERT [dbo].[Компоненты] ([ID], [Название], [ID_Производителя], [Характеристики], [Описание], [Цена]) VALUES (2, N'Материнская плата', 1, NULL, NULL, 35000.0000)
INSERT [dbo].[Компоненты] ([ID], [Название], [ID_Производителя], [Характеристики], [Описание], [Цена]) VALUES (3, N'Оперативная память', 2, NULL, NULL, 68000.0000)
INSERT [dbo].[Компоненты] ([ID], [Название], [ID_Производителя], [Характеристики], [Описание], [Цена]) VALUES (4, N'Видеокарта', 4, NULL, NULL, 34000.0000)
INSERT [dbo].[Компоненты] ([ID], [Название], [ID_Производителя], [Характеристики], [Описание], [Цена]) VALUES (5, N'Процессор', 5, NULL, NULL, 30000.0000)
INSERT [dbo].[Компоненты] ([ID], [Название], [ID_Производителя], [Характеристики], [Описание], [Цена]) VALUES (6, N'Материнская плата', 3, NULL, NULL, 15000.0000)
INSERT [dbo].[Компоненты] ([ID], [Название], [ID_Производителя], [Характеристики], [Описание], [Цена]) VALUES (7, N'Оперативная плата', 5, NULL, NULL, 30000.0000)
INSERT [dbo].[Компоненты] ([ID], [Название], [ID_Производителя], [Характеристики], [Описание], [Цена]) VALUES (8, N'Видеокарта', 1, NULL, NULL, 15000.0000)
SET IDENTITY_INSERT [dbo].[Компоненты] OFF
GO
INSERT [dbo].[Компоненты_в_конфигурации1] ([ID], [ID_Компонентов], [ID_Конфигурации]) VALUES (1, 1, 2)
INSERT [dbo].[Компоненты_в_конфигурации1] ([ID], [ID_Компонентов], [ID_Конфигурации]) VALUES (1, 6, 2)
INSERT [dbo].[Компоненты_в_конфигурации1] ([ID], [ID_Компонентов], [ID_Конфигурации]) VALUES (1, 2, 2)
INSERT [dbo].[Компоненты_в_конфигурации1] ([ID], [ID_Компонентов], [ID_Конфигурации]) VALUES (1, 4, 2)
INSERT [dbo].[Компоненты_в_конфигурации1] ([ID], [ID_Компонентов], [ID_Конфигурации]) VALUES (2, 5, 1)
INSERT [dbo].[Компоненты_в_конфигурации1] ([ID], [ID_Компонентов], [ID_Конфигурации]) VALUES (2, 6, 1)
INSERT [dbo].[Компоненты_в_конфигурации1] ([ID], [ID_Компонентов], [ID_Конфигурации]) VALUES (2, 7, 1)
INSERT [dbo].[Компоненты_в_конфигурации1] ([ID], [ID_Компонентов], [ID_Конфигурации]) VALUES (2, 8, 1)
GO
SET IDENTITY_INSERT [dbo].[Конфигурация] ON 

INSERT [dbo].[Конфигурация] ([ID], [Наименование]) VALUES (1, N'Конфигурация 1')
INSERT [dbo].[Конфигурация] ([ID], [Наименование]) VALUES (2, N'Конфигурация 2')
SET IDENTITY_INSERT [dbo].[Конфигурация] OFF
GO
SET IDENTITY_INSERT [dbo].[Производители] ON 

INSERT [dbo].[Производители] ([ID], [Название], [Страна], [Адрес], [Телефон]) VALUES (2, N'ACER', N'Тайвань', N'Тайбей', N'88005634567')
INSERT [dbo].[Производители] ([ID], [Название], [Страна], [Адрес], [Телефон]) VALUES (3, N'ASUS', N'Тайвань', N'Тайбей', N'88006788754')
INSERT [dbo].[Производители] ([ID], [Название], [Страна], [Адрес], [Телефон]) VALUES (4, N'INTEL', N'США', N'Маунтин-Вью', N'87007865643')
INSERT [dbo].[Производители] ([ID], [Название], [Страна], [Адрес], [Телефон]) VALUES (5, N'LENOVO', N'Китай', N'Пекин', N'89007654573')
SET IDENTITY_INSERT [dbo].[Производители] OFF
GO
USE [master]
GO
ALTER DATABASE [Интернет_магазин] SET  READ_WRITE 
GO
