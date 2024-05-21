USE [master]
GO

USE [SEDC]
GO

SELECT * FROM dbo.BusinessEntities
SELECT * FROM dbo.Employees
SELECT * FROM dbo.Products
SELECT * FROM dbo.Customers 
SELECT * FROM dbo.[Orders]
SELECT * FROM dbo.[OrderDetails]

--CLASS3 GROUPING BY, AGG Functions

--WORKSHOP 1
--Calculate the total amount on all orders in the system
--Calculate the total amount per BusinessEntity on all orders in the system
--Calculate the total amount per BusinessEntity on all orders in the system from Customers with ID < 20
--Find the Maximal Order amount, and the Average Order amount per BusinessEntity on all orders in the system

--1st req
SELECT SUM(TotalPrice) as Total
FROM dbo.Orders
GO

--2nd req
SELECT b.Name, SUM(TotalPrice) as Total
FROM dbo.Orders o
join dbo.BusinessEntities b On o.BusinessEntityId = b.Id
GROUP BY b.Name
GO

--3nd req
SELECT b.Name, SUM(TotalPrice) as Total
FROM dbo.Orders o
JOIN dbo.BusinessEntities b ON o.BusinessEntityId = b.Id
WHERE CustomerId < 20
GROUP BY b.Name
GO

--4th req
SELECT b.Region, b.Name as BusinessEntityName
,c.Name as CustomerName
,Min(TotalPrice) as MinOrder, Max(TotalPrice) as Total, AVG(TotalPrice) as Average
FROM dbo.Orders o
JOIN dbo.BusinessEntities b on o.BusinessEntityId = b.Id
JOIN dbo.Customers c on o.CustomerId = c.Id
GROUP BY b.Region, b.Name, c.Name
GO
