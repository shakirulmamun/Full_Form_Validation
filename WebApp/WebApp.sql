USE [master]
GO
/****** Object:  Database [WebApp]    Script Date: 11/29/2021 10:01:09 AM ******/
CREATE DATABASE [WebApp]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'WebApp', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\WebApp.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'WebApp_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL13.MSSQLSERVER\MSSQL\DATA\WebApp_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [WebApp] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [WebApp].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [WebApp] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [WebApp] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [WebApp] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [WebApp] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [WebApp] SET ARITHABORT OFF 
GO
ALTER DATABASE [WebApp] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [WebApp] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [WebApp] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [WebApp] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [WebApp] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [WebApp] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [WebApp] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [WebApp] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [WebApp] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [WebApp] SET  DISABLE_BROKER 
GO
ALTER DATABASE [WebApp] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [WebApp] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [WebApp] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [WebApp] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [WebApp] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [WebApp] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [WebApp] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [WebApp] SET RECOVERY FULL 
GO
ALTER DATABASE [WebApp] SET  MULTI_USER 
GO
ALTER DATABASE [WebApp] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [WebApp] SET DB_CHAINING OFF 
GO
ALTER DATABASE [WebApp] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [WebApp] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [WebApp] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'WebApp', N'ON'
GO
ALTER DATABASE [WebApp] SET QUERY_STORE = OFF
GO
USE [WebApp]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [WebApp]
GO
/****** Object:  Table [dbo].[tbl_Category]    Script Date: 11/29/2021 10:01:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Category](
	[CategoryId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_Category] PRIMARY KEY CLUSTERED 
(
	[CategoryId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_City]    Script Date: 11/29/2021 10:01:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_City](
	[CityId] [int] IDENTITY(1,1) NOT NULL,
	[CityName] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_City] PRIMARY KEY CLUSTERED 
(
	[CityId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_Product]    Script Date: 11/29/2021 10:01:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_Product](
	[ProductId] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tbl_User]    Script Date: 11/29/2021 10:01:10 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tbl_User](
	[UserId] [int] IDENTITY(1,1) NOT NULL,
	[UserName] [nvarchar](max) NULL,
	[Email] [nvarchar](max) NULL,
	[Password] [nvarchar](max) NULL,
	[Gender] [nvarchar](50) NULL,
	[IsInterestInCsharp] [bit] NULL,
	[IsInterestInJava] [bit] NULL,
	[IsInterestInPython] [bit] NULL,
	[CityId] [int] NULL,
	[DoB] [datetime] NULL,
	[ImagePath] [nvarchar](max) NULL,
 CONSTRAINT [PK_tbl_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[tbl_Category] ON 

INSERT [dbo].[tbl_Category] ([CategoryId], [Name], [Description]) VALUES (6, N'Programming', N'C#')
INSERT [dbo].[tbl_Category] ([CategoryId], [Name], [Description]) VALUES (7, N'Programming', N'MVC5')
INSERT [dbo].[tbl_Category] ([CategoryId], [Name], [Description]) VALUES (8, N'Adventure', N'Nobel1')
SET IDENTITY_INSERT [dbo].[tbl_Category] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_City] ON 

INSERT [dbo].[tbl_City] ([CityId], [CityName]) VALUES (1, N'Dhaka')
INSERT [dbo].[tbl_City] ([CityId], [CityName]) VALUES (2, N'Rangpur')
INSERT [dbo].[tbl_City] ([CityId], [CityName]) VALUES (3, N'Rajshahi')
INSERT [dbo].[tbl_City] ([CityId], [CityName]) VALUES (4, N'Khulna')
INSERT [dbo].[tbl_City] ([CityId], [CityName]) VALUES (5, N'Barishal')
SET IDENTITY_INSERT [dbo].[tbl_City] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_Product] ON 

INSERT [dbo].[tbl_Product] ([ProductId], [Name], [Description]) VALUES (1, N'Mobile', N'Electronics')
INSERT [dbo].[tbl_Product] ([ProductId], [Name], [Description]) VALUES (2, N'C#', N'Programming')
INSERT [dbo].[tbl_Product] ([ProductId], [Name], [Description]) VALUES (3, N'Java', N'Programming')
INSERT [dbo].[tbl_Product] ([ProductId], [Name], [Description]) VALUES (4, NULL, NULL)
SET IDENTITY_INSERT [dbo].[tbl_Product] OFF
GO
SET IDENTITY_INSERT [dbo].[tbl_User] ON 

INSERT [dbo].[tbl_User] ([UserId], [UserName], [Email], [Password], [Gender], [IsInterestInCsharp], [IsInterestInJava], [IsInterestInPython], [CityId], [DoB], [ImagePath]) VALUES (2, N'sawon', N'sawon@gmail.com', N'123', N'Male', 1, 1, 1, 1, CAST(N'2021-11-18T00:00:00.000' AS DateTime), N'~/images/OIP21062063.jpg')
INSERT [dbo].[tbl_User] ([UserId], [UserName], [Email], [Password], [Gender], [IsInterestInCsharp], [IsInterestInJava], [IsInterestInPython], [CityId], [DoB], [ImagePath]) VALUES (3, N'admin', N'admin@gmail.com', N'123', N'Male', 1, 1, 1, 4, CAST(N'2021-11-26T00:00:00.000' AS DateTime), N'~/images/OIP21283525.jpg')
INSERT [dbo].[tbl_User] ([UserId], [UserName], [Email], [Password], [Gender], [IsInterestInCsharp], [IsInterestInJava], [IsInterestInPython], [CityId], [DoB], [ImagePath]) VALUES (4, N'mou', N'mou@gmail.com', N'123', N'Female', 0, 1, 0, 2, CAST(N'2021-11-13T00:00:00.000' AS DateTime), N'~/images/OIP21055424.jpg')
INSERT [dbo].[tbl_User] ([UserId], [UserName], [Email], [Password], [Gender], [IsInterestInCsharp], [IsInterestInJava], [IsInterestInPython], [CityId], [DoB], [ImagePath]) VALUES (5, N'mamun', N'shakirulmamun125@gmail.com', N'123', N'Male', 1, 1, 1, 2, CAST(N'2021-11-06T00:00:00.000' AS DateTime), N'~/images/OIP21574141.jpg')
INSERT [dbo].[tbl_User] ([UserId], [UserName], [Email], [Password], [Gender], [IsInterestInCsharp], [IsInterestInJava], [IsInterestInPython], [CityId], [DoB], [ImagePath]) VALUES (6, N'sakib', N'sakib@gmail.com', N'123', N'Male', 0, 1, 1, 4, CAST(N'1996-08-05T00:00:00.000' AS DateTime), NULL)
SET IDENTITY_INSERT [dbo].[tbl_User] OFF
GO
ALTER TABLE [dbo].[tbl_User]  WITH CHECK ADD  CONSTRAINT [FK_tbl_User_tbl_City] FOREIGN KEY([CityId])
REFERENCES [dbo].[tbl_City] ([CityId])
GO
ALTER TABLE [dbo].[tbl_User] CHECK CONSTRAINT [FK_tbl_User_tbl_City]
GO
USE [master]
GO
ALTER DATABASE [WebApp] SET  READ_WRITE 
GO
