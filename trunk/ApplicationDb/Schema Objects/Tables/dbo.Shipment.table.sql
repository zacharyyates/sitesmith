CREATE TABLE [dbo].[Shipment]
(
[ShipmentId] [uniqueidentifier] NOT NULL,
[OrderIdFk] [uniqueidentifier] NULL,
[Identifier] [nvarchar] (max) NULL,
[Processed] [datetime] NULL,
[Filled] [datetime] NULL,
[Shipped] [datetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]


