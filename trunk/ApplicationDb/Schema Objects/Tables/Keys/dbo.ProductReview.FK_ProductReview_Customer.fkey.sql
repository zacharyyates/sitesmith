ALTER TABLE [dbo].[ProductReview] ADD
CONSTRAINT [FK_ProductReview_Customer] FOREIGN KEY ([CustomerIdFk]) REFERENCES [dbo].[Customer] ([CustomerId]) ON DELETE CASCADE ON UPDATE CASCADE


