ALTER TABLE [dbo].[Vote] ADD CONSTRAINT [DF_Vote_VoteId] DEFAULT (newid()) FOR [VoteId]


