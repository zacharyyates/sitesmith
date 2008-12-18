CREATE TABLE [dbo].[Address]
(
[AddressId] [uniqueidentifier] NOT NULL,
[ContactIdFk] [uniqueidentifier] NULL,
[Name] [nvarchar] (max) NULL,
[Street1] [nvarchar] (max) NULL,
[Street2] [nvarchar] (max) NULL,
[City] [nvarchar] (max) NULL,
[State] [nvarchar] (max) NULL,
[PostalCode] [nvarchar] (10) NULL,
[Country] [nvarchar] (max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


