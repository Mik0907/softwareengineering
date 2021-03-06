USE [master]
GO
/****** Object:  Database [Storage]    Script Date: 27.11.2018 15:30:25 ******/
CREATE DATABASE [Storage]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Storage', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Storage.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Storage_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.MSSQLSERVER\MSSQL\DATA\Storage_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Storage] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Storage].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Storage] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Storage] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Storage] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Storage] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Storage] SET ARITHABORT OFF 
GO
ALTER DATABASE [Storage] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Storage] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Storage] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Storage] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Storage] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Storage] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Storage] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Storage] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Storage] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Storage] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Storage] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Storage] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Storage] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Storage] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Storage] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Storage] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Storage] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Storage] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Storage] SET  MULTI_USER 
GO
ALTER DATABASE [Storage] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Storage] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Storage] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Storage] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [Storage] SET DELAYED_DURABILITY = DISABLED 
GO
USE [Storage]
GO
/****** Object:  Table [dbo].[City]    Script Date: 27.11.2018 15:30:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[City](
	[PK_city] [uniqueidentifier] NOT NULL CONSTRAINT [DF_City_PK_city]  DEFAULT (newid()),
	[city_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_City] PRIMARY KEY CLUSTERED 
(
	[PK_city] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Delivery_method]    Script Date: 27.11.2018 15:30:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Delivery_method](
	[PK_delivery_method] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Delivery_method_PK_delivery_method]  DEFAULT (newid()),
	[name_DM] [nvarchar](max) NULL,
	[price_DM] [float] NULL,
 CONSTRAINT [PK_Delivery_method] PRIMARY KEY CLUSTERED 
(
	[PK_delivery_method] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Forwarder]    Script Date: 27.11.2018 15:30:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Forwarder](
	[PK_forwarder] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Forwarder_PK_forwarder]  DEFAULT (newid()),
	[FIO_f] [nvarchar](max) NULL,
	[FK_warehouses] [uniqueidentifier] NULL,
	[phone_f] [nvarchar](50) NULL,
	[passport_data] [nvarchar](50) NULL,
 CONSTRAINT [PK_Forwarder] PRIMARY KEY CLUSTERED 
(
	[PK_forwarder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Packaging]    Script Date: 27.11.2018 15:30:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Packaging](
	[PK_type_of_packaging] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Packaging_PK_type_of_packaging]  DEFAULT (newid()),
	[name_TOP] [nvarchar](max) NULL,
	[price_TOP] [float] NULL,
 CONSTRAINT [PK_Packaging] PRIMARY KEY CLUSTERED 
(
	[PK_type_of_packaging] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product]    Script Date: 27.11.2018 15:30:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[PK_product] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Product_PK_product]  DEFAULT (newid()),
	[name_product] [nvarchar](max) NULL,
	[FK_unit] [uniqueidentifier] NULL,
	[FK_product_category] [uniqueidentifier] NULL,
	[FK_warehouses] [uniqueidentifier] NULL,
	[price_product] [float] NULL,
	[date_of_manufacture] [date] NULL,
	[expiration_date] [date] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[PK_product] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Product_category]    Script Date: 27.11.2018 15:30:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product_category](
	[PK_product_category] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Product_category_PK_product_category]  DEFAULT (newid()),
	[name_PC] [nvarchar](max) NULL,
 CONSTRAINT [PK_Product_category] PRIMARY KEY CLUSTERED 
(
	[PK_product_category] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Provisioner]    Script Date: 27.11.2018 15:30:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Provisioner](
	[PK_provisioner] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Provisioner_PK_provisioner]  DEFAULT (newid()),
	[FK_city] [uniqueidentifier] NULL,
	[name_provisioner] [nvarchar](max) NULL,
 CONSTRAINT [PK_Storage] PRIMARY KEY CLUSTERED 
(
	[PK_provisioner] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Supply]    Script Date: 27.11.2018 15:30:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Supply](
	[PK_supply] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Supply_PK_supply]  DEFAULT (newid()),
	[FK_provisioner] [uniqueidentifier] NULL,
	[date_supply] [date] NULL,
	[number] [int] NULL,
	[FK_product] [uniqueidentifier] NULL,
	[FK_type_of_packaging] [uniqueidentifier] NULL,
	[FK_delivery_method] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Supply] PRIMARY KEY CLUSTERED 
(
	[PK_supply] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Unit]    Script Date: 27.11.2018 15:30:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Unit](
	[PK_unit] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Unit_PK_unit]  DEFAULT (newid()),
	[unit_name] [nvarchar](50) NULL,
 CONSTRAINT [PK_Unit] PRIMARY KEY CLUSTERED 
(
	[PK_unit] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Vacation_line]    Script Date: 27.11.2018 15:30:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Vacation_line](
	[PK_vacation_line] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Vacation_line_PK_vacation_line]  DEFAULT (newid()),
	[FK_product] [uniqueidentifier] NULL,
	[number_product] [int] NULL,
	[FK_warehouses] [uniqueidentifier] NULL,
	[date_VL] [date] NULL,
 CONSTRAINT [PK_Vacation_line] PRIMARY KEY CLUSTERED 
(
	[PK_vacation_line] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Warehouses]    Script Date: 27.11.2018 15:30:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Warehouses](
	[PK_warehouses] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Warehouses_PK_warehouses]  DEFAULT (newid()),
	[name_warehouses] [nvarchar](max) NULL,
	[address] [nvarchar](max) NULL,
	[phone] [float] NULL,
 CONSTRAINT [PK_Warehouses] PRIMARY KEY CLUSTERED 
(
	[PK_warehouses] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
ALTER TABLE [dbo].[Forwarder]  WITH CHECK ADD  CONSTRAINT [FK_Forwarder_Warehouses] FOREIGN KEY([FK_warehouses])
REFERENCES [dbo].[Warehouses] ([PK_warehouses])
GO
ALTER TABLE [dbo].[Forwarder] CHECK CONSTRAINT [FK_Forwarder_Warehouses]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Product_category] FOREIGN KEY([FK_product_category])
REFERENCES [dbo].[Product_category] ([PK_product_category])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Product_category]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Unit] FOREIGN KEY([FK_unit])
REFERENCES [dbo].[Unit] ([PK_unit])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Unit]
GO
ALTER TABLE [dbo].[Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Warehouses] FOREIGN KEY([FK_warehouses])
REFERENCES [dbo].[Warehouses] ([PK_warehouses])
GO
ALTER TABLE [dbo].[Product] CHECK CONSTRAINT [FK_Product_Warehouses]
GO
ALTER TABLE [dbo].[Provisioner]  WITH CHECK ADD  CONSTRAINT [FK_Provisioner_City] FOREIGN KEY([FK_city])
REFERENCES [dbo].[City] ([PK_city])
GO
ALTER TABLE [dbo].[Provisioner] CHECK CONSTRAINT [FK_Provisioner_City]
GO
ALTER TABLE [dbo].[Supply]  WITH CHECK ADD  CONSTRAINT [FK_Supply_Delivery_method] FOREIGN KEY([FK_delivery_method])
REFERENCES [dbo].[Delivery_method] ([PK_delivery_method])
GO
ALTER TABLE [dbo].[Supply] CHECK CONSTRAINT [FK_Supply_Delivery_method]
GO
ALTER TABLE [dbo].[Supply]  WITH CHECK ADD  CONSTRAINT [FK_Supply_Packaging] FOREIGN KEY([FK_type_of_packaging])
REFERENCES [dbo].[Packaging] ([PK_type_of_packaging])
GO
ALTER TABLE [dbo].[Supply] CHECK CONSTRAINT [FK_Supply_Packaging]
GO
ALTER TABLE [dbo].[Supply]  WITH CHECK ADD  CONSTRAINT [FK_Supply_Product] FOREIGN KEY([FK_product])
REFERENCES [dbo].[Product] ([PK_product])
GO
ALTER TABLE [dbo].[Supply] CHECK CONSTRAINT [FK_Supply_Product]
GO
ALTER TABLE [dbo].[Supply]  WITH CHECK ADD  CONSTRAINT [FK_Supply_Provisioner] FOREIGN KEY([FK_provisioner])
REFERENCES [dbo].[Provisioner] ([PK_provisioner])
GO
ALTER TABLE [dbo].[Supply] CHECK CONSTRAINT [FK_Supply_Provisioner]
GO
ALTER TABLE [dbo].[Vacation_line]  WITH CHECK ADD  CONSTRAINT [FK_Vacation_line_Product] FOREIGN KEY([FK_product])
REFERENCES [dbo].[Product] ([PK_product])
GO
ALTER TABLE [dbo].[Vacation_line] CHECK CONSTRAINT [FK_Vacation_line_Product]
GO
ALTER TABLE [dbo].[Vacation_line]  WITH CHECK ADD  CONSTRAINT [FK_Vacation_line_Warehouses] FOREIGN KEY([FK_warehouses])
REFERENCES [dbo].[Warehouses] ([PK_warehouses])
GO
ALTER TABLE [dbo].[Vacation_line] CHECK CONSTRAINT [FK_Vacation_line_Warehouses]
GO
USE [master]
GO
ALTER DATABASE [Storage] SET  READ_WRITE 
GO
