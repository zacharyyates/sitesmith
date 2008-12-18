CREATE TABLE [dbo].[ProductPermutation]
(
[ProductPermutationId] [uniqueidentifier] NOT NULL,
[ProductIdFk] [uniqueidentifier] NOT NULL,
[Identifier] [nvarchar] (max) NULL,
[MSRP] [money] NULL,
[MAP] [money] NULL,
[IsVisible] [bit] NULL,
[IsAvailable] [bit] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


