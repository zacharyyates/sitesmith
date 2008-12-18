ALTER TABLE [dbo].[Phone] ADD
CONSTRAINT [FK_Phone_Contact] FOREIGN KEY ([ContactIdFk]) REFERENCES [dbo].[Contact] ([ContactId]) ON DELETE CASCADE ON UPDATE CASCADE


