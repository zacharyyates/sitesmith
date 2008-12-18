ALTER TABLE [dbo].[Stock] ADD
CONSTRAINT [FK_Stock_ProductPermutation] FOREIGN KEY ([ProductPermutationIdFk]) REFERENCES [dbo].[ProductPermutation] ([ProductPermutationId]) ON DELETE CASCADE ON UPDATE CASCADE


