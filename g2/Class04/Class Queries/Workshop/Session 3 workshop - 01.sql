-- REQUIREMENT 01

-- Calculate the total amount on all orders in the system
SELECT SUM(TotalPrice) as [Orders Total Price] 
FROM dbo.[Order]
GO --6320732.00

-- Calculate the total amount per BusinessEntity on all orders in the system
SELECT b.Name, SUM(TotalPrice) as Total
FROM dbo.[Order] o
JOIN dbo.BusinessEntity b on o.BusinessEntityId = b.Id
GROUP BY b.Name
GO

-- Calculate the total amount per BusinessEntity on all orders in the system from Customer with ID < 20
SELECT b.Name, SUM(TotalPrice) as Total
FROM dbo.[Order] o
join dbo.BusinessEntity b on o.BusinessEntityId = b.Id
WHERE CustomerId < 20
GROUP BY b.Name
Order by SUM(TotalPrice) desc
GO

--Find the Maximal Order amount, and the Average Order amount per BusinessEntity on all orders in the system
SELECT 
	be.Id AS [Business Entity Id], 
	be.Name AS BusinessEntityName,
    MAX(o.TotalPrice) AS MaxOrderAmount,
    AVG(o.TotalPrice) AS AvgOrderAmount
FROM dbo.BusinessEntity be
JOIN dbo.[Order] o ON be.Id = o.BusinessEntityId
GROUP BY be.Id, be.Name;