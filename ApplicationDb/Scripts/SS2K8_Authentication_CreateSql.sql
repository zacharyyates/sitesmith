USE [master]
GO
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'SiteSmith.Authentication')
BEGIN
CREATE DATABASE [SiteSmith.Authentication] ON  PRIMARY 
( NAME = N'SiteSmith.Authentication', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL.2\MSSQL\DATA\SiteSmith.Authentication.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SiteSmith.Authentication_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL.2\MSSQL\DATA\SiteSmith.Authentication_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END

GO
EXEC dbo.sp_dbcmptlevel @dbname=N'SiteSmith.Authentication', @new_cmptlevel=90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SiteSmith.Authentication].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SiteSmith.Authentication] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SiteSmith.Authentication] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SiteSmith.Authentication] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SiteSmith.Authentication] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SiteSmith.Authentication] SET ARITHABORT OFF 
GO
ALTER DATABASE [SiteSmith.Authentication] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SiteSmith.Authentication] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [SiteSmith.Authentication] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SiteSmith.Authentication] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SiteSmith.Authentication] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SiteSmith.Authentication] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SiteSmith.Authentication] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SiteSmith.Authentication] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SiteSmith.Authentication] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SiteSmith.Authentication] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SiteSmith.Authentication] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SiteSmith.Authentication] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SiteSmith.Authentication] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SiteSmith.Authentication] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SiteSmith.Authentication] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SiteSmith.Authentication] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SiteSmith.Authentication] SET  READ_WRITE 
GO
ALTER DATABASE [SiteSmith.Authentication] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SiteSmith.Authentication] SET  MULTI_USER 
GO
ALTER DATABASE [SiteSmith.Authentication] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SiteSmith.Authentication] SET DB_CHAINING OFF 
USE [SiteSmith.Authentication]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[User]') AND type in (N'U'))
BEGIN
CREATE TABLE [User](
	[UserId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_User_UserId]  DEFAULT (newid()),
	[UserName] [nvarchar](255) NULL,
	[Password] [nvarchar](255) NULL,
	[State] [tinyint] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[Deleted] [datetime] NULL,
	[Disabled] [datetime] NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[UserId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
