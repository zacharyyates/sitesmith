ALTER TABLE [dbo].[Feedback] ADD
CONSTRAINT [FK_Feedback_Customer] FOREIGN KEY ([CustomerIdFk]) REFERENCES [dbo].[Customer] ([CustomerId]) ON DELETE CASCADE ON UPDATE CASCADE


