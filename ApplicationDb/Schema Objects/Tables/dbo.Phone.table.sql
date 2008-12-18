CREATE TABLE [dbo].[Phone]
(
[PhoneId] [uniqueidentifier] NOT NULL,
[ContactIdFk] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (max) NULL,
[Number] [nvarchar] (15) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


