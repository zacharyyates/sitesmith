﻿ALTER TABLE [dbo].[OrderItem] ADD
CONSTRAINT [FK_OrderItem_Order] FOREIGN KEY ([OrderIdFk]) REFERENCES [dbo].[Order] ([OrderId]) ON DELETE CASCADE ON UPDATE CASCADE


