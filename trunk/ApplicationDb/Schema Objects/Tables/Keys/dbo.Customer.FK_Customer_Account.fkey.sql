ALTER TABLE [dbo].[Customer] ADD
CONSTRAINT [FK_Customer_Account] FOREIGN KEY ([AccountIdFk]) REFERENCES [dbo].[Account] ([AccountId]) ON DELETE CASCADE ON UPDATE CASCADE


