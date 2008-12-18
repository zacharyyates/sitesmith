ALTER TABLE [dbo].[WishListItem] ADD
CONSTRAINT [FK_WishListItem_WishList] FOREIGN KEY ([WishListIdFk]) REFERENCES [dbo].[WishList] ([WishListId]) ON DELETE CASCADE ON UPDATE CASCADE


