CREATE TABLE [dbo].[OrderItem]
(
[OrderIdFk] [uniqueidentifier] NOT NULL,
[ProductPermutationIdFk] [uniqueidentifier] NOT NULL,
[Quantity] [int] NULL,
[UnitPrice] [decimal] (18, 0) NULL
) ON [PRIMARY]


