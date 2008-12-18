CREATE TABLE [dbo].[ProductReview]
(
[ProductIdFk] [uniqueidentifier] NOT NULL,
[CustomerIdFk] [uniqueidentifier] NOT NULL,
[FeedbackIdFk] [uniqueidentifier] NULL,
[Description] [nvarchar] (max) NULL,
[Rating] [tinyint] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


