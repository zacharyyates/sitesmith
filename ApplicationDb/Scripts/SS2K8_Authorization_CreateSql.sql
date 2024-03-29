USE [master]
GO
IF NOT EXISTS (SELECT name FROM sys.databases WHERE name = N'SiteSmith.Authorization')
BEGIN
CREATE DATABASE [SiteSmith.Authorization] ON  PRIMARY 
( NAME = N'SiteSmith.Authorization', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL.2\MSSQL\DATA\SiteSmith.Authorization.mdf' , SIZE = 2048KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'SiteSmith.Authorization_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL.2\MSSQL\DATA\SiteSmith.Authorization_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
END

GO
EXEC dbo.sp_dbcmptlevel @dbname=N'SiteSmith.Authorization', @new_cmptlevel=90
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SiteSmith.Authorization].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SiteSmith.Authorization] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SiteSmith.Authorization] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SiteSmith.Authorization] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SiteSmith.Authorization] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SiteSmith.Authorization] SET ARITHABORT OFF 
GO
ALTER DATABASE [SiteSmith.Authorization] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SiteSmith.Authorization] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [SiteSmith.Authorization] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SiteSmith.Authorization] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SiteSmith.Authorization] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SiteSmith.Authorization] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SiteSmith.Authorization] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SiteSmith.Authorization] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SiteSmith.Authorization] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SiteSmith.Authorization] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SiteSmith.Authorization] SET  ENABLE_BROKER 
GO
ALTER DATABASE [SiteSmith.Authorization] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SiteSmith.Authorization] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SiteSmith.Authorization] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SiteSmith.Authorization] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SiteSmith.Authorization] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SiteSmith.Authorization] SET  READ_WRITE 
GO
ALTER DATABASE [SiteSmith.Authorization] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SiteSmith.Authorization] SET  MULTI_USER 
GO
ALTER DATABASE [SiteSmith.Authorization] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [SiteSmith.Authorization] SET DB_CHAINING OFF 
USE [SiteSmith.Authorization]
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Action]') AND type in (N'U'))
BEGIN
CREATE TABLE [Action](
	[ActionId] [uniqueidentifier] NOT NULL,
	[ParentIdFk] [uniqueidentifier] NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Action] PRIMARY KEY CLUSTERED 
(
	[ActionId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Actor]') AND type in (N'U'))
BEGIN
CREATE TABLE [Actor](
	[ActorId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Actor_ActorId]  DEFAULT (newid()),
	[ParentIdFk] [uniqueidentifier] NULL,
	[UserIdentifier] [nvarchar](255) NULL,
 CONSTRAINT [PK_Actor] PRIMARY KEY CLUSTERED 
(
	[ActorId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Securable]') AND type in (N'U'))
BEGIN
CREATE TABLE [Securable](
	[SecurableId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Securable_SecurableId]  DEFAULT (newid()),
	[ParentIdFk] [uniqueidentifier] NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Securable] PRIMARY KEY CLUSTERED 
(
	[SecurableId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Permission]') AND type in (N'U'))
BEGIN
CREATE TABLE [Permission](
	[ActorIdFk] [uniqueidentifier] NOT NULL,
	[ActionIdFk] [uniqueidentifier] NOT NULL,
	[SecurableIdFk] [uniqueidentifier] NOT NULL,
	[IsAllowed] [bit] NULL,
 CONSTRAINT [PK_Permission] PRIMARY KEY CLUSTERED 
(
	[ActorIdFk] ASC,
	[ActionIdFk] ASC,
	[SecurableIdFk] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_Action_Action]') AND parent_object_id = OBJECT_ID(N'[Action]'))
ALTER TABLE [Action]  WITH CHECK ADD  CONSTRAINT [FK_Action_Action] FOREIGN KEY([ParentIdFk])
REFERENCES [Action] ([ActionId])
GO
ALTER TABLE [Action] CHECK CONSTRAINT [FK_Action_Action]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_Actor_Actor]') AND parent_object_id = OBJECT_ID(N'[Actor]'))
ALTER TABLE [Actor]  WITH CHECK ADD  CONSTRAINT [FK_Actor_Actor] FOREIGN KEY([ParentIdFk])
REFERENCES [Actor] ([ActorId])
GO
ALTER TABLE [Actor] CHECK CONSTRAINT [FK_Actor_Actor]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_Securable_Securable]') AND parent_object_id = OBJECT_ID(N'[Securable]'))
ALTER TABLE [Securable]  WITH CHECK ADD  CONSTRAINT [FK_Securable_Securable] FOREIGN KEY([ParentIdFk])
REFERENCES [Securable] ([SecurableId])
GO
ALTER TABLE [Securable] CHECK CONSTRAINT [FK_Securable_Securable]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_Permission_Action]') AND parent_object_id = OBJECT_ID(N'[Permission]'))
ALTER TABLE [Permission]  WITH CHECK ADD  CONSTRAINT [FK_Permission_Action] FOREIGN KEY([ActionIdFk])
REFERENCES [Action] ([ActionId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Permission] CHECK CONSTRAINT [FK_Permission_Action]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_Permission_Actor]') AND parent_object_id = OBJECT_ID(N'[Permission]'))
ALTER TABLE [Permission]  WITH CHECK ADD  CONSTRAINT [FK_Permission_Actor] FOREIGN KEY([ActorIdFk])
REFERENCES [Actor] ([ActorId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Permission] CHECK CONSTRAINT [FK_Permission_Actor]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_Permission_Securable]') AND parent_object_id = OBJECT_ID(N'[Permission]'))
ALTER TABLE [Permission]  WITH CHECK ADD  CONSTRAINT [FK_Permission_Securable] FOREIGN KEY([SecurableIdFk])
REFERENCES [Securable] ([SecurableId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Permission] CHECK CONSTRAINT [FK_Permission_Securable]
