USE SEDC

--Calculate the total amount on all orders in the system
SELECT SUM(TotalPrice) AS Total
FROM Orders

--Calculate the total amount per BusinessEntity on all orders in the system
SELECT BE.[Name], SUM(TotalPrice) AS Total
FROM Orders O
INNER JOIN BusinessEntities BE --we only need the business entities that have an order
ON O.BusinessEntityId = BE.Id
GROUP BY BE.[Name]

SELECT BE.[Name], SUM(TotalPrice) AS Total
FROM Orders O
RIGHT OUTER JOIN BusinessEntities BE
ON BE.Id = O.BusinessEntityId
WHERE O.BusinessEntityId IS NOT NULL
Group by BE.[Name]

--Calculate the total amount per BusinessEntity on all orders in the system from Customers with ID < 20
SELECT BE.[Name], O.CustomerId, SUM(TotalPrice) AS Total
FROM Orders O
INNER JOIN BusinessEntities BE 
ON O.BusinessEntityId = BE.Id
WHERE CustomerId < 20
GROUP BY BE.[Name], O.CustomerId --we need to specify all the columns in the select that are not in an aggregate func in the group by

--Find the Maximal Order amount, and the Average Order amount per BusinessEntity on all orders in the system
SELECT BE.[Name], MAX(TotalPrice) AS MaximalOrderPrice, AVG(TotalPrice) AS AverageOrderPrice
FROM Orders O
INNER JOIN BusinessEntities BE 
ON O.BusinessEntityId = BE.Id
GROUP BY BE.[Name]