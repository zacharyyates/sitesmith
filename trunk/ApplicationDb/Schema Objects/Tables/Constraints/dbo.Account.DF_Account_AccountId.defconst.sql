ALTER TABLE [dbo].[Account] ADD CONSTRAINT [DF_Account_AccountId] DEFAULT (newid()) FOR [AccountId]


