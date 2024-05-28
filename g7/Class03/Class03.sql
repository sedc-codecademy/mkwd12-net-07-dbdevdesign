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

--CLASS3 GROUPING BY, AGG Functions, Views

--AGGREGATE FUNCTIONS
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

--GROUPING FUNCTIONS
--WORKSHOP 2
--1.Calculate the total amount on all order in the system
--2.Calculate the total amount per BusinessEntity on all orders in the system and filter only total orders greater than 635558
--3.Calculate the total amount per BusinessEntity on all orders in the system from Customers with ID < 20 
--and filter only total orders less than 100000
--4.Find the Maximal Order amount, and the Average Order amount per BusinessEntity on all orders in the system. 
--Filter only records where Total order amount is more than 4x bigger than average
--5.Aggregate all business entityies names 

--1st
SELECT SUM(TotalPrice) as Total
FROM dbo.Orders
GO

--2nd
SELECT b.Name as BusinessEntityName, SUM(TotalPrice) as Total
FROM dbo.Orders o
JOIN dbo.BusinessEntities b on o.BusinessEntityId = b.Id
GROUP BY b.Name
HAVING SUM(TotalPrice) > 635558.00
GO

--3rd
SELECT b.Name as BusinessEntityName, SUM(TotalPrice) as Total
FROM dbo.Orders o
JOIN dbo.BusinessEntities b on o.BusinessEntityId = b.Id
WHERE CustomerId < 20
GROUP BY b.Name
HAVING SUM(TotalPrice) < 100000
GO

--4th
SELECT b.Name BusinessEntity, MAX(TotalPrice) as Total, AVG(TotalPrice) as Average
FROM dbo.Orders o
JOIN dbo.BusinessEntities b on o.BusinessEntityId = b.Id
GROUP BY b.Name
HAVING MAX(TotalPrice) > 4*AVG(TotalPrice)
GO

--5th
SELECT STRING_AGG (Name, ', ') as Names
FROM dbo.BusinessEntities
GO

--VIEWS
--WORKSHOP 3
-- 1st. Create new view (vv_CustomerOrders) that will List all CustomerIds and sum of total Orders per customer
-- 2nd. Change the view to show Customer Names instead of CustomerId
-- 3rd. Change the view to show the results ordered by the customer with biggest total price
-- 4th. Create new view (vv_EmployeeOrders) that will List all Employees (FirstName and LastName) ,
-- Product name and total quantity sold 
-- 5th. Alter the view to show only sales from Business entities belonging to region 'Skopski'

--1st
DROP VIEW IF EXISTS vv_CustomerOrders;
GO

CREATE VIEW vv_CustomerOrders
AS
SELECT CustomerID, SUM(TotalPrice) as TotalPrice
FROM dbo.Orders o
GROUP BY CustomerId
GO

--2nd
ALTER VIEW vv_CustomerOrders
AS
SELECT c.Name as CustomerName, SUM(TotalPrice) as TotalPrice
FROM dbo.Orders o
INNER JOIN dbo.Customers c on o.CustomerId = c.Id
GROUP BY c.Name
GO

SELECT * FROM vv_CustomerOrders
ORDER BY TotalPrice DESC -- => 3rd requirement
GO

CREATE OR ALTER VIEW vv_EmployeeOrders
AS
SELECT e.FirstName + ' ' + e.LastName as Employee, p.Name as ProductName, SUM(Quantity) as TotalQuantity
FROM dbo.Orders o
INNER JOIN dbo.Employees e on o.EmployeeId = e.Id
INNER JOIN dbo.OrderDetails od on o.id = od.OrderId
INNER JOIN dbo.Products p on od.ProductId = p.Id
INNER JOIN dbo.BusinessEntities be on o.BusinessEntityId = be.Id
WHERE be.Region = 'Skopski' -- => 5th req
GROUP BY e.FirstName + ' ' + e.LastName, p.Name
GO

SELECT * FROM vv_EmployeeOrders
GO
