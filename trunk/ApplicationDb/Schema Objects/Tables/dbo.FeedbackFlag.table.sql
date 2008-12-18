CREATE TABLE [dbo].[FeedbackFlag]
(
[FeedbackFlagId] [uniqueidentifier] NOT NULL,
[FeedbackIdFk] [uniqueidentifier] NULL,
[CustomerIdFk] [uniqueidentifier] NULL,
[Created] [datetime] NULL,
[Modified] [datetime] NULL,
[Deleted] [datetime] NULL,
[Responded] [datetime] NULL,
[Response] [nvarchar] (max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


