ALTER TABLE [dbo].[Customer] ADD CONSTRAINT [DF_Customer_CustomerId] DEFAULT (newid()) FOR [CustomerId]


