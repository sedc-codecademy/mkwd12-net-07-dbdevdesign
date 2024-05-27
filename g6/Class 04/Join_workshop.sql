--List all possible combinations of Customer names and Product names that can be ordered from specific customer 
SELECT C.[Name] AS CustomersName, P.[Name] ProductName --customerName and productName are the names of the columns shown in the result
FROM Customers C --c is the short name (alias) for customers table
CROSS JOIN Products AS P --as can be ommitted
ORDER BY c.[Name]

--List all Business Entities that have any Order 
SELECT DISTINCT BE.Id, BE.[Name] --with distinct we filter out duplicate names
FROM BusinessEntities BE
INNER JOIN Orders O --we want only the records that have an exact match
ON BE.Id = O.BusinessEntityId

--List all Entities without orders
SELECT BE.Id, BE.[Name], O.BusinessEntityId
FROM BusinessEntities BE 
LEFT OUTER JOIN Orders O --we need all business entitites including (and especially) the ones that do not have a match in the orders table
ON BE.Id = O.BusinessEntityId
WHERE O.BusinessEntityId IS NULL --we filter only the business entities that do not have a match in the orders table

--List all Customers without orders --using LEFT OUTER JOIN
SELECT C.[Name]
FROM Customers C
LEFT OUTER JOIN Orders O
ON O.CustomerId = C.Id
WHERE O.CustomerId IS NULL
ORDER BY C.[Name]

--List all Customers without orders --using RIGHT OUTER JOIN
SELECT C.[Name]
FROM Orders O
RIGHT OUTER JOIN Customers C
ON O.CustomerId = C.Id
WHERE O.CustomerId IS NULL
ORDER BY C.[Name]