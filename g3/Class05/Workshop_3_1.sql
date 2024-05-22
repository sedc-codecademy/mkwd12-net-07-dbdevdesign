USE [SEDC]
GO

/****** Object:  View [dbo].[vv_CustomerOrders]    Script Date: 22.5.2024 19:18:55 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE VIEW [dbo].[vv_CustomerOrders]
AS
Select c.Id, SUM(o.TotalPrice) as TotalPrice
From Orders o
Inner Join Customers c ON o.CustomerId = c.Id
Group By c.Id
GO


