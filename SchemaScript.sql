/****** Object:  Table [dbo].[customers]    Script Date: 2023. 05. 21. 19:37:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[customer_id] [int] NOT NULL,
	[customer_name] [nvarchar](50) NOT NULL,
	[customer_since] [date] NOT NULL,
 CONSTRAINT [customerid] PRIMARY KEY CLUSTERED 
(
	[customer_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orderitems]    Script Date: 2023. 05. 21. 19:37:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orderitems](
	[order_item_id] [int] NOT NULL,
	[order_id] [bigint] NOT NULL,
	[product_id] [int] NOT NULL,
	[quantity] [int] NOT NULL,
 CONSTRAINT [orderitemid] PRIMARY KEY CLUSTERED 
(
	[order_item_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 2023. 05. 21. 19:37:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[order_id] [bigint] NOT NULL,
	[order_status] [nvarchar](50) NOT NULL,
	[order_date] [date] NOT NULL,
	[payment_method] [nvarchar](50) NOT NULL,
 CONSTRAINT [orderid] PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[products]    Script Date: 2023. 05. 21. 19:37:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[products](
	[product_id] [int] NOT NULL,
	[product_name] [nvarchar](100) NOT NULL,
	[category] [nvarchar](50) NOT NULL,
 CONSTRAINT [productid] PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
 CONSTRAINT [uniqueID] UNIQUE NONCLUSTERED 
(
	[product_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ratings]    Script Date: 2023. 05. 21. 19:37:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ratings](
	[order_id] [bigint] NOT NULL,
	[customer_id] [int] NOT NULL,
	[rating] [tinyint] NOT NULL,
	[review_id] [int] NOT NULL,
 CONSTRAINT [reviewid] PRIMARY KEY CLUSTERED 
(
	[review_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[test3]    Script Date: 2023. 05. 21. 19:37:40 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[test3](
	[order_item_id] [int] NOT NULL,
	[order_status] [nvarchar](50) NOT NULL,
	[product_name] [nvarchar](100) NOT NULL,
	[product_id] [int] NOT NULL,
	[price] [smallint] NOT NULL,
	[quantity] [tinyint] NOT NULL,
	[total_amount] [int] NOT NULL,
	[order_id] [bigint] NOT NULL,
	[rating] [tinyint] NOT NULL,
	[category] [nvarchar](50) NOT NULL,
	[payment_method] [nvarchar](50) NOT NULL,
	[order_date] [date] NOT NULL,
	[customer_since] [date] NOT NULL,
	[customer_id] [int] NOT NULL,
	[customer_name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_test3] PRIMARY KEY CLUSTERED 
(
	[order_item_id] ASC
)WITH (STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[orders] ADD  CONSTRAINT [orderstatusdefault]  DEFAULT ('pending') FOR [order_status]
GO
ALTER TABLE [dbo].[orderitems]  WITH CHECK ADD  CONSTRAINT [fk_orderid] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([order_id])
GO
ALTER TABLE [dbo].[orderitems] CHECK CONSTRAINT [fk_orderid]
GO
ALTER TABLE [dbo].[orderitems]  WITH CHECK ADD  CONSTRAINT [fk_productid] FOREIGN KEY([product_id])
REFERENCES [dbo].[products] ([product_id])
GO
ALTER TABLE [dbo].[orderitems] CHECK CONSTRAINT [fk_productid]
GO
ALTER TABLE [dbo].[ratings]  WITH CHECK ADD  CONSTRAINT [fk_customerid] FOREIGN KEY([customer_id])
REFERENCES [dbo].[customers] ([customer_id])
GO
ALTER TABLE [dbo].[ratings] CHECK CONSTRAINT [fk_customerid]
GO
ALTER TABLE [dbo].[ratings]  WITH CHECK ADD  CONSTRAINT [fk_orderid2] FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([order_id])
GO
ALTER TABLE [dbo].[ratings] CHECK CONSTRAINT [fk_orderid2]
GO
ALTER TABLE [dbo].[customers]  WITH CHECK ADD  CONSTRAINT [datumcheck] CHECK  (([customer_since]<=getdate()))
GO
ALTER TABLE [dbo].[customers] CHECK CONSTRAINT [datumcheck]
GO
