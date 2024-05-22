--Calculate the total amount per BusinessEntity on all orders in the system and filter only total orders greater than 635558
SELECT BusinessEntityId
	,be.[Name]
	,be.Region
	,SUM(TotalPrice)
FROM Orders o
INNER JOIN BusinessEntities be ON o.BusinessEntityId = be.Id
GROUP BY BusinessEntityId
	,be.[Name]
	,be.[Region]
HAVING SUM(TotalPrice) >= 635558

--Calculate the total amount per BusinessEntity on all orders in the system from Customers with ID < 20 and filter only total orders less than 100000
SELECT be.[Name]
	,c.[Name]
	,SUM(TotalPrice)
FROM Orders o
INNER JOIN BusinessEntities be ON o.BusinessEntityId = be.Id
INNER JOIN Customers c ON c.Id = o.CustomerId
WHERE CustomerId < 20
GROUP BY BusinessEntityId
	,CustomerId
	,be.[Name]
	,c.[Name]
HAVING SUM(TotalPrice) < 100000

	--Find the Maximal Order amount, and the Average Order amount per BusinessEntity on all orders in the system. Filter only records where Total order amount is more than 4x bigger than average

Select be.Id, be.[Name], MAX(o.TotalPrice) as MaxOrderPrice, AVG(o.TotalPrice) as AvgOrderPrice
From Orders o
INner Join BusinessEntities be ON o.BusinessEntityId = be.Id
Group By be.Id, be.[Name]
HAVING SUM(o.TotalPrice) > 4 * AVG(o.TotalPrice)
