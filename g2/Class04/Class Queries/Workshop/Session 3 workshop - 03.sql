-- REQUIREMENT 03

--  Create new view (vv_CustomerOrders) that will List all CustomerIds and sum of total Orders per customer
DROP VIEW IF EXISTS vv_CustomerOrders;
GO
CREATE VIEW vv_CustomerOrders AS
SELECT o.CustomerId, SUM(TotalPrice) as TotalPrice
FROM dbo.[Order] o
GROUP BY o.CustomerId
GO

SELECT * FROM vv_CustomerOrders co
GO


--  Change the view to show Customer Names instead of CustomerId
ALTER VIEW vv_CustomerOrders AS
SELECT c.Name as CustomerName, SUM(TotalPrice) as TotalPrice
FROM dbo.[Order] o
INNER JOIN dbo.Customer c on o.CustomerId = c.Id
GROUP BY c.Name
--ORDER BY TotalPrice DESC -- ERROR! Cannot use ORDER BY clause in view definition
GO
--  Change the view to show the results ordered by the customer with biggest total price
SELECT * FROM dbo.vv_CustomerOrders co
ORDER BY co.TotalPrice DESC


-- Create new view (vv_EmployeeOrders) that will List all Employees (FirstName and LastName) , Product name and total quantity sold 
DROP VIEW IF EXISTS vv_EmployeeOrders
GO 
CREATE VIEW vv_EmployeeOrders AS 
SELECT e.FirstName + ' ' + e.LastName as Employee, 
	p.Name as ProductName,
	sum(Quantity) as TotalQuantity
FROM dbo.[Order] o
inner join dbo.Employee e on o.EmployeeId = e.Id
inner join dbo.OrderDetails od on o.Id = od.OrderId
inner join dbo.Product p on od.ProductId = p.Id
inner join dbo.BusinessEntity be on o.BusinessEntityId = be.Id
WHERE be.Region = 'Skopski'
GROUP BY e.FirstName + ' ' + e.LastName, p.Name
GO

SELECT * FROM vv_EmployeeOrders
GO

-- Alter the view to show only sales from Business entities belonging to region 'Skopski'
ALTER VIEW vv_EmployeeOrders
AS 
SELECT e.FirstName + N' ' + e.LastName as EmployeeName, p.Name as ProductName, be.Region,  sum(d.Quantity) as TotalQuantity
FROM dbo.[Order] o
join dbo.BusinessEntity be on be.Id = o.BusinessEntityId
join dbo.Employee e on o.EmployeeId = e.Id
join dbo.OrderDetails d on d.OrderId = o.Id
join dbo.Product p  on p.Id = d.ProductId
WHERE be.Region = 'Skopski'
GROUP BY e.FirstName , e.LastName, p.Name, be.Region
GO

SELECT * FROM dbo.vv_EmployeeOrders
GO
