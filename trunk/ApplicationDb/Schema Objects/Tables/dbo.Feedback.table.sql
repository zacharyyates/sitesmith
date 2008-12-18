CREATE TABLE [dbo].[Feedback]
(
[FeedbackId] [uniqueidentifier] NOT NULL,
[CustomerIdFk] [uniqueidentifier] NOT NULL,
[IsFlagged] [bit] NULL,
[Created] [datetime] NULL,
[Modified] [datetime] NULL,
[Deleted] [datetime] NULL,
[IsVisible] [bit] NULL
) ON [PRIMARY]


