ALTER TABLE [dbo].[Shipment] ADD CONSTRAINT [DF_Shipment_ShipmentId] DEFAULT (newid()) FOR [ShipmentId]


