USE [master]
GO
/****** Object:  Database [Car Rental system]    Script Date: 6/12/2020 10:39:29 PM ******/
CREATE DATABASE [Car Rental system]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Car Rental system', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Car Rental system.mdf' , SIZE = 3072KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Car Rental system_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Car Rental system_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Car Rental system] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Car Rental system].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Car Rental system] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Car Rental system] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Car Rental system] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Car Rental system] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Car Rental system] SET ARITHABORT OFF 
GO
ALTER DATABASE [Car Rental system] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Car Rental system] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Car Rental system] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Car Rental system] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Car Rental system] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Car Rental system] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Car Rental system] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Car Rental system] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Car Rental system] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Car Rental system] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Car Rental system] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Car Rental system] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Car Rental system] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Car Rental system] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Car Rental system] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Car Rental system] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Car Rental system] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Car Rental system] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Car Rental system] SET  MULTI_USER 
GO
ALTER DATABASE [Car Rental system] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Car Rental system] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Car Rental system] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Car Rental system] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Car Rental system] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Car Rental system]
GO
/****** Object:  Table [dbo].[cars]    Script Date: 6/12/2020 10:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cars](
	[carid] [int] NOT NULL,
	[type] [nvarchar](100) NOT NULL,
	[color] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_cars] PRIMARY KEY CLUSTERED 
(
	[carid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[customer]    Script Date: 6/12/2020 10:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[customerid] [int] NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[address] [nvarchar](max) NOT NULL,
	[PhoneNumder] [int] NOT NULL,
 CONSTRAINT [PK_customer] PRIMARY KEY CLUSTERED 
(
	[customerid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[office]    Script Date: 6/12/2020 10:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[office](
	[officeid] [int] NOT NULL,
	[city] [nvarchar](100) NOT NULL,
	[location] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_office] PRIMARY KEY CLUSTERED 
(
	[officeid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Rental]    Script Date: 6/12/2020 10:39:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rental](
	[Rentalid] [int] NOT NULL,
	[datePickUp] [date] NOT NULL,
	[ReturnDate] [date] NOT NULL,
	[carid] [int] NOT NULL,
	[customerid] [int] NOT NULL,
	[officeid] [int] NOT NULL,
 CONSTRAINT [PK_Rental] PRIMARY KEY CLUSTERED 
(
	[Rentalid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
ALTER TABLE [dbo].[Rental]  WITH CHECK ADD  CONSTRAINT [FK_Rental_cars] FOREIGN KEY([carid])
REFERENCES [dbo].[cars] ([carid])
GO
ALTER TABLE [dbo].[Rental] CHECK CONSTRAINT [FK_Rental_cars]
GO
ALTER TABLE [dbo].[Rental]  WITH CHECK ADD  CONSTRAINT [FK_Rental_customer] FOREIGN KEY([customerid])
REFERENCES [dbo].[customer] ([customerid])
GO
ALTER TABLE [dbo].[Rental] CHECK CONSTRAINT [FK_Rental_customer]
GO
ALTER TABLE [dbo].[Rental]  WITH CHECK ADD  CONSTRAINT [FK_Rental_office] FOREIGN KEY([officeid])
REFERENCES [dbo].[office] ([officeid])
GO
ALTER TABLE [dbo].[Rental] CHECK CONSTRAINT [FK_Rental_office]
GO
USE [master]
GO
ALTER DATABASE [Car Rental system] SET  READ_WRITE 
GO
