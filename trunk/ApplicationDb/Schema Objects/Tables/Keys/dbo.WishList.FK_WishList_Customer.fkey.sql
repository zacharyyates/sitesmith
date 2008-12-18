ALTER TABLE [dbo].[WishList] ADD
CONSTRAINT [FK_WishList_Customer] FOREIGN KEY ([CustomerIdFk]) REFERENCES [dbo].[Customer] ([CustomerId]) ON DELETE CASCADE ON UPDATE CASCADE


