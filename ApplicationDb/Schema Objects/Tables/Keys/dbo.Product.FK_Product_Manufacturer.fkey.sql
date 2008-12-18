ALTER TABLE [dbo].[Product] ADD
CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY ([ManufacturerIdFk]) REFERENCES [dbo].[Manufacturer] ([ManufacturerIdFk])


