SELECT c.[Name]
	,p.[Name]
FROM Customers AS c
CROSS JOIN Products AS p
ORDER BY c.[Name]

SELECT DISTINCT be.[Name]
FROM BusinessEntities be
INNER JOIN Orders o ON be.Id = o.BusinessEntityId

SELECT be.*
FROM BusinessEntities be
LEFT OUTER JOIN Orders o ON be.Id = o.BusinessEntityId
WHERE o.Id IS NULL

SELECT c.*
FROM Customers c
LEFT OUTER JOIN Orders o ON c.Id = o.CustomerId
WHERE o.Id IS NULL

SELECT c.*
FROM Orders o
RIGHT OUTER JOIN Customers c ON c.Id = o.CustomerId
WHERE o.Id IS NULL

SELECT *
FROM Customers c
WHERE c.Id NOT IN (
		SELECT o.CustomerId
		FROM Orders o
		)
