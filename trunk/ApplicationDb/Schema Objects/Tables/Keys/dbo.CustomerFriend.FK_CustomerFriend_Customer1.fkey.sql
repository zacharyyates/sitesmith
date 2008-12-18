ALTER TABLE [dbo].[CustomerFriend] ADD
CONSTRAINT [FK_CustomerFriend_Customer1] FOREIGN KEY ([FriendIdFk]) REFERENCES [dbo].[Customer] ([CustomerId])


