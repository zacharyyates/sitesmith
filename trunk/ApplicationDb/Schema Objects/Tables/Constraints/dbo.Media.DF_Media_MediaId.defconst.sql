ALTER TABLE [dbo].[Media] ADD CONSTRAINT [DF_Media_MediaId] DEFAULT (newid()) FOR [MediaId]


