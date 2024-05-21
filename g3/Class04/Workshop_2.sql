--Calculate the total amount on all orders in the system
SELECT SUM(TotalPrice)
FROM Orders

SELECT COUNT(*)
FROM Customers

SELECT STRING_AGG([Name], ' ,')
FROM Customers

--Calculate the total amount per BusinessEntity on all orders in the system
SELECT be.Id
	,be.[Name]
	,SUM(o.TotalPrice)
FROM Orders o
INNER JOIN BusinessEntities be ON o.BusinessEntityId = be.Id
GROUP BY be.Id
	,be.[Name]

--Calculate the total amount per BusinessEntity on all orders in the system from Customers with ID < 20
SELECT be.Id
	,be.[Name]
	,SUM(o.TotalPrice)
FROM Orders o
INNER JOIN BusinessEntities be ON o.BusinessEntityId = be.Id
WHERE o.CustomerId < 20
GROUP BY be.Id
	,be.[Name]

--Find the Maximal Order amount, and the Average Order amount per BusinessEntity on all orders in the system
SELECT be.Id
	,be.[Name]
	,MAX(o.TotalPrice) AS MaxPrice
	,AVG(o.TotalPrice) AS AvgPrice
FROM Orders o
INNER JOIN BusinessEntities be ON o.BusinessEntityId = be.Id
GROUP BY be.Id
	,be.[Name]


SELECT c.Id, c.[Name], STRING_AGG(e.FirstName + ' ' + e.LastName, ' ,')
FROM Orders o
INNER JOIN Customers c ON o.CustomerId = c.Id
INNER JOIN Employees e ON o.EmployeeId = e.Id
GROUP BY c.Id, c.[Name]