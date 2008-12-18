ALTER TABLE [dbo].[ShipmentItem] ADD
CONSTRAINT [FK_ShipmentItem_Shipment] FOREIGN KEY ([ShipmentIdFk]) REFERENCES [dbo].[Shipment] ([ShipmentId]) ON DELETE CASCADE ON UPDATE CASCADE


