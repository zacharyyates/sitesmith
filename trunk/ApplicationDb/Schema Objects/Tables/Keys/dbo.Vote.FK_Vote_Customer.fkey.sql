ALTER TABLE [dbo].[Vote] ADD
CONSTRAINT [FK_Vote_Customer] FOREIGN KEY ([CustomerIdFk]) REFERENCES [dbo].[Customer] ([CustomerId]) ON DELETE CASCADE ON UPDATE CASCADE


