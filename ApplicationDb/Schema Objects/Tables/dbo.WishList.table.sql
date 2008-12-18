CREATE TABLE [dbo].[WishList]
(
[WishListId] [uniqueidentifier] NOT NULL,
[CustomerIdFk] [uniqueidentifier] NOT NULL,
[Name] [nvarchar] (max) NULL,
[IsPublic] [bit] NULL,
[Expires] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


