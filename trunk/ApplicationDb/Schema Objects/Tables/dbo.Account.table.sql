CREATE TABLE [dbo].[Account]
(
[AccountId] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (max) NOT NULL,
[Created] [datetime] NULL,
[Modified] [datetime] NULL,
[Deleted] [datetime] NULL,
[IsEnabled] [bit] NULL,
[Restriction] [tinyint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


