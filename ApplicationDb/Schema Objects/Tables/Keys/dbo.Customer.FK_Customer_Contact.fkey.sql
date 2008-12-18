ALTER TABLE [dbo].[Customer] ADD
CONSTRAINT [FK_Customer_Contact] FOREIGN KEY ([ContactIdFk]) REFERENCES [dbo].[Contact] ([ContactId])


