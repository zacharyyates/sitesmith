ALTER TABLE [dbo].[FeedbackFlag] ADD
CONSTRAINT [FK_FeedbackFlag_Feedback] FOREIGN KEY ([FeedbackIdFk]) REFERENCES [dbo].[Feedback] ([FeedbackId]) ON DELETE CASCADE ON UPDATE CASCADE


