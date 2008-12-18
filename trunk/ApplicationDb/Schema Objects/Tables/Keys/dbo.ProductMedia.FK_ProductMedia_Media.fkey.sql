ALTER TABLE [dbo].[ProductMedia] ADD
CONSTRAINT [FK_ProductMedia_Media] FOREIGN KEY ([MediaIdFk]) REFERENCES [dbo].[Media] ([MediaId]) ON DELETE CASCADE ON UPDATE CASCADE


