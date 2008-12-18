CREATE TABLE [dbo].[ProductAttribute]
(
[ProductPermutationIdFk] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (255) NOT NULL,
[Value] [nvarchar] (max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


