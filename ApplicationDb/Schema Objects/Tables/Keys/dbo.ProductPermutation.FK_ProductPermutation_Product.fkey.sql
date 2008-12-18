ALTER TABLE [dbo].[ProductPermutation] ADD
CONSTRAINT [FK_ProductPermutation_Product] FOREIGN KEY ([ProductIdFk]) REFERENCES [dbo].[Product] ([ProductId]) ON DELETE CASCADE ON UPDATE CASCADE


