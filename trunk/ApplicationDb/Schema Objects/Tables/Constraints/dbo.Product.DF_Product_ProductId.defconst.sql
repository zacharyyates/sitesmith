ALTER TABLE [dbo].[Product] ADD CONSTRAINT [DF_Product_ProductId] DEFAULT (newid()) FOR [ProductId]


