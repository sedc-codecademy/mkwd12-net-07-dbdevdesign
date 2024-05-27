USE SEDC
GO

-- ==================== AGGREGATE FUNCTIONS ====================
-- perform calculations on a set of values and return a single value

-- *** COUNT ***
SELECT * FROM dbo.Employee e

-- ====> Example: Total number of emlpoyees
SELECT COUNT(*) FROM dbo.Employee e -- without column name
SELECT COUNT(*) AS NumberOfEmployees FROM dbo.Employee -- with column name

-- ====> Example: Employees with name Aleksandar
SELECT COUNT(e.Id) as [Employees with name Aleksandar count] 
FROM dbo.Employee e
WHERE e.FirstName = 'Aleksandar'

-- ====> Example: Count of Employees unique names
SELECT COUNT(DISTINCT e.FirstName) as [Unique names count] 
FROM dbo.Employee e
GO

-- *** SUM ***
SELECT * FROM dbo.[Order] o

-- Example: Total price of all orders
SELECT SUM(o.TotalPrice) as OrdersTotalPrice
FROM dbo.[Order] o
GO

-- *** AVG ***
-- Example: Average price of all orders
SELECT AVG(o.TotalPrice) as AverageOrderPrice 
FROM dbo.[Order] o
GO

-- *** MIN ***
-- Example: Cheapest order
SELECT MIN(o.TotalPrice) as CheapestOrder 
FROM dbo.[Order] o
GO

-- *** MAX ***
-- Example: Most expensive order
SELECT MAX(o.TotalPrice) as ExpensiveOrder
FROM dbo.[Order] o
GO

-- *** STRING_AGG ***
-- combining multiple string values from rows into a single concatenated string (ex. comma-separated lists)
SELECT be.Name FROM BusinessEntity be
SELECT STRING_AGG(be.Name, ', ') as [Business Entity Names]
FROM BusinessEntity be
GO


-- ===================== GROUPING (GROUP BY) =====================
-- GROUPING => used to organize data into groups based on one or more columns using the 'GROUP BY' clause

-- ===> Example: Most expensive order by Business Entity
SELECT be.Region, MAX(o.TotalPrice) as ExpensiveOrder
FROM dbo.[Order] o
INNER JOIN dbo.BusinessEntity be ON o.BusinessEntityId = be.Id
GROUP BY be.Region
GO

-- ====> Example: Count of employees by gender
SELECT * FROM dbo.Employee

SELECT e.Gender, COUNT(*) as NumberOfEmployees
FROM dbo.Employee e
GROUP BY e.Gender
GO

-- ====> Example: Count of orders by customer region
SELECT * FROM dbo.Customer 
SELECT * FROM dbo.[Order] 

SELECT c.RegionName, COUNT(o.Id) as CountOfOrders 
FROM dbo.Customer c
INNER JOIN dbo.[Order] o ON c.Id = o.CustomerId
GROUP BY c.RegionName
--ORDER BY 1 asc -- same as ORDER BY c.RegionName
GO

-- ====> Example: Count of orders by Customer Region AND Customer Size
SELECT c.RegionName, c.CustomerSize, COUNT(o.Id) as CountOfOrders 
FROM dbo.Customer c
INNER JOIN dbo.[Order] o ON c.Id = o.CustomerId
GROUP BY c.RegionName, c.CustomerSize 


-- ===================== Filtering the grouped data with *HAVING* =====================

-- ===> Example: Count of orders by Region (without Skopski region)
SELECT c.RegionName as Region, COUNT(o.Id) as NumberOfOrders
FROM dbo.[Order] o
JOIN dbo.Customer c ON o.CustomerId = c.Id
WHERE c.RegionName <> 'Skopski'  
GROUP BY c.RegionName
--WHERE c.RegionName <> 'Skopski' -- ERROR! We cannot use WHERE after GROUP BY clause


-- ===> Example: Count of orders by region with orders count above 500
SELECT c.RegionName as Region, COUNT(o.Id) as NumberOfOrders
FROM dbo.[Order] o
JOIN dbo.Customer c ON o.CustomerId = c.Id
WHERE c.RegionName <> 'Skopski' --and COUNT(o.Id) > 500 -- ERROR!
GROUP BY c.RegionName
HAVING COUNT(o.Id) > 500
GO