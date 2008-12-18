CREATE TABLE [dbo].[Product]
(
[ProductId] [uniqueidentifier] NOT NULL,
[ManufacturerIdFk] [uniqueidentifier] NULL,
[DepartmentIdFk] [uniqueidentifier] NULL,
[Name] [nvarchar] (max) NULL,
[Description] [nvarchar] (max) NULL,
[Released] [datetime] NULL,
[Discontinued] [datetime] NULL,
[Created] [datetime] NULL,
[Modified] [datetime] NULL,
[Deleted] [datetime] NULL,
[DeliveryType] [tinyint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


