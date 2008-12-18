ALTER TABLE [dbo].[Product] ADD
CONSTRAINT [FK_Product_Department] FOREIGN KEY ([DepartmentIdFk]) REFERENCES [dbo].[Department] ([DepartmentId]) ON DELETE SET NULL ON UPDATE SET NULL


