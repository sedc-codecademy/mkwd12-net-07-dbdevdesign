--Calculate the total amount per BusinessEntity on all orders in the system and filter only total orders greater than 635558
SELECT BE.[Name], SUM(TotalPrice) AS Total
FROM Orders O
INNER JOIN BusinessEntities BE
ON BE.Id = O.BusinessEntityId
GROUP BY BE.[Name]
HAVING SUM(TotalPrice) > 635558
--Calculate the total amount per BusinessEntity on all orders in the system from Customers with ID < 20 
--and filter only total orders less than 10000000
SELECT BE.[Name], SUM(TotalPrice) AS Total
FROM Orders O
INNER JOIN BusinessEntities BE
ON BE.Id = O.BusinessEntityId
WHERE CustomerId < 100
GROUP BY BE.[Name]
HAVING SUM(TotalPrice) < 10000000

--Find the Maximal Order amount, and the Average Order amount per BusinessEntity on all orders in the system. 
--Filter only records where Total order amount is more than 4x bigger than average
SELECT BE.[Name], SUM(TotalPrice) AS Total, MAX(TotalPrice) AS MaxOrderPrice, AVG(TotalPrice) AS AvgTotalPrice
FROM Orders O
INNER JOIN BusinessEntities BE
ON BE.Id = O.BusinessEntityId
GROUP BY BE.[Name]
HAVING SUM(TotalPrice) > 4*AVG(TotalPrice)