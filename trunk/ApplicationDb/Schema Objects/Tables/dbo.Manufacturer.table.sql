CREATE TABLE [dbo].[Manufacturer]
(
[ManufacturerIdFk] [uniqueidentifier] NOT NULL,
[ContactIdFk] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (max) NULL,
[Description] [nvarchar] (max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


