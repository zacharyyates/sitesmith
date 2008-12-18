ALTER TABLE [dbo].[Discount] ADD
CONSTRAINT [FK_Discount_ProductPermutation] FOREIGN KEY ([ProductPermutationIdFk]) REFERENCES [dbo].[ProductPermutation] ([ProductPermutationId]) ON DELETE CASCADE ON UPDATE CASCADE


