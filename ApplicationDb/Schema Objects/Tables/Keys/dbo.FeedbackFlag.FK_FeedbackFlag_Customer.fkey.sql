ALTER TABLE [dbo].[FeedbackFlag] ADD
CONSTRAINT [FK_FeedbackFlag_Customer] FOREIGN KEY ([CustomerIdFk]) REFERENCES [dbo].[Customer] ([CustomerId])


