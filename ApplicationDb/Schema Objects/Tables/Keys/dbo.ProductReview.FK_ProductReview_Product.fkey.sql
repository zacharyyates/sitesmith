ALTER TABLE [dbo].[ProductReview] ADD
CONSTRAINT [FK_ProductReview_Product] FOREIGN KEY ([ProductIdFk]) REFERENCES [dbo].[Product] ([ProductId]) ON DELETE CASCADE ON UPDATE CASCADE


