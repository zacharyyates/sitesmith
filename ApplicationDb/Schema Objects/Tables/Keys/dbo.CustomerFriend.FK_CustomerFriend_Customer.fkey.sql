ALTER TABLE [dbo].[CustomerFriend] ADD
CONSTRAINT [FK_CustomerFriend_Customer] FOREIGN KEY ([CustomerIdFk]) REFERENCES [dbo].[Customer] ([CustomerId]) ON DELETE CASCADE ON UPDATE CASCADE


