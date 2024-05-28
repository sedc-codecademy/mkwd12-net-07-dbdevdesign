USE SEDC
GO

--Create new view (vv_CustomerOrders) that will List all CustomerIds and sum of total Orders per customer
CREATE VIEW vv_CustomerOrders
AS
SELECT CustomerId, SUM(TotalPrice) AS Total
FROM Orders
GROUP BY CustomerId
GO

SELECT *
FROM vv_CustomerOrders
GO

--Change the view to show Customer Names instead of CustomerId
ALTER VIEW vv_CustomerOrders
AS
SELECT C.[Name], SUM(TotalPrice) AS Total
FROM Orders O
	INNER JOIN Customers C
		ON O.CustomerId = C.Id
GROUP BY C.[Name]
GO

SELECT *
FROM vv_CustomerOrders
GO

--Change the view to show the results ordered by the customer with biggest total price
ALTER VIEW vv_CustomerOrders
AS
SELECT C.[Name], SUM(TotalPrice) AS Total
--SELECT TOP(10000000) C.[Name], SUM(TotalPrice) AS Total
FROM Orders O
	INNER JOIN Customers C
		ON O.CustomerId = C.Id
GROUP BY C.[Name]
--ORDER BY SUM(TotalPrice) --if we have order by in a view, we need TOP
GO

SELECT *
FROM vv_CustomerOrders
ORDER BY TOTAL Desc --we can use order by, after we created the view (when we select from it) so we don't need to use TOP
GO

--Create new view (vv_EmployeeOrders) that will List all Employees (FirstName and LastName) , Product name and total quantity sold 

CREATE VIEW vv_EmployeeOrders
AS
SELECT E.FirstName + ' ' + E.LastName AS EmployeeFullName, P.[Name], SUM(OD.Quantity) AS TotalQuantity  --SUM(OD.Quantity * OD.Price) AS TotalQuantity 
FROM Orders O
	INNER JOIN Employees E
		ON E.Id = O.EmployeeId
    INNER JOIN OrderDetails OD
		ON O.Id = OD.OrderId
	INNER JOIN Products P
		ON P.Id = OD.ProductId
GROUP BY E.FirstName + ' ' + E.LastName, P.[Name]
GO

SELECT *
FROM vv_EmployeeOrders
GO

--Alter the view to show only sales from Business entities belonging to region 'Skopski' AND TotalQuantity is bigger than 2
ALTER VIEW vv_EmployeeOrders
AS
SELECT E.FirstName + ' ' + E.LastName AS EmployeeFullName, P.[Name], BE.Region, SUM(OD.Quantity) AS TotalQuantity  --SUM(OD.Quantity * OD.Price) AS TotalQuantity 
FROM Orders O
	INNER JOIN Employees E
		ON E.Id = O.EmployeeId
    INNER JOIN OrderDetails OD
		ON O.Id = OD.OrderId
	INNER JOIN Products P
		ON P.Id = OD.ProductId
	INNER JOIN BusinessEntities BE
		ON BE.Id = O.BusinessEntityId
WHERE BE.Region = 'Skopski'
GROUP BY E.FirstName + ' ' + E.LastName, P.[Name], BE.Region
HAVING SUM(OD.Quantity) > 2
GO

SELECT *
FROM vv_EmployeeOrders
GO