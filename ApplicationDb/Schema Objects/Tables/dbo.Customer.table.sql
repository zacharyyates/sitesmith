CREATE TABLE [dbo].[Customer]
(
[CustomerId] [uniqueidentifier] NOT NULL,
[AccountIdFk] [uniqueidentifier] NOT NULL,
[ContactIdFk] [uniqueidentifier] NOT NULL,
[UserName] [nvarchar] (255) NULL,
[LastActivity] [datetime] NULL,
[IsEnabled] [bit] NULL,
[TimezoneOffset] [decimal] (18, 0) NULL
) ON [PRIMARY]


