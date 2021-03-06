USE [master]
GO
/****** Object:  Database [ItemDB_20]    Script Date: 7/24/2016 12:36:26 PM ******/
CREATE DATABASE [ItemDB_20]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ItemDB_20', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\ItemDB_20.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ItemDB_20_log', FILENAME = N'c:\Program Files\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\ItemDB_20_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ItemDB_20] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ItemDB_20].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ItemDB_20] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ItemDB_20] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ItemDB_20] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ItemDB_20] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ItemDB_20] SET ARITHABORT OFF 
GO
ALTER DATABASE [ItemDB_20] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ItemDB_20] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [ItemDB_20] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ItemDB_20] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ItemDB_20] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ItemDB_20] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ItemDB_20] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ItemDB_20] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ItemDB_20] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ItemDB_20] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ItemDB_20] SET  DISABLE_BROKER 
GO
ALTER DATABASE [ItemDB_20] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ItemDB_20] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ItemDB_20] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ItemDB_20] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ItemDB_20] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ItemDB_20] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ItemDB_20] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ItemDB_20] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [ItemDB_20] SET  MULTI_USER 
GO
ALTER DATABASE [ItemDB_20] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ItemDB_20] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ItemDB_20] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ItemDB_20] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [ItemDB_20]
GO
/****** Object:  Table [dbo].[Categories]    Script Date: 7/24/2016 12:36:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Categories](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Items]    Script Date: 7/24/2016 12:36:26 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Items](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [varchar](50) NULL,
	[price] [decimal](18, 2) NULL,
	[category_id] [int] NULL,
 CONSTRAINT [PK_Items] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 

INSERT [dbo].[Categories] ([id], [name]) VALUES (1, N'Food')
INSERT [dbo].[Categories] ([id], [name]) VALUES (2, N'Beverage')
INSERT [dbo].[Categories] ([id], [name]) VALUES (3, N'Dessert')
SET IDENTITY_INSERT [dbo].[Categories] OFF
SET IDENTITY_INSERT [dbo].[Items] ON 

INSERT [dbo].[Items] ([id], [name], [price], [category_id]) VALUES (1, N'Burger', CAST(180.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Items] ([id], [name], [price], [category_id]) VALUES (2, N'Shwarma', CAST(220.00 AS Decimal(18, 2)), 1)
INSERT [dbo].[Items] ([id], [name], [price], [category_id]) VALUES (1002, N'Pepsi', CAST(90.00 AS Decimal(18, 2)), 2)
INSERT [dbo].[Items] ([id], [name], [price], [category_id]) VALUES (1003, N'Mountain Dew', CAST(30.00 AS Decimal(18, 2)), 2)
INSERT [dbo].[Items] ([id], [name], [price], [category_id]) VALUES (1004, N'Custard', CAST(250.00 AS Decimal(18, 2)), 3)
INSERT [dbo].[Items] ([id], [name], [price], [category_id]) VALUES (1005, N'Chocolate Sundae', CAST(250.00 AS Decimal(18, 2)), 3)
SET IDENTITY_INSERT [dbo].[Items] OFF
ALTER TABLE [dbo].[Items]  WITH CHECK ADD  CONSTRAINT [FK_Items_Categories] FOREIGN KEY([category_id])
REFERENCES [dbo].[Categories] ([id])
GO
ALTER TABLE [dbo].[Items] CHECK CONSTRAINT [FK_Items_Categories]
GO
USE [master]
GO
ALTER DATABASE [ItemDB_20] SET  READ_WRITE 
GO
