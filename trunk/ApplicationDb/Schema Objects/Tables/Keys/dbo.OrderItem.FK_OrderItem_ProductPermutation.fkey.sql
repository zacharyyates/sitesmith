ALTER TABLE [dbo].[OrderItem] ADD
CONSTRAINT [FK_OrderItem_ProductPermutation] FOREIGN KEY ([ProductPermutationIdFk]) REFERENCES [dbo].[ProductPermutation] ([ProductPermutationId])


