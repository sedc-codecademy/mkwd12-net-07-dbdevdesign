SELECT [Name]
FROM [dbo].[BusinessEntity]
UNION
SELECT [Name]
FROM [dbo].[Customer]
GO

SELECT [Name]
FROM [dbo].[BusinessEntity]
UNION ALL
SELECT [Name]
FROM [dbo].[Customer]
GO

SELECT [FirstName],[LastName]
FROM [dbo].[Employee]
WHERE FirstName = 'Aleksandar'
INTERSECT
SELECT [FirstName],[LastName]
FROM [dbo].[Employee]
WHERE LastName = 'Nikolovski'


--List all regions where we have BusinessEntities and Customers in the same time

SELECT Region
FROM [dbo].[BusinessEntity]
INTERSECT
SELECT [RegionName]
FROM [dbo].[Customer]
GO