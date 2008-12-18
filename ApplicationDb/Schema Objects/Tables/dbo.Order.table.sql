CREATE TABLE [dbo].[Order]
(
[OrderId] [uniqueidentifier] NOT NULL,
[CustomerIdFk] [uniqueidentifier] NOT NULL,
[Identifier] [nvarchar] (max) NULL,
[Submitted] [datetime] NULL,
[Completed] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


