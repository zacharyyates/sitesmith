ALTER TABLE [dbo].[Order] ADD
CONSTRAINT [FK_Order_Customer] FOREIGN KEY ([CustomerIdFk]) REFERENCES [dbo].[Customer] ([CustomerId])


