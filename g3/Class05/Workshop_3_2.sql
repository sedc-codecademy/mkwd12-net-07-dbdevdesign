USE [SEDC]
GO

/****** Object:  View [dbo].[vv_EmployeeOrders]    Script Date: 22.5.2024 19:39:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

ALTER VIEW [dbo].[vv_EmployeeOrders]
AS
SELECT e.Id as EmployeeId
	,e.FirstName
	,e.LastName
	,p.Id as ProductId
	,p.[Name]
	,SUM(od.Quantity) as TotalQuantity
FROM Orders o
INNER JOIN Employees e ON e.Id = o.EmployeeId
INNER JOIN OrderDetails od ON od.OrderId = o.Id
INNER JOIN Products p ON od.ProductId = p.Id
INNER JOIN BusinessEntities be ON o.BusinessEntityId = be.Id
WHERE be.Region = 'Skopski'
GROUP BY e.Id
	,e.FirstName
	,e.LastName
	,p.Id
	,p.[Name]
GO


