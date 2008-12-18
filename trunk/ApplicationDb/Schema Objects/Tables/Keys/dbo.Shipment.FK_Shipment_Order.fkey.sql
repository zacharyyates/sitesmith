ALTER TABLE [dbo].[Shipment] ADD
CONSTRAINT [FK_Shipment_Order] FOREIGN KEY ([OrderIdFk]) REFERENCES [dbo].[Order] ([OrderId]) ON DELETE CASCADE ON UPDATE CASCADE


