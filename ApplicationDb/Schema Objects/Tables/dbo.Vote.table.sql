CREATE TABLE [dbo].[Vote]
(
[VoteId] [uniqueidentifier] NOT NULL,
[CustomerIdFk] [uniqueidentifier] NULL,
[Voted] [datetime] NULL,
[IsUp] [bit] NULL,
[Reason] [nvarchar] (max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


