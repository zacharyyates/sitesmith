ALTER TABLE [dbo].[ProductAttribute] ADD
CONSTRAINT [FK_ProductAttribute_ProductPermutation] FOREIGN KEY ([ProductPermutationIdFk]) REFERENCES [dbo].[ProductPermutation] ([ProductPermutationId]) ON DELETE CASCADE ON UPDATE CASCADE


