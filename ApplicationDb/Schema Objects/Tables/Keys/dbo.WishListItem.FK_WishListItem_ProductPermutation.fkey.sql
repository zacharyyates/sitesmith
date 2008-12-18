ALTER TABLE [dbo].[WishListItem] ADD
CONSTRAINT [FK_WishListItem_ProductPermutation] FOREIGN KEY ([ProductPermutationIdFk]) REFERENCES [dbo].[ProductPermutation] ([ProductPermutationId]) ON DELETE CASCADE ON UPDATE CASCADE


