ALTER TABLE [dbo].[Price] ADD
CONSTRAINT [FK_Price_ProductPermutation] FOREIGN KEY ([ProductPermutationIdFk]) REFERENCES [dbo].[ProductPermutation] ([ProductPermutationId]) ON DELETE CASCADE ON UPDATE CASCADE


