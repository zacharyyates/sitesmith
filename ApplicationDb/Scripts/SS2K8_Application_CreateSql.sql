SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Account]') AND type in (N'U'))
BEGIN
CREATE TABLE [Account](
	[AccountId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Account_AccountId]  DEFAULT (newid()),
	[Name] [nvarchar](max) NOT NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[Deleted] [datetime] NULL,
	[IsEnabled] [bit] NULL,
	[Restriction] [tinyint] NULL,
 CONSTRAINT [PK_Account] PRIMARY KEY CLUSTERED 
(
	[AccountId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Contact]') AND type in (N'U'))
BEGIN
CREATE TABLE [Contact](
	[ContactId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Contact_ContactId]  DEFAULT (newid()),
	[FirstName] [nvarchar](max) NULL,
	[LastName] [nvarchar](max) NULL,
	[Title] [nvarchar](max) NULL,
	[Company] [nvarchar](max) NULL,
	[EmailAddress] [nvarchar](max) NULL,
 CONSTRAINT [PK_Contact] PRIMARY KEY CLUSTERED 
(
	[ContactId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Tag]') AND type in (N'U'))
BEGIN
CREATE TABLE [Tag](
	[TagId] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Tag] PRIMARY KEY CLUSTERED 
(
	[TagId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Media]') AND type in (N'U'))
BEGIN
CREATE TABLE [Media](
	[MediaId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Media_MediaId]  DEFAULT (newid()),
	[Name] [nvarchar](max) NULL,
	[Path] [nvarchar](max) NULL,
	[Type] [tinyint] NULL,
	[Size] [int] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[Deleted] [datetime] NULL,
	[Width] [int] NULL,
	[Height] [int] NULL,
	[FileExtension] [nvarchar](50) NULL,
 CONSTRAINT [PK_Media] PRIMARY KEY CLUSTERED 
(
	[MediaId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Department]') AND type in (N'U'))
BEGIN
CREATE TABLE [Department](
	[DepartmentId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Department_DepartmentId]  DEFAULT (newid()),
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Department] PRIMARY KEY CLUSTERED 
(
	[DepartmentId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ProductTag]') AND type in (N'U'))
BEGIN
CREATE TABLE [ProductTag](
	[ProductIdFk] [uniqueidentifier] NOT NULL,
	[TagIdFk] [uniqueidentifier] NOT NULL,
 CONSTRAINT [PK_ProductTag] PRIMARY KEY CLUSTERED 
(
	[ProductIdFk] ASC,
	[TagIdFk] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[WishListItem]') AND type in (N'U'))
BEGIN
CREATE TABLE [WishListItem](
	[WishListIdFk] [uniqueidentifier] NOT NULL,
	[ProductPermutationIdFk] [uniqueidentifier] NOT NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_WishListItem] PRIMARY KEY CLUSTERED 
(
	[WishListIdFk] ASC,
	[ProductPermutationIdFk] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Customer]') AND type in (N'U'))
BEGIN
CREATE TABLE [Customer](
	[CustomerId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Customer_CustomerId]  DEFAULT (newid()),
	[AccountIdFk] [uniqueidentifier] NOT NULL,
	[ContactIdFk] [uniqueidentifier] NOT NULL,
	[UserName] [nvarchar](255) NULL,
	[LastActivity] [datetime] NULL,
	[IsEnabled] [bit] NULL,
	[TimezoneOffset] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Customer] PRIMARY KEY CLUSTERED 
(
	[CustomerId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Manufacturer]') AND type in (N'U'))
BEGIN
CREATE TABLE [Manufacturer](
	[ManufacturerIdFk] [uniqueidentifier] NOT NULL,
	[ContactIdFk] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [PK_Manufacturer] PRIMARY KEY CLUSTERED 
(
	[ManufacturerIdFk] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Address]') AND type in (N'U'))
BEGIN
CREATE TABLE [Address](
	[AddressId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Address_AddressId]  DEFAULT (newid()),
	[ContactIdFk] [uniqueidentifier] NULL,
	[Name] [nvarchar](max) NULL,
	[Street1] [nvarchar](max) NULL,
	[Street2] [nvarchar](max) NULL,
	[City] [nvarchar](max) NULL,
	[State] [nvarchar](max) NULL,
	[PostalCode] [nvarchar](10) NULL,
	[Country] [nvarchar](max) NULL,
 CONSTRAINT [PK_Address] PRIMARY KEY CLUSTERED 
(
	[AddressId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Phone]') AND type in (N'U'))
BEGIN
CREATE TABLE [Phone](
	[PhoneId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Phone_PhoneId]  DEFAULT (newid()),
	[ContactIdFk] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Number] [nvarchar](15) NULL,
 CONSTRAINT [PK_Phone] PRIMARY KEY CLUSTERED 
(
	[PhoneId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ProductPermutation]') AND type in (N'U'))
BEGIN
CREATE TABLE [ProductPermutation](
	[ProductPermutationId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_ProductPermutation_ProductPermutationId]  DEFAULT (newid()),
	[ProductIdFk] [uniqueidentifier] NOT NULL,
	[Identifier] [nvarchar](max) NULL,
	[MSRP] [money] NULL,
	[MAP] [money] NULL,
	[IsVisible] [bit] NULL,
	[IsAvailable] [bit] NULL,
 CONSTRAINT [PK_ProductPermutation] PRIMARY KEY CLUSTERED 
(
	[ProductPermutationId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ProductReview]') AND type in (N'U'))
BEGIN
CREATE TABLE [ProductReview](
	[ProductIdFk] [uniqueidentifier] NOT NULL,
	[CustomerIdFk] [uniqueidentifier] NOT NULL,
	[FeedbackIdFk] [uniqueidentifier] NULL,
	[Description] [nvarchar](max) NULL,
	[Rating] [tinyint] NULL,
 CONSTRAINT [PK_ProductReview] PRIMARY KEY CLUSTERED 
(
	[ProductIdFk] ASC,
	[CustomerIdFk] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ProductMedia]') AND type in (N'U'))
BEGIN
CREATE TABLE [ProductMedia](
	[ProductIdFk] [uniqueidentifier] NOT NULL,
	[MediaIdFk] [uniqueidentifier] NOT NULL,
	[IsVisible] [bit] NULL,
 CONSTRAINT [PK_ProductMedia] PRIMARY KEY CLUSTERED 
(
	[ProductIdFk] ASC,
	[MediaIdFk] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ProductAttribute]') AND type in (N'U'))
BEGIN
CREATE TABLE [ProductAttribute](
	[ProductPermutationIdFk] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Value] [nvarchar](max) NULL,
 CONSTRAINT [PK_ProductAttribute] PRIMARY KEY CLUSTERED 
(
	[ProductPermutationIdFk] ASC,
	[Name] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Stock]') AND type in (N'U'))
BEGIN
CREATE TABLE [Stock](
	[ProductPermutationIdFk] [uniqueidentifier] NOT NULL,
	[DistributionCenterIdFk] [uniqueidentifier] NOT NULL,
	[Quantity] [int] NULL,
	[Status] [tinyint] NULL,
 CONSTRAINT [PK_Stock] PRIMARY KEY CLUSTERED 
(
	[ProductPermutationIdFk] ASC,
	[DistributionCenterIdFk] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Price]') AND type in (N'U'))
BEGIN
CREATE TABLE [Price](
	[ProductPermutationIdFk] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Value] [decimal](18, 0) NULL,
 CONSTRAINT [PK_PriceKey] PRIMARY KEY CLUSTERED 
(
	[ProductPermutationIdFk] ASC,
	[Name] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[ShipmentItem]') AND type in (N'U'))
BEGIN
CREATE TABLE [ShipmentItem](
	[ShipmentIdFk] [uniqueidentifier] NOT NULL,
	[ProductPermutationIdFk] [uniqueidentifier] NOT NULL,
	[Quantity] [int] NULL,
 CONSTRAINT [PK_ShipmentProductPermutation] PRIMARY KEY CLUSTERED 
(
	[ShipmentIdFk] ASC,
	[ProductPermutationIdFk] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Discount]') AND type in (N'U'))
BEGIN
CREATE TABLE [Discount](
	[DiscountId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Discount_DiscountId]  DEFAULT (newid()),
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Value] [decimal](18, 0) NULL,
	[Type] [tinyint] NULL,
	[ProductPermutationIdFk] [uniqueidentifier] NULL,
 CONSTRAINT [PK_Discount] PRIMARY KEY CLUSTERED 
(
	[DiscountId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[OrderItem]') AND type in (N'U'))
BEGIN
CREATE TABLE [OrderItem](
	[OrderIdFk] [uniqueidentifier] NOT NULL,
	[ProductPermutationIdFk] [uniqueidentifier] NOT NULL,
	[Quantity] [int] NULL,
	[UnitPrice] [decimal](18, 0) NULL,
 CONSTRAINT [PK_OrderItem] PRIMARY KEY CLUSTERED 
(
	[OrderIdFk] ASC,
	[ProductPermutationIdFk] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[CustomerFriend]') AND type in (N'U'))
BEGIN
CREATE TABLE [CustomerFriend](
	[CustomerIdFk] [uniqueidentifier] NOT NULL,
	[FriendIdFk] [uniqueidentifier] NOT NULL,
	[IsBlocked] [bit] NULL,
 CONSTRAINT [PK_CustomerFriend] PRIMARY KEY CLUSTERED 
(
	[CustomerIdFk] ASC,
	[FriendIdFk] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Vote]') AND type in (N'U'))
BEGIN
CREATE TABLE [Vote](
	[VoteId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Vote_VoteId]  DEFAULT (newid()),
	[CustomerIdFk] [uniqueidentifier] NULL,
	[Voted] [datetime] NULL,
	[IsUp] [bit] NULL,
	[Reason] [nvarchar](max) NULL,
 CONSTRAINT [PK_Vote] PRIMARY KEY CLUSTERED 
(
	[VoteId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Order]') AND type in (N'U'))
BEGIN
CREATE TABLE [Order](
	[OrderId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Order_OrderId]  DEFAULT (newid()),
	[CustomerIdFk] [uniqueidentifier] NOT NULL,
	[Identifier] [nvarchar](max) NULL,
	[Submitted] [datetime] NULL,
	[Completed] [datetime] NULL,
 CONSTRAINT [PK_Order] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Feedback]') AND type in (N'U'))
BEGIN
CREATE TABLE [Feedback](
	[FeedbackId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Feedback_FeedbackId]  DEFAULT (newid()),
	[CustomerIdFk] [uniqueidentifier] NOT NULL,
	[IsFlagged] [bit] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[Deleted] [datetime] NULL,
	[IsVisible] [bit] NULL,
 CONSTRAINT [PK_Feedback] PRIMARY KEY CLUSTERED 
(
	[FeedbackId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[FeedbackFlag]') AND type in (N'U'))
BEGIN
CREATE TABLE [FeedbackFlag](
	[FeedbackFlagId] [uniqueidentifier] NOT NULL,
	[FeedbackIdFk] [uniqueidentifier] NULL,
	[CustomerIdFk] [uniqueidentifier] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[Deleted] [datetime] NULL,
	[Responded] [datetime] NULL,
	[Response] [nvarchar](max) NULL,
 CONSTRAINT [PK_FeedbackFlag] PRIMARY KEY CLUSTERED 
(
	[FeedbackFlagId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[WishList]') AND type in (N'U'))
BEGIN
CREATE TABLE [WishList](
	[WishListId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_WishList_WishListId]  DEFAULT (newid()),
	[CustomerIdFk] [uniqueidentifier] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[IsPublic] [bit] NULL,
	[Expires] [datetime] NULL,
 CONSTRAINT [PK_WishList] PRIMARY KEY CLUSTERED 
(
	[WishListId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Product]') AND type in (N'U'))
BEGIN
CREATE TABLE [Product](
	[ProductId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Product_ProductId]  DEFAULT (newid()),
	[ManufacturerIdFk] [uniqueidentifier] NULL,
	[DepartmentIdFk] [uniqueidentifier] NULL,
	[Name] [nvarchar](max) NULL,
	[Description] [nvarchar](max) NULL,
	[Released] [datetime] NULL,
	[Discontinued] [datetime] NULL,
	[Created] [datetime] NULL,
	[Modified] [datetime] NULL,
	[Deleted] [datetime] NULL,
	[DeliveryType] [tinyint] NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[ProductId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Shipment]') AND type in (N'U'))
BEGIN
CREATE TABLE [Shipment](
	[ShipmentId] [uniqueidentifier] NOT NULL CONSTRAINT [DF_Shipment_ShipmentId]  DEFAULT (newid()),
	[OrderIdFk] [uniqueidentifier] NULL,
	[Identifier] [nvarchar](max) NULL,
	[Processed] [datetime] NULL,
	[Filled] [datetime] NULL,
	[Shipped] [datetime] NULL,
 CONSTRAINT [PK_Shipment] PRIMARY KEY CLUSTERED 
(
	[ShipmentId] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
IF NOT EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[Setting]') AND type in (N'U'))
BEGIN
CREATE TABLE [dbo].[Setting](
	[Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Culture] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Value] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_Setting] PRIMARY KEY CLUSTERED 
(
	[Name] ASC,
	[Culture] ASC
)WITH (PAD_INDEX  = OFF, IGNORE_DUP_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
END
GO

IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_ProductTag_Product]') AND parent_object_id = OBJECT_ID(N'[ProductTag]'))
ALTER TABLE [ProductTag]  WITH CHECK ADD  CONSTRAINT [FK_ProductTag_Product] FOREIGN KEY([ProductIdFk])
REFERENCES [Product] ([ProductId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [ProductTag] CHECK CONSTRAINT [FK_ProductTag_Product]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_ProductTag_Tag]') AND parent_object_id = OBJECT_ID(N'[ProductTag]'))
ALTER TABLE [ProductTag]  WITH CHECK ADD  CONSTRAINT [FK_ProductTag_Tag] FOREIGN KEY([TagIdFk])
REFERENCES [Tag] ([TagId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [ProductTag] CHECK CONSTRAINT [FK_ProductTag_Tag]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_WishListItem_ProductPermutation]') AND parent_object_id = OBJECT_ID(N'[WishListItem]'))
ALTER TABLE [WishListItem]  WITH CHECK ADD  CONSTRAINT [FK_WishListItem_ProductPermutation] FOREIGN KEY([ProductPermutationIdFk])
REFERENCES [ProductPermutation] ([ProductPermutationId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [WishListItem] CHECK CONSTRAINT [FK_WishListItem_ProductPermutation]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_WishListItem_WishList]') AND parent_object_id = OBJECT_ID(N'[WishListItem]'))
ALTER TABLE [WishListItem]  WITH CHECK ADD  CONSTRAINT [FK_WishListItem_WishList] FOREIGN KEY([WishListIdFk])
REFERENCES [WishList] ([WishListId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [WishListItem] CHECK CONSTRAINT [FK_WishListItem_WishList]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_Customer_Account]') AND parent_object_id = OBJECT_ID(N'[Customer]'))
ALTER TABLE [Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Account] FOREIGN KEY([AccountIdFk])
REFERENCES [Account] ([AccountId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Customer] CHECK CONSTRAINT [FK_Customer_Account]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_Customer_Contact]') AND parent_object_id = OBJECT_ID(N'[Customer]'))
ALTER TABLE [Customer]  WITH CHECK ADD  CONSTRAINT [FK_Customer_Contact] FOREIGN KEY([ContactIdFk])
REFERENCES [Contact] ([ContactId])
GO
ALTER TABLE [Customer] CHECK CONSTRAINT [FK_Customer_Contact]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_Manufacturer_Contact]') AND parent_object_id = OBJECT_ID(N'[Manufacturer]'))
ALTER TABLE [Manufacturer]  WITH CHECK ADD  CONSTRAINT [FK_Manufacturer_Contact] FOREIGN KEY([ContactIdFk])
REFERENCES [Contact] ([ContactId])
GO
ALTER TABLE [Manufacturer] CHECK CONSTRAINT [FK_Manufacturer_Contact]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_Address_Contact]') AND parent_object_id = OBJECT_ID(N'[Address]'))
ALTER TABLE [Address]  WITH CHECK ADD  CONSTRAINT [FK_Address_Contact] FOREIGN KEY([ContactIdFk])
REFERENCES [Contact] ([ContactId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Address] CHECK CONSTRAINT [FK_Address_Contact]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_Phone_Contact]') AND parent_object_id = OBJECT_ID(N'[Phone]'))
ALTER TABLE [Phone]  WITH CHECK ADD  CONSTRAINT [FK_Phone_Contact] FOREIGN KEY([ContactIdFk])
REFERENCES [Contact] ([ContactId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Phone] CHECK CONSTRAINT [FK_Phone_Contact]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_ProductPermutation_Product]') AND parent_object_id = OBJECT_ID(N'[ProductPermutation]'))
ALTER TABLE [ProductPermutation]  WITH CHECK ADD  CONSTRAINT [FK_ProductPermutation_Product] FOREIGN KEY([ProductIdFk])
REFERENCES [Product] ([ProductId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [ProductPermutation] CHECK CONSTRAINT [FK_ProductPermutation_Product]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_ProductReview_Customer]') AND parent_object_id = OBJECT_ID(N'[ProductReview]'))
ALTER TABLE [ProductReview]  WITH CHECK ADD  CONSTRAINT [FK_ProductReview_Customer] FOREIGN KEY([CustomerIdFk])
REFERENCES [Customer] ([CustomerId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [ProductReview] CHECK CONSTRAINT [FK_ProductReview_Customer]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_ProductReview_Product]') AND parent_object_id = OBJECT_ID(N'[ProductReview]'))
ALTER TABLE [ProductReview]  WITH CHECK ADD  CONSTRAINT [FK_ProductReview_Product] FOREIGN KEY([ProductIdFk])
REFERENCES [Product] ([ProductId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [ProductReview] CHECK CONSTRAINT [FK_ProductReview_Product]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_ProductMedia_Media]') AND parent_object_id = OBJECT_ID(N'[ProductMedia]'))
ALTER TABLE [ProductMedia]  WITH CHECK ADD  CONSTRAINT [FK_ProductMedia_Media] FOREIGN KEY([MediaIdFk])
REFERENCES [Media] ([MediaId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [ProductMedia] CHECK CONSTRAINT [FK_ProductMedia_Media]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_ProductMedia_Product]') AND parent_object_id = OBJECT_ID(N'[ProductMedia]'))
ALTER TABLE [ProductMedia]  WITH CHECK ADD  CONSTRAINT [FK_ProductMedia_Product] FOREIGN KEY([ProductIdFk])
REFERENCES [Product] ([ProductId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [ProductMedia] CHECK CONSTRAINT [FK_ProductMedia_Product]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_ProductAttribute_ProductPermutation]') AND parent_object_id = OBJECT_ID(N'[ProductAttribute]'))
ALTER TABLE [ProductAttribute]  WITH CHECK ADD  CONSTRAINT [FK_ProductAttribute_ProductPermutation] FOREIGN KEY([ProductPermutationIdFk])
REFERENCES [ProductPermutation] ([ProductPermutationId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [ProductAttribute] CHECK CONSTRAINT [FK_ProductAttribute_ProductPermutation]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_Stock_ProductPermutation]') AND parent_object_id = OBJECT_ID(N'[Stock]'))
ALTER TABLE [Stock]  WITH CHECK ADD  CONSTRAINT [FK_Stock_ProductPermutation] FOREIGN KEY([ProductPermutationIdFk])
REFERENCES [ProductPermutation] ([ProductPermutationId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Stock] CHECK CONSTRAINT [FK_Stock_ProductPermutation]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_Price_ProductPermutation]') AND parent_object_id = OBJECT_ID(N'[Price]'))
ALTER TABLE [Price]  WITH CHECK ADD  CONSTRAINT [FK_Price_ProductPermutation] FOREIGN KEY([ProductPermutationIdFk])
REFERENCES [ProductPermutation] ([ProductPermutationId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Price] CHECK CONSTRAINT [FK_Price_ProductPermutation]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_ShipmentItem_ProductPermutation]') AND parent_object_id = OBJECT_ID(N'[ShipmentItem]'))
ALTER TABLE [ShipmentItem]  WITH CHECK ADD  CONSTRAINT [FK_ShipmentItem_ProductPermutation] FOREIGN KEY([ProductPermutationIdFk])
REFERENCES [ProductPermutation] ([ProductPermutationId])
GO
ALTER TABLE [ShipmentItem] CHECK CONSTRAINT [FK_ShipmentItem_ProductPermutation]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_ShipmentItem_Shipment]') AND parent_object_id = OBJECT_ID(N'[ShipmentItem]'))
ALTER TABLE [ShipmentItem]  WITH CHECK ADD  CONSTRAINT [FK_ShipmentItem_Shipment] FOREIGN KEY([ShipmentIdFk])
REFERENCES [Shipment] ([ShipmentId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [ShipmentItem] CHECK CONSTRAINT [FK_ShipmentItem_Shipment]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_Discount_ProductPermutation]') AND parent_object_id = OBJECT_ID(N'[Discount]'))
ALTER TABLE [Discount]  WITH CHECK ADD  CONSTRAINT [FK_Discount_ProductPermutation] FOREIGN KEY([ProductPermutationIdFk])
REFERENCES [ProductPermutation] ([ProductPermutationId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Discount] CHECK CONSTRAINT [FK_Discount_ProductPermutation]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_OrderItem_Order]') AND parent_object_id = OBJECT_ID(N'[OrderItem]'))
ALTER TABLE [OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_Order] FOREIGN KEY([OrderIdFk])
REFERENCES [Order] ([OrderId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [OrderItem] CHECK CONSTRAINT [FK_OrderItem_Order]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_OrderItem_ProductPermutation]') AND parent_object_id = OBJECT_ID(N'[OrderItem]'))
ALTER TABLE [OrderItem]  WITH CHECK ADD  CONSTRAINT [FK_OrderItem_ProductPermutation] FOREIGN KEY([ProductPermutationIdFk])
REFERENCES [ProductPermutation] ([ProductPermutationId])
GO
ALTER TABLE [OrderItem] CHECK CONSTRAINT [FK_OrderItem_ProductPermutation]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_CustomerFriend_Customer]') AND parent_object_id = OBJECT_ID(N'[CustomerFriend]'))
ALTER TABLE [CustomerFriend]  WITH CHECK ADD  CONSTRAINT [FK_CustomerFriend_Customer] FOREIGN KEY([CustomerIdFk])
REFERENCES [Customer] ([CustomerId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [CustomerFriend] CHECK CONSTRAINT [FK_CustomerFriend_Customer]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_CustomerFriend_Customer1]') AND parent_object_id = OBJECT_ID(N'[CustomerFriend]'))
ALTER TABLE [CustomerFriend]  WITH CHECK ADD  CONSTRAINT [FK_CustomerFriend_Customer1] FOREIGN KEY([FriendIdFk])
REFERENCES [Customer] ([CustomerId])
GO
ALTER TABLE [CustomerFriend] CHECK CONSTRAINT [FK_CustomerFriend_Customer1]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_Vote_Customer]') AND parent_object_id = OBJECT_ID(N'[Vote]'))
ALTER TABLE [Vote]  WITH CHECK ADD  CONSTRAINT [FK_Vote_Customer] FOREIGN KEY([CustomerIdFk])
REFERENCES [Customer] ([CustomerId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Vote] CHECK CONSTRAINT [FK_Vote_Customer]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_Order_Customer]') AND parent_object_id = OBJECT_ID(N'[Order]'))
ALTER TABLE [Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Customer] FOREIGN KEY([CustomerIdFk])
REFERENCES [Customer] ([CustomerId])
GO
ALTER TABLE [Order] CHECK CONSTRAINT [FK_Order_Customer]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_Feedback_Customer]') AND parent_object_id = OBJECT_ID(N'[Feedback]'))
ALTER TABLE [Feedback]  WITH CHECK ADD  CONSTRAINT [FK_Feedback_Customer] FOREIGN KEY([CustomerIdFk])
REFERENCES [Customer] ([CustomerId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Feedback] CHECK CONSTRAINT [FK_Feedback_Customer]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_FeedbackFlag_Customer]') AND parent_object_id = OBJECT_ID(N'[FeedbackFlag]'))
ALTER TABLE [FeedbackFlag]  WITH CHECK ADD  CONSTRAINT [FK_FeedbackFlag_Customer] FOREIGN KEY([CustomerIdFk])
REFERENCES [Customer] ([CustomerId])
GO
ALTER TABLE [FeedbackFlag] CHECK CONSTRAINT [FK_FeedbackFlag_Customer]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_FeedbackFlag_Feedback]') AND parent_object_id = OBJECT_ID(N'[FeedbackFlag]'))
ALTER TABLE [FeedbackFlag]  WITH CHECK ADD  CONSTRAINT [FK_FeedbackFlag_Feedback] FOREIGN KEY([FeedbackIdFk])
REFERENCES [Feedback] ([FeedbackId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [FeedbackFlag] CHECK CONSTRAINT [FK_FeedbackFlag_Feedback]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_WishList_Customer]') AND parent_object_id = OBJECT_ID(N'[WishList]'))
ALTER TABLE [WishList]  WITH CHECK ADD  CONSTRAINT [FK_WishList_Customer] FOREIGN KEY([CustomerIdFk])
REFERENCES [Customer] ([CustomerId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [WishList] CHECK CONSTRAINT [FK_WishList_Customer]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_Product_Department]') AND parent_object_id = OBJECT_ID(N'[Product]'))
ALTER TABLE [Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Department] FOREIGN KEY([DepartmentIdFk])
REFERENCES [Department] ([DepartmentId])
ON UPDATE SET NULL
ON DELETE SET NULL
GO
ALTER TABLE [Product] CHECK CONSTRAINT [FK_Product_Department]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_Product_Manufacturer]') AND parent_object_id = OBJECT_ID(N'[Product]'))
ALTER TABLE [Product]  WITH CHECK ADD  CONSTRAINT [FK_Product_Manufacturer] FOREIGN KEY([ManufacturerIdFk])
REFERENCES [Manufacturer] ([ManufacturerIdFk])
GO
ALTER TABLE [Product] CHECK CONSTRAINT [FK_Product_Manufacturer]
GO
IF NOT EXISTS (SELECT * FROM sys.foreign_keys WHERE object_id = OBJECT_ID(N'[FK_Shipment_Order]') AND parent_object_id = OBJECT_ID(N'[Shipment]'))
ALTER TABLE [Shipment]  WITH CHECK ADD  CONSTRAINT [FK_Shipment_Order] FOREIGN KEY([OrderIdFk])
REFERENCES [Order] ([OrderId])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [Shipment] CHECK CONSTRAINT [FK_Shipment_Order]


