USE [master]
GO
/****** Object:  Database [TenAugust]    Script Date: 8/28/2022 9:56:24 PM ******/
CREATE DATABASE [TenAugust]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TenAugust', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TenAugust.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TenAugust_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\TenAugust_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TenAugust] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TenAugust].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TenAugust] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TenAugust] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TenAugust] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TenAugust] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TenAugust] SET ARITHABORT OFF 
GO
ALTER DATABASE [TenAugust] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TenAugust] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TenAugust] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TenAugust] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TenAugust] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TenAugust] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TenAugust] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TenAugust] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TenAugust] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TenAugust] SET  ENABLE_BROKER 
GO
ALTER DATABASE [TenAugust] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TenAugust] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TenAugust] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TenAugust] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TenAugust] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TenAugust] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [TenAugust] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TenAugust] SET RECOVERY FULL 
GO
ALTER DATABASE [TenAugust] SET  MULTI_USER 
GO
ALTER DATABASE [TenAugust] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TenAugust] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TenAugust] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TenAugust] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TenAugust] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TenAugust] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'TenAugust', N'ON'
GO
ALTER DATABASE [TenAugust] SET QUERY_STORE = OFF
GO
USE [TenAugust]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 8/28/2022 9:56:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[about]    Script Date: 8/28/2022 9:56:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[about](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
	[Title] [nvarchar](max) NOT NULL,
	[Text] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_about] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoleClaims]    Script Date: 8/28/2022 9:56:25 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoleClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoleClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetRoles]    Script Date: 8/28/2022 9:56:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetRoles](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](256) NULL,
	[NormalizedName] [nvarchar](256) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetRoles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserClaims]    Script Date: 8/28/2022 9:56:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserClaims](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserId] [nvarchar](450) NOT NULL,
	[ClaimType] [nvarchar](max) NULL,
	[ClaimValue] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserClaims] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserLogins]    Script Date: 8/28/2022 9:56:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserLogins](
	[LoginProvider] [nvarchar](450) NOT NULL,
	[ProviderKey] [nvarchar](450) NOT NULL,
	[ProviderDisplayName] [nvarchar](max) NULL,
	[UserId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserLogins] PRIMARY KEY CLUSTERED 
(
	[LoginProvider] ASC,
	[ProviderKey] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserRoles]    Script Date: 8/28/2022 9:56:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserRoles](
	[UserId] [nvarchar](450) NOT NULL,
	[RoleId] [nvarchar](450) NOT NULL,
 CONSTRAINT [PK_AspNetUserRoles] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUsers]    Script Date: 8/28/2022 9:56:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUsers](
	[Id] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Surame] [nvarchar](max) NULL,
	[Age] [int] NOT NULL,
	[UserName] [nvarchar](256) NULL,
	[NormalizedUserName] [nvarchar](256) NULL,
	[Email] [nvarchar](256) NULL,
	[NormalizedEmail] [nvarchar](256) NULL,
	[EmailConfirmed] [bit] NOT NULL,
	[PasswordHash] [nvarchar](max) NULL,
	[SecurityStamp] [nvarchar](max) NULL,
	[ConcurrencyStamp] [nvarchar](max) NULL,
	[PhoneNumber] [nvarchar](max) NULL,
	[PhoneNumberConfirmed] [bit] NOT NULL,
	[TwoFactorEnabled] [bit] NOT NULL,
	[LockoutEnd] [datetimeoffset](7) NULL,
	[LockoutEnabled] [bit] NOT NULL,
	[AccessFailedCount] [int] NOT NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_AspNetUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[AspNetUserTokens]    Script Date: 8/28/2022 9:56:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AspNetUserTokens](
	[UserId] [nvarchar](450) NOT NULL,
	[LoginProvider] [nvarchar](450) NOT NULL,
	[Name] [nvarchar](450) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_AspNetUserTokens] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC,
	[LoginProvider] ASC,
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[contacts]    Script Date: 8/28/2022 9:56:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[contacts](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[CustomerName] [nvarchar](100) NOT NULL,
	[CustomerSurname] [nvarchar](100) NOT NULL,
	[CustomerPhone] [nvarchar](max) NOT NULL,
	[CustomerEmail] [nvarchar](max) NOT NULL,
	[CustomerAddress] [nvarchar](max) NOT NULL,
	[CustomerMessage] [nvarchar](max) NOT NULL,
	[Date] [datetime2](7) NOT NULL,
 CONSTRAINT [PK_contacts] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employees]    Script Date: 8/28/2022 9:56:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Position] [nvarchar](max) NOT NULL,
	[Twitter] [nvarchar](max) NOT NULL,
	[Facebook] [nvarchar](max) NOT NULL,
	[Instagram] [nvarchar](max) NOT NULL,
	[Linkedin] [nvarchar](max) NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_employees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[main]    Script Date: 8/28/2022 9:56:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[main](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
	[Heading] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_main] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[messages]    Script Date: 8/28/2022 9:56:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[messages](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Sender] [nvarchar](max) NULL,
	[Text] [nvarchar](max) NULL,
	[Color] [nvarchar](max) NULL,
 CONSTRAINT [PK_messages] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderItems]    Script Date: 8/28/2022 9:56:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderItems](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[OrderId] [int] NOT NULL,
	[ProductId] [int] NOT NULL,
	[Count] [int] NOT NULL,
 CONSTRAINT [PK_orderItems] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 8/28/2022 9:56:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Email] [nvarchar](max) NOT NULL,
	[Address] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_orders] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[productCategories]    Script Date: 8/28/2022 9:56:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[productCategories](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_productCategories] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 8/28/2022 9:56:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Image] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Price] [float] NOT NULL,
	[Size1] [nvarchar](max) NULL,
	[Size2] [nvarchar](max) NULL,
	[Size3] [nvarchar](max) NULL,
	[Size4] [nvarchar](max) NULL,
	[Size5] [nvarchar](max) NULL,
	[Size6] [nvarchar](max) NULL,
	[ProductCategoryId] [int] NOT NULL,
 CONSTRAINT [PK_products] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[slides]    Script Date: 8/28/2022 9:56:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[slides](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Title] [nvarchar](max) NULL,
	[Image] [nvarchar](max) NULL,
 CONSTRAINT [PK_slides] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220810215505_init', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220812190920_v2', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220814154351_Contact', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220820151342_orders', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220820182357_desc', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220821133037_Users', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220822105703_Status', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220825124108_Chat', N'5.0.17')
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220828164817_emp', N'5.0.17')
GO
SET IDENTITY_INSERT [dbo].[about] ON 

INSERT [dbo].[about] ([Id], [Image], [Title], [Text]) VALUES (2, N'about.jpg', N'About us', N' Lorem ipsum dolor sit amet consectetur adipisicing elit. Laudantium, voluptatibus! Excepturi
            aperiam
            quam laborum illo modi molestiae provident error quia obcaecati. Maiores id nulla autem
            expedita,
            non architecto amet esse voluptas ab necessitatibus tempora ipsam culpa quaerat laboriosam
            tempore
            nam unde distinctio! Debitis optio iste quasi cupiditate quidem saepe pariatur dicta eum?')
SET IDENTITY_INSERT [dbo].[about] OFF
GO
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'422197c6-34fb-449c-b126-2616cbb2ceee', N'Admin', N'ADMIN', N'5bccd93e-e42a-4d73-af5d-79e0c811201d')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'95594407-2471-405f-88e2-b4dfc3950d97', N'SuperAdmin', N'SUPERADMIN', N'f0504dc7-b10b-4cd8-a019-2a66325a7b92')
INSERT [dbo].[AspNetRoles] ([Id], [Name], [NormalizedName], [ConcurrencyStamp]) VALUES (N'bf7218ea-cf15-4a5c-81d3-edf478b1e1f0', N'Member', N'MEMBER', N'7ebae64b-226c-4bba-ade2-ff9258ccc08d')
GO
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'589801cd-0b3e-4497-82b4-1943dea3f9d2', N'422197c6-34fb-449c-b126-2616cbb2ceee')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'9d95be86-b754-4ea4-8321-4b0c16f37289', N'95594407-2471-405f-88e2-b4dfc3950d97')
INSERT [dbo].[AspNetUserRoles] ([UserId], [RoleId]) VALUES (N'e2ff703c-f3d2-459b-be7c-bafe08c889bc', N'bf7218ea-cf15-4a5c-81d3-edf478b1e1f0')
GO
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Surame], [Age], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Status]) VALUES (N'589801cd-0b3e-4497-82b4-1943dea3f9d2', N'Gunel', N'Mustafa', 20, N'gunel', N'GUNEL', N'gunel@code.ed.az', N'GUNEL@CODE.ED.AZ', 0, N'AQAAAAEAACcQAAAAEOTYuhZVeVGoIxjanntrcKqY+aiN8Y7gYwZpHmFLRDsVY+vImzdPmetG5uNxgtLMRw==', N'T7LQSV7SCHLUV35JVX2FWM3DZWMO3SFY', N'edc2461b-48d5-446b-b444-1ef4b73daa1e', NULL, 0, 0, NULL, 1, 0, 1)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Surame], [Age], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Status]) VALUES (N'9d95be86-b754-4ea4-8321-4b0c16f37289', N'Mamed', N'Aliyev', 22, N'Mamed', N'MAMED', N'Mamed@code.edu.az', N'MAMED@CODE.EDU.AZ', 0, N'AQAAAAEAACcQAAAAEPw2ss+jCjXWrqJ5Qgce6sZ3l3NBPQDb9xOK7pbLH/xLNffaBeolGRs/Wv2U5hSsJA==', N'462HORDJSVXJLOVHLCRTBQ2TGVYGACLW', N'227b4390-dc69-4e2e-8dbc-093b944b9d78', NULL, 0, 0, NULL, 1, 0, 1)
INSERT [dbo].[AspNetUsers] ([Id], [Name], [Surame], [Age], [UserName], [NormalizedUserName], [Email], [NormalizedEmail], [EmailConfirmed], [PasswordHash], [SecurityStamp], [ConcurrencyStamp], [PhoneNumber], [PhoneNumberConfirmed], [TwoFactorEnabled], [LockoutEnd], [LockoutEnabled], [AccessFailedCount], [Status]) VALUES (N'e2ff703c-f3d2-459b-be7c-bafe08c889bc', N'Ali', N'Mammadov', 21, N'Ali', N'ALI', N'Ali@code.edu.az', N'ALI@CODE.EDU.AZ', 0, N'AQAAAAEAACcQAAAAENNqxhaYZnM4M9tSgiYZUX7zrS26/RH504JUqK6Qnf2JML6lEy9+OCW+eamq3ndr+w==', N'HANSKEXOGPCUW2FVNXFVITBZJAA33BXT', N'241721dd-b298-464d-92d6-97da99089c86', NULL, 0, 0, NULL, 1, 0, 1)
GO
SET IDENTITY_INSERT [dbo].[contacts] ON 

INSERT [dbo].[contacts] ([Id], [CustomerName], [CustomerSurname], [CustomerPhone], [CustomerEmail], [CustomerAddress], [CustomerMessage], [Date]) VALUES (12, N'Gunel', N'Mustafa', N'0501234567', N'gunel@code.edu.az', N'Baku', N'salam', CAST(N'2022-08-14T22:18:51.2194247' AS DateTime2))
INSERT [dbo].[contacts] ([Id], [CustomerName], [CustomerSurname], [CustomerPhone], [CustomerEmail], [CustomerAddress], [CustomerMessage], [Date]) VALUES (13, N'Ali', N'Aliyev', N'0509876543', N'ali@code.edu.az', N'Baku', N'salam', CAST(N'2022-08-14T22:24:34.5203897' AS DateTime2))
INSERT [dbo].[contacts] ([Id], [CustomerName], [CustomerSurname], [CustomerPhone], [CustomerEmail], [CustomerAddress], [CustomerMessage], [Date]) VALUES (14, N'Ali', N'Aliyev', N'0509876543', N'ali@code.edu.az', N'Baku', N'salam', CAST(N'2022-08-14T22:34:02.0162410' AS DateTime2))
SET IDENTITY_INSERT [dbo].[contacts] OFF
GO
SET IDENTITY_INSERT [dbo].[employees] ON 

INSERT [dbo].[employees] ([Id], [Name], [Position], [Twitter], [Facebook], [Instagram], [Linkedin], [Image]) VALUES (1, N'Walter White', N'Chief Executive Officer', N'#', N'#', N'#', N'#', N'team-1.jpg')
INSERT [dbo].[employees] ([Id], [Name], [Position], [Twitter], [Facebook], [Instagram], [Linkedin], [Image]) VALUES (14, N'Sarah Jhonson', N'Product Manager', N'#', N'#', N'#', N'#', N'team-2.jpg')
INSERT [dbo].[employees] ([Id], [Name], [Position], [Twitter], [Facebook], [Instagram], [Linkedin], [Image]) VALUES (21, N'William John', N'CTO', N'#', N'#', N'#', N'#', N'team-3.jpg')
INSERT [dbo].[employees] ([Id], [Name], [Position], [Twitter], [Facebook], [Instagram], [Linkedin], [Image]) VALUES (22, N'Amanda Jepson', N'Accountant', N'#', N'#', N'#', N'#', N'team-4.jpg')
SET IDENTITY_INSERT [dbo].[employees] OFF
GO
SET IDENTITY_INSERT [dbo].[main] ON 

INSERT [dbo].[main] ([Id], [Image], [Heading]) VALUES (1, N'abitbig.png', N'Soleil - Online Fashion Company')
SET IDENTITY_INSERT [dbo].[main] OFF
GO
SET IDENTITY_INSERT [dbo].[orderItems] ON 

INSERT [dbo].[orderItems] ([Id], [OrderId], [ProductId], [Count]) VALUES (1, 1, 21, 1)
INSERT [dbo].[orderItems] ([Id], [OrderId], [ProductId], [Count]) VALUES (2, 2, 28, 2)
INSERT [dbo].[orderItems] ([Id], [OrderId], [ProductId], [Count]) VALUES (3, 3, 29, 2)
INSERT [dbo].[orderItems] ([Id], [OrderId], [ProductId], [Count]) VALUES (4, 4, 28, 1)
INSERT [dbo].[orderItems] ([Id], [OrderId], [ProductId], [Count]) VALUES (5, 5, 27, 2)
INSERT [dbo].[orderItems] ([Id], [OrderId], [ProductId], [Count]) VALUES (6, 6, 28, 1)
INSERT [dbo].[orderItems] ([Id], [OrderId], [ProductId], [Count]) VALUES (7, 7, 29, 1)
INSERT [dbo].[orderItems] ([Id], [OrderId], [ProductId], [Count]) VALUES (9, 9, 29, 3)
SET IDENTITY_INSERT [dbo].[orderItems] OFF
GO
SET IDENTITY_INSERT [dbo].[orders] ON 

INSERT [dbo].[orders] ([Id], [Email], [Address]) VALUES (1, N'gunel@code.edu.az', N'Baku')
INSERT [dbo].[orders] ([Id], [Email], [Address]) VALUES (2, N'gunel.mustafa@bk.ru', N'London')
INSERT [dbo].[orders] ([Id], [Email], [Address]) VALUES (3, N'gunel.mustafayeva.2000@bk.ru', N'London')
INSERT [dbo].[orders] ([Id], [Email], [Address]) VALUES (4, N'mustafaferhad657@gmail.com', N'Paris')
INSERT [dbo].[orders] ([Id], [Email], [Address]) VALUES (5, N'mustafaferhad657@gmail.com', N'Paris')
INSERT [dbo].[orders] ([Id], [Email], [Address]) VALUES (6, N'gunel.mustafayeva.2000@bk.ru', N'Paris')
INSERT [dbo].[orders] ([Id], [Email], [Address]) VALUES (7, N'gunel.mustafayeva.2000@bk.ru', N'Paris')
INSERT [dbo].[orders] ([Id], [Email], [Address]) VALUES (8, N'gunel@code.edu.az', N'London')
INSERT [dbo].[orders] ([Id], [Email], [Address]) VALUES (9, N'ali@code.edu.az', N'Qebele')
SET IDENTITY_INSERT [dbo].[orders] OFF
GO
SET IDENTITY_INSERT [dbo].[productCategories] ON 

INSERT [dbo].[productCategories] ([Id], [Name]) VALUES (3, N'Jewelry')
INSERT [dbo].[productCategories] ([Id], [Name]) VALUES (5, N'Woman')
INSERT [dbo].[productCategories] ([Id], [Name]) VALUES (6, N'Man')
INSERT [dbo].[productCategories] ([Id], [Name]) VALUES (1004, N'Parfumes')
INSERT [dbo].[productCategories] ([Id], [Name]) VALUES (1006, N'Hair')
INSERT [dbo].[productCategories] ([Id], [Name]) VALUES (1007, N'Skin')
SET IDENTITY_INSERT [dbo].[productCategories] OFF
GO
SET IDENTITY_INSERT [dbo].[products] ON 

INSERT [dbo].[products] ([Id], [Image], [Name], [Price], [Size1], [Size2], [Size3], [Size4], [Size5], [Size6], [ProductCategoryId]) VALUES (1, N'jewellery.webp', N'Jewelry 1', 100, N'No Size', N'No Size', N'No Size', N'No Size', N'No Size', N'No Size', 3)
INSERT [dbo].[products] ([Id], [Image], [Name], [Price], [Size1], [Size2], [Size3], [Size4], [Size5], [Size6], [ProductCategoryId]) VALUES (3, N'yarasa.webp', N'Jewelry 2', 120, N'No Size', N'No Size', N'No Size', N'No Size', N'No Size', N'No Size', 3)
INSERT [dbo].[products] ([Id], [Image], [Name], [Price], [Size1], [Size2], [Size3], [Size4], [Size5], [Size6], [ProductCategoryId]) VALUES (4, N'FloralOrkide.jpg', N'Jewelry 3', 110, N'No Size', N'No Size', N'No Size', N'No Size', N'No Size', N'No Size', 3)
INSERT [dbo].[products] ([Id], [Image], [Name], [Price], [Size1], [Size2], [Size3], [Size4], [Size5], [Size6], [ProductCategoryId]) VALUES (16, N'artgooKadinHasir.webp', N'Shoes 1', 150, N'37', N'38', N'39', N'40', N'41', N'42', 5)
INSERT [dbo].[products] ([Id], [Image], [Name], [Price], [Size1], [Size2], [Size3], [Size4], [Size5], [Size6], [ProductCategoryId]) VALUES (17, N'oblavionSnicker.webp', N'Shoes 2', 130, N'37', N'38', N'39', N'40', N'41', N'42', 6)
INSERT [dbo].[products] ([Id], [Image], [Name], [Price], [Size1], [Size2], [Size3], [Size4], [Size5], [Size6], [ProductCategoryId]) VALUES (18, N'kaymazTabanTerlik.webp', N'Shoes 3', 160, N'37', N'38', N'39', N'40', N'41', N'42', 5)
INSERT [dbo].[products] ([Id], [Image], [Name], [Price], [Size1], [Size2], [Size3], [Size4], [Size5], [Size6], [ProductCategoryId]) VALUES (19, N'karlAndLauren.jpg', N'Shoes 4', 190, N'37', N'38', N'39', N'40', N'41', N'42', 5)
INSERT [dbo].[products] ([Id], [Image], [Name], [Price], [Size1], [Size2], [Size3], [Size4], [Size5], [Size6], [ProductCategoryId]) VALUES (20, N'sekizBirAlti.webp', N'T-Shirt 1', 170, N'XS', N'S', N'M', N'L', N'XL', N'XXL', 6)
INSERT [dbo].[products] ([Id], [Image], [Name], [Price], [Size1], [Size2], [Size3], [Size4], [Size5], [Size6], [ProductCategoryId]) VALUES (21, N'citluxErkek.webp', N'T-Shirt 2', 90, N'XS', N'S', N'M', N'L', N'XL', N'XXL', 6)
INSERT [dbo].[products] ([Id], [Image], [Name], [Price], [Size1], [Size2], [Size3], [Size4], [Size5], [Size6], [ProductCategoryId]) VALUES (23, N'beniSenCompany.webp', N'T-Shirt 4', 200, N'XS', N'S', N'M', N'L', N'XL', N'XXL', 5)
INSERT [dbo].[products] ([Id], [Image], [Name], [Price], [Size1], [Size2], [Size3], [Size4], [Size5], [Size6], [ProductCategoryId]) VALUES (25, N'newWhiteBlack.jpg', N'Shoes 5', 300, N'37', N'38', N'39', N'40', N'41', N'42', 6)
INSERT [dbo].[products] ([Id], [Image], [Name], [Price], [Size1], [Size2], [Size3], [Size4], [Size5], [Size6], [ProductCategoryId]) VALUES (27, N'jewellery.jpg', N'Jewelry 5', 500, N'No Size', N'No Size', N'No Size', N'No Size', N'No Size', N'No Size', 3)
INSERT [dbo].[products] ([Id], [Image], [Name], [Price], [Size1], [Size2], [Size3], [Size4], [Size5], [Size6], [ProductCategoryId]) VALUES (28, N'shirts.jpg', N'T-Shirt 5', 210, N'XS', N'S', N'M', N'L', N'XL', N'XXL', 5)
INSERT [dbo].[products] ([Id], [Image], [Name], [Price], [Size1], [Size2], [Size3], [Size4], [Size5], [Size6], [ProductCategoryId]) VALUES (29, N'shoes.webp', N'Shoes 5', 290, N'37', N'38', N'39', N'40', N'41', N'42', 5)
INSERT [dbo].[products] ([Id], [Image], [Name], [Price], [Size1], [Size2], [Size3], [Size4], [Size5], [Size6], [ProductCategoryId]) VALUES (1016, N'AquaDiPolo.webp', N'Aqua Di Polo', 200, N'30ml', N'40ml', N'50ml', N'90ml', N'100ml', N'125ml', 1004)
INSERT [dbo].[products] ([Id], [Image], [Name], [Price], [Size1], [Size2], [Size3], [Size4], [Size5], [Size6], [ProductCategoryId]) VALUES (1019, N'LePassionWoman.jpg', N'Le Passion', 300, N'30ml', N'40ml', N'50ml', N'90ml', N'100ml', N'125ml', 1004)
INSERT [dbo].[products] ([Id], [Image], [Name], [Price], [Size1], [Size2], [Size3], [Size4], [Size5], [Size6], [ProductCategoryId]) VALUES (1020, N'NobleBouquet.webp', N'Noble Bouquet', 900, N'30ml', N'40ml', N'50ml', N'90ml', N'100ml', N'125ml', 1004)
INSERT [dbo].[products] ([Id], [Image], [Name], [Price], [Size1], [Size2], [Size3], [Size4], [Size5], [Size6], [ProductCategoryId]) VALUES (1022, N'FarmasiHera.webp', N'Farmasi Hera', 800, N'30ml', N'40ml', N'50ml', N'90ml', N'100ml', N'125ml', 1004)
INSERT [dbo].[products] ([Id], [Image], [Name], [Price], [Size1], [Size2], [Size3], [Size4], [Size5], [Size6], [ProductCategoryId]) VALUES (1023, N'LongoseArganOil.jpg', N'Longose Argan Oil', 700, N'30ml', N'40ml', N'50ml', N'90ml', N'100ml', N'125ml', 1006)
INSERT [dbo].[products] ([Id], [Image], [Name], [Price], [Size1], [Size2], [Size3], [Size4], [Size5], [Size6], [ProductCategoryId]) VALUES (1024, N'CarpinoMacadamiaNutOil.jpg', N'Carpino Nut Oil', 768, N'30ml', N'40ml', N'50ml', N'90ml', N'100ml', N'125ml', 1006)
INSERT [dbo].[products] ([Id], [Image], [Name], [Price], [Size1], [Size2], [Size3], [Size4], [Size5], [Size6], [ProductCategoryId]) VALUES (1025, N'ByDuccaSerumBamboo.jpg', N'By Ducca Serum Bamboo', 825, N'30ml', N'40ml', N'50ml', N'90ml', N'100ml', N'125ml', 1006)
INSERT [dbo].[products] ([Id], [Image], [Name], [Price], [Size1], [Size2], [Size3], [Size4], [Size5], [Size6], [ProductCategoryId]) VALUES (1026, N'EvoqueSmartKeratin.jpg', N'Evoque Smart Keratin', 665, N'30ml', N'40ml', N'50ml', N'90ml', N'100ml', N'125ml', 1006)
INSERT [dbo].[products] ([Id], [Image], [Name], [Price], [Size1], [Size2], [Size3], [Size4], [Size5], [Size6], [ProductCategoryId]) VALUES (1028, N'OlliaAromatherapy.jpg', N'Ollia Aromatherapy', 435, N'30ml', N'40ml', N'50ml', N'90ml', N'100ml', N'125ml', 1007)
INSERT [dbo].[products] ([Id], [Image], [Name], [Price], [Size1], [Size2], [Size3], [Size4], [Size5], [Size6], [ProductCategoryId]) VALUES (1029, N'JigottAloeVera.jpg', N'Jigott Aloe Vera', 328, N'30ml', N'40ml', N'50ml', N'90ml', N'100ml', N'125ml', 1007)
INSERT [dbo].[products] ([Id], [Image], [Name], [Price], [Size1], [Size2], [Size3], [Size4], [Size5], [Size6], [ProductCategoryId]) VALUES (1030, N'JigottSensitiveSkin.jpg', N'Jigott Sensitive Skin', 556, N'30ml', N'40ml', N'50ml', N'90ml', N'100ml', N'125ml', 1007)
INSERT [dbo].[products] ([Id], [Image], [Name], [Price], [Size1], [Size2], [Size3], [Size4], [Size5], [Size6], [ProductCategoryId]) VALUES (1031, N'iUNIKBetaGlucan.jpg', N'iUNIK Beta Glucan', 765, N'30ml', N'40ml', N'50ml', N'90ml', N'100ml', N'125ml', 1007)
INSERT [dbo].[products] ([Id], [Image], [Name], [Price], [Size1], [Size2], [Size3], [Size4], [Size5], [Size6], [ProductCategoryId]) VALUES (1032, N'OversizeCoat.webp', N'Oversize Pink Coat', 912, N'XS', N'S', N'M', N'L', N'XL', N'XXL', 5)
INSERT [dbo].[products] ([Id], [Image], [Name], [Price], [Size1], [Size2], [Size3], [Size4], [Size5], [Size6], [ProductCategoryId]) VALUES (1035, N'OshebuCrop.webp', N'Oshebu Crop', 213, N'XS', N'S', N'M', N'L', N'XL', N'XXL', 5)
SET IDENTITY_INSERT [dbo].[products] OFF
GO
SET IDENTITY_INSERT [dbo].[slides] ON 

INSERT [dbo].[slides] ([Id], [Title], [Image]) VALUES (1, N'T-Shirts', N'shirts.jpg')
INSERT [dbo].[slides] ([Id], [Title], [Image]) VALUES (2, N'Jewellery', N'jewellery.jpg')
INSERT [dbo].[slides] ([Id], [Title], [Image]) VALUES (3, N'Shoes', N'shoes.webp')
INSERT [dbo].[slides] ([Id], [Title], [Image]) VALUES (4, N'Coats', N'coat.webp')
INSERT [dbo].[slides] ([Id], [Title], [Image]) VALUES (5, N'Boots', N'boots.jfif')
INSERT [dbo].[slides] ([Id], [Title], [Image]) VALUES (6, N'Prom Dress', N'prom.jpeg')
SET IDENTITY_INSERT [dbo].[slides] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetRoleClaims_RoleId]    Script Date: 8/28/2022 9:56:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetRoleClaims_RoleId] ON [dbo].[AspNetRoleClaims]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [RoleNameIndex]    Script Date: 8/28/2022 9:56:26 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [RoleNameIndex] ON [dbo].[AspNetRoles]
(
	[NormalizedName] ASC
)
WHERE ([NormalizedName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserClaims_UserId]    Script Date: 8/28/2022 9:56:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserClaims_UserId] ON [dbo].[AspNetUserClaims]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserLogins_UserId]    Script Date: 8/28/2022 9:56:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserLogins_UserId] ON [dbo].[AspNetUserLogins]
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_AspNetUserRoles_RoleId]    Script Date: 8/28/2022 9:56:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_AspNetUserRoles_RoleId] ON [dbo].[AspNetUserRoles]
(
	[RoleId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [EmailIndex]    Script Date: 8/28/2022 9:56:26 PM ******/
CREATE NONCLUSTERED INDEX [EmailIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedEmail] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UserNameIndex]    Script Date: 8/28/2022 9:56:26 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UserNameIndex] ON [dbo].[AspNetUsers]
(
	[NormalizedUserName] ASC
)
WHERE ([NormalizedUserName] IS NOT NULL)
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_orderItems_OrderId]    Script Date: 8/28/2022 9:56:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_orderItems_OrderId] ON [dbo].[orderItems]
(
	[OrderId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_orderItems_ProductId]    Script Date: 8/28/2022 9:56:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_orderItems_ProductId] ON [dbo].[orderItems]
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
/****** Object:  Index [IX_products_ProductCategoryId]    Script Date: 8/28/2022 9:56:26 PM ******/
CREATE NONCLUSTERED INDEX [IX_products_ProductCategoryId] ON [dbo].[products]
(
	[ProductCategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[about] ADD  DEFAULT (N'') FOR [Image]
GO
ALTER TABLE [dbo].[about] ADD  DEFAULT (N'') FOR [Title]
GO
ALTER TABLE [dbo].[about] ADD  DEFAULT (N'') FOR [Text]
GO
ALTER TABLE [dbo].[AspNetUsers] ADD  DEFAULT (CONVERT([bit],(1))) FOR [Status]
GO
ALTER TABLE [dbo].[contacts] ADD  DEFAULT (N'') FOR [CustomerName]
GO
ALTER TABLE [dbo].[contacts] ADD  DEFAULT (N'') FOR [CustomerSurname]
GO
ALTER TABLE [dbo].[contacts] ADD  DEFAULT (N'') FOR [CustomerPhone]
GO
ALTER TABLE [dbo].[contacts] ADD  DEFAULT (N'') FOR [CustomerEmail]
GO
ALTER TABLE [dbo].[contacts] ADD  DEFAULT (N'') FOR [CustomerAddress]
GO
ALTER TABLE [dbo].[contacts] ADD  DEFAULT (N'') FOR [CustomerMessage]
GO
ALTER TABLE [dbo].[main] ADD  DEFAULT (N'') FOR [Image]
GO
ALTER TABLE [dbo].[main] ADD  DEFAULT (N'') FOR [Heading]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT (N'') FOR [Email]
GO
ALTER TABLE [dbo].[orders] ADD  DEFAULT (N'') FOR [Address]
GO
ALTER TABLE [dbo].[productCategories] ADD  DEFAULT (N'') FOR [Name]
GO
ALTER TABLE [dbo].[products] ADD  DEFAULT (N'') FOR [Image]
GO
ALTER TABLE [dbo].[products] ADD  DEFAULT (N'') FOR [Name]
GO
ALTER TABLE [dbo].[AspNetRoleClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetRoleClaims] CHECK CONSTRAINT [FK_AspNetRoleClaims_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserClaims]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserClaims] CHECK CONSTRAINT [FK_AspNetUserClaims_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserLogins]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserLogins] CHECK CONSTRAINT [FK_AspNetUserLogins_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [dbo].[AspNetRoles] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetRoles_RoleId]
GO
ALTER TABLE [dbo].[AspNetUserRoles]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserRoles] CHECK CONSTRAINT [FK_AspNetUserRoles_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[AspNetUserTokens]  WITH CHECK ADD  CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId] FOREIGN KEY([UserId])
REFERENCES [dbo].[AspNetUsers] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[AspNetUserTokens] CHECK CONSTRAINT [FK_AspNetUserTokens_AspNetUsers_UserId]
GO
ALTER TABLE [dbo].[orderItems]  WITH CHECK ADD  CONSTRAINT [FK_orderItems_orders_OrderId] FOREIGN KEY([OrderId])
REFERENCES [dbo].[orders] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[orderItems] CHECK CONSTRAINT [FK_orderItems_orders_OrderId]
GO
ALTER TABLE [dbo].[orderItems]  WITH CHECK ADD  CONSTRAINT [FK_orderItems_products_ProductId] FOREIGN KEY([ProductId])
REFERENCES [dbo].[products] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[orderItems] CHECK CONSTRAINT [FK_orderItems_products_ProductId]
GO
ALTER TABLE [dbo].[products]  WITH CHECK ADD  CONSTRAINT [FK_products_productCategories_ProductCategoryId] FOREIGN KEY([ProductCategoryId])
REFERENCES [dbo].[productCategories] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[products] CHECK CONSTRAINT [FK_products_productCategories_ProductCategoryId]
GO
USE [master]
GO
ALTER DATABASE [TenAugust] SET  READ_WRITE 
GO
