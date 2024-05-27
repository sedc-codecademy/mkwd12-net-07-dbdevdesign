DECLARE @CustomerId int
DECLARE @BusinessEntityId int

SET @CustomerId = 9
SET @BusinessEntityId = 2

SELECT SUM(o.TotalPrice) AS TotalPrice
FROM Orders o
INNER JOIN Customers c ON o.CustomerId = c.Id
INNER JOIN BusinessEntities be ON o.BusinessEntityId = be.Id
WHERE o.CustomerId = @CustomerId
	AND o.BusinessEntityId = @BusinessEntityId
------------------
SELECT SUM(o.TotalPrice) AS TotalPrice
FROM Orders o
INNER JOIN Customers c ON o.CustomerId = c.Id
INNER JOIN BusinessEntities be ON o.BusinessEntityId = be.Id
GROUP BY o.BusinessEntityId
	,o.CustomerId
HAVING o.CustomerId = @CustomerId
	AND o.BusinessEntityId = @BusinessEntityId
---------------
SELECT SUM(o.TotalPrice) AS TotalPrice
FROM Orders o
WHERE o.CustomerId = @CustomerId
	AND o.BusinessEntityId = @BusinessEntityId
