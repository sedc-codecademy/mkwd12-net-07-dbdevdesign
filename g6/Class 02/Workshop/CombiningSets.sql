-- Combining Data

-- Union

SELECT [Name] FROM BusinessEntities
UNION
SELECT [Name] FROM Customers

-- Union All

SELECT [Name] FROM BusinessEntities
UNION ALL
SELECT [Name] FROM Customers


-- Intersect

SELECT FirstName, LastName FROM Employees
WHERE FirstName = 'Aleksandar'
INTERSECT
SELECT FirstName, LastName FROM Employees
WHERE LastName = 'Nikolovski'

-- Except

SELECT FirstName, LastName FROM Employees
WHERE FirstName = 'Aleksandar'
EXCEPT
SELECT FirstName, LastName FROM Employees
WHERE LastName = 'Nikolovski'


-- List all regions where we have BusinessEntities and Customers in the same time

SELECT Region FROM BusinessEntities
INTERSECT
SELECT RegionName FROM Customers


--SELECT FirstName FROM Employees
--WHERE LastName like 'N%'
--UNION
--SELECT FirstName FROM Employees
--WHERE LastName like 'N%'
--INTERSECT
--SELECT FirstName FROM Employees
--ORDER BY FirstName