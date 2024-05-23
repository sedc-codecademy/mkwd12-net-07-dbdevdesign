USE SEDC
GO

-- ==================== AGGREGATE FUNCTIONS ====================

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
-- ====> Example
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
--ORDER BY 1 asc

SELECT c.RegionName, c.CustomerSize, COUNT(o.Id) as CountOfOrders 
FROM dbo.Customer c
INNER JOIN dbo.[Order] o ON c.Id = o.CustomerId
GROUP BY c.RegionName, c.CustomerSize