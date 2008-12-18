ALTER TABLE [dbo].[Address] ADD CONSTRAINT [DF_Address_AddressId] DEFAULT (newid()) FOR [AddressId]


