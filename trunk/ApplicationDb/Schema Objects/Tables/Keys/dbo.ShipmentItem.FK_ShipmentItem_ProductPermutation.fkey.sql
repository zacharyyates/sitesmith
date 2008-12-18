ALTER TABLE [dbo].[ShipmentItem] ADD
CONSTRAINT [FK_ShipmentItem_ProductPermutation] FOREIGN KEY ([ProductPermutationIdFk]) REFERENCES [dbo].[ProductPermutation] ([ProductPermutationId])


