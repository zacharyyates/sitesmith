CREATE TABLE [dbo].[Contact]
(
[ContactId] [uniqueidentifier] NOT NULL,
[FirstName] [nvarchar] (max) NULL,
[LastName] [nvarchar] (max) NULL,
[Title] [nvarchar] (max) NULL,
[Company] [nvarchar] (max) NULL,
[EmailAddress] [nvarchar] (max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


