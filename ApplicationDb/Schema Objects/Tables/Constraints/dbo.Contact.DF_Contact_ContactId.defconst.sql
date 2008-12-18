ALTER TABLE [dbo].[Contact] ADD CONSTRAINT [DF_Contact_ContactId] DEFAULT (newid()) FOR [ContactId]


