USE SEDC

SELECT BusinessEntityId, SUM(TotalPrice) AS Total
FROM Orders
WHERE CustomerId < 50 --where filters before grouping the resultset
GROUP BY BusinessEntityId
HAVING SUM(TotalPrice) > 4213315.00 --having filters after grouping the resultset

SELECT Size, COUNT(*) AS [Count]
FROM BusinessEntities
GROUP BY Size
HAVING Size <> 'Medium'-- <> is a sign for not equals !=

SELECT [Name], Code, COUNT(*) AS ProductCount
FROM Products
GROUP BY [Name], Code
HAVING COUNT(*) = 1 AND Code LIKE '%W%' --the code should start with some characters then have W and then have some more characters

-- W% --starts with W and then we have some other characters
-- %W --ends with W