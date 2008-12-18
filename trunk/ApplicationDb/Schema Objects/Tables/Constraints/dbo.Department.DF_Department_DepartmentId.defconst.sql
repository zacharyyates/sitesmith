ALTER TABLE [dbo].[Department] ADD CONSTRAINT [DF_Department_DepartmentId] DEFAULT (newid()) FOR [DepartmentId]


