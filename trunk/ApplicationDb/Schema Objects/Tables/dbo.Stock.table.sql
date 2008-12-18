CREATE TABLE [dbo].[Stock]
(
[ProductPermutationIdFk] [uniqueidentifier] NOT NULL,
[DistributionCenterIdFk] [uniqueidentifier] NOT NULL,
[Quantity] [int] NULL,
[Status] [tinyint] NULL
) ON [PRIMARY]


