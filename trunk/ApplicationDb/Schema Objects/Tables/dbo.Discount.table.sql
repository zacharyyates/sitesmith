CREATE TABLE [dbo].[Discount]
(
[DiscountId] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (max) NULL,
[Description] [nvarchar] (max) NULL,
[Value] [decimal] (18, 0) NULL,
[Type] [tinyint] NULL,
[ProductPermutationIdFk] [uniqueidentifier] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


