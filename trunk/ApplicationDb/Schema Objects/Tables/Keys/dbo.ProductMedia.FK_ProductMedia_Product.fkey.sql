ALTER TABLE [dbo].[ProductMedia] ADD
CONSTRAINT [FK_ProductMedia_Product] FOREIGN KEY ([ProductIdFk]) REFERENCES [dbo].[Product] ([ProductId]) ON DELETE CASCADE ON UPDATE CASCADE


