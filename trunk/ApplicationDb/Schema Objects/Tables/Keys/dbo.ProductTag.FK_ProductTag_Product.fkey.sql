ALTER TABLE [dbo].[ProductTag] ADD
CONSTRAINT [FK_ProductTag_Product] FOREIGN KEY ([ProductIdFk]) REFERENCES [dbo].[Product] ([ProductId]) ON DELETE CASCADE ON UPDATE CASCADE


