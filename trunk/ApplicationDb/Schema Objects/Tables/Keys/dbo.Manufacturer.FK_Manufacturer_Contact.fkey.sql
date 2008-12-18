ALTER TABLE [dbo].[Manufacturer] ADD
CONSTRAINT [FK_Manufacturer_Contact] FOREIGN KEY ([ContactIdFk]) REFERENCES [dbo].[Contact] ([ContactId])


