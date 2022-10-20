USE [master]
GO
/****** Object:  Database [store_management]    Script Date: 10/20/2022 5:32:46 PM ******/
CREATE DATABASE [store_management]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'store_management', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\store_management.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'store_management_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\store_management_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [store_management] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [store_management].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [store_management] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [store_management] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [store_management] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [store_management] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [store_management] SET ARITHABORT OFF 
GO
ALTER DATABASE [store_management] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [store_management] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [store_management] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [store_management] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [store_management] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [store_management] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [store_management] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [store_management] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [store_management] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [store_management] SET  ENABLE_BROKER 
GO
ALTER DATABASE [store_management] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [store_management] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [store_management] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [store_management] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [store_management] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [store_management] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [store_management] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [store_management] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [store_management] SET  MULTI_USER 
GO
ALTER DATABASE [store_management] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [store_management] SET DB_CHAINING OFF 
GO
ALTER DATABASE [store_management] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [store_management] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [store_management] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [store_management] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [store_management] SET QUERY_STORE = OFF
GO
USE [store_management]
GO
/****** Object:  Table [dbo].[customer]    Script Date: 10/20/2022 5:32:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customer](
	[id] [varchar](10) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[address] [nvarchar](200) NOT NULL,
	[phone_number] [varchar](11) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[material]    Script Date: 10/20/2022 5:32:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[material](
	[id] [varchar](10) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product]    Script Date: 10/20/2022 5:32:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product](
	[id] [varchar](10) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[material_id] [varchar](10) NULL,
	[amount] [int] NULL,
	[import_price] [money] NOT NULL,
	[sale_price] [money] NOT NULL,
	[image_url] [varchar](255) NULL,
	[note] [nvarchar](100) NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sale_receipt]    Script Date: 10/20/2022 5:32:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sale_receipt](
	[id] [varchar](50) NOT NULL,
	[staff_id] [varchar](10) NULL,
	[customer_id] [varchar](10) NULL,
	[sale_date] [date] NOT NULL,
	[total] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sale_receipt_detail]    Script Date: 10/20/2022 5:32:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sale_receipt_detail](
	[sale_receipt_id] [varchar](50) NULL,
	[product_id] [varchar](10) NULL,
	[quantity] [int] NOT NULL,
	[price] [money] NOT NULL,
	[discount] [money] NULL,
	[unit_price] [money] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[staff]    Script Date: 10/20/2022 5:32:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[staff](
	[id] [varchar](10) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[email] [varchar](50) NOT NULL,
	[password] [varchar](50) NOT NULL,
	[address] [nvarchar](200) NOT NULL,
	[phone_number] [varchar](11) NOT NULL,
	[gender] [bit] NOT NULL,
	[dob] [date] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[product]  WITH CHECK ADD FOREIGN KEY([material_id])
REFERENCES [dbo].[material] ([id])
GO
ALTER TABLE [dbo].[sale_receipt]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[customer] ([id])
GO
ALTER TABLE [dbo].[sale_receipt]  WITH CHECK ADD FOREIGN KEY([staff_id])
REFERENCES [dbo].[staff] ([id])
GO
ALTER TABLE [dbo].[sale_receipt_detail]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[product] ([id])
GO
ALTER TABLE [dbo].[sale_receipt_detail]  WITH CHECK ADD FOREIGN KEY([sale_receipt_id])
REFERENCES [dbo].[sale_receipt] ([id])
GO
USE [master]
GO
ALTER DATABASE [store_management] SET  READ_WRITE 
GO
