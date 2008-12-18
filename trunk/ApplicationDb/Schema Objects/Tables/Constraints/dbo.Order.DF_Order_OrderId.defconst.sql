ALTER TABLE [dbo].[Order] ADD CONSTRAINT [DF_Order_OrderId] DEFAULT (newid()) FOR [OrderId]


