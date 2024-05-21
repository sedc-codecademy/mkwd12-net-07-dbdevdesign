--List all possible combinations of Customer names and Product names that can be ordered from specific customer 
SELECT c.Name as CustomerName, p.Name as ProductName
FROM [dbo].[Customer] c
CROSS JOIN [dbo].[Product] p
GO
--List all Business Entities that have any Order 
SELECT DISTINCT b.Name
FROM [dbo].[Order] o
INNER JOIN [dbo].[BusinessEntity] b ON b.Id = o.BusinessEntityId
GO
--List all Entities without orders
SELECT b.Name, o.BusinessEntityId
FROM [dbo].[BusinessEntity] b
LEFT JOIN [dbo].[Order] o ON b.Id = o.BusinessEntityId
WHERE o.BusinessEntityId is NULL
GO
--List all Customers without orders (using Right Join and using Left join)
--RIGHT JOIN
SELECT c.Name, o.*
FROM [dbo].[Order] o
RIGHT JOIN [dbo].[Customer] c ON o.CustomerId = c.Id
WHERE o.CustomerId is NULL
GO
--LEFT JOIN
SELECT c.Name, o.*
FROM [dbo].[Customer] c
LEFT JOIN [dbo].[Order] o ON c.Id = o.CustomerId
WHERE o.CustomerId is NULL
GO
