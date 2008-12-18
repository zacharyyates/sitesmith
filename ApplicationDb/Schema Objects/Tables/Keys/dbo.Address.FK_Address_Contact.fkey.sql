ALTER TABLE [dbo].[Address] ADD
CONSTRAINT [FK_Address_Contact] FOREIGN KEY ([ContactIdFk]) REFERENCES [dbo].[Contact] ([ContactId]) ON DELETE CASCADE ON UPDATE CASCADE


