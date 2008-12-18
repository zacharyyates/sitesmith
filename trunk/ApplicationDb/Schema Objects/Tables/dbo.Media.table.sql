CREATE TABLE [dbo].[Media]
(
[MediaId] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (max) NULL,
[Path] [nvarchar] (max) NULL,
[Type] [tinyint] NULL,
[Size] [int] NULL,
[Created] [datetime] NULL,
[Modified] [datetime] NULL,
[Deleted] [datetime] NULL,
[Width] [int] NULL,
[Height] [int] NULL,
[FileExtension] [nvarchar] (50) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


