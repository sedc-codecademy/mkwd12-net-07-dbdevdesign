USE [SEDC_Db]
GO

/****** Object:  Table [dbo].[Products]    Script Date: 15.5.2024 18:28:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Products](
	[ProductId] [int] NOT NULL,
	[Name] [nvarchar](150) NOT NULL,
	[Price] [decimal](18, 2) NOT NULL,
	[Quantity] [int] NULL
) ON [PRIMARY]
GO


