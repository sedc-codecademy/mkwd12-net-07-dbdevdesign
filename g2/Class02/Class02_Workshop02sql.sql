--Find all Employees with FirstName = Aleksandar ordered by Last Name
--List all Employees ordered by FirstName
--Find all Male employees ordered by HireDate, starting from the last hired

SELECT *
FROM [dbo].[Employee]
WHERE FirstName = 'Aleksandar'
ORDER BY LastName ASC
GO

SELECT *
FROM [dbo].[Employee]
ORDER BY FirstName
Go

SELECT *
FROM [dbo].[Employee]
WHERE Gender = 'M'
ORDER BY [HireDate] DESC
GO