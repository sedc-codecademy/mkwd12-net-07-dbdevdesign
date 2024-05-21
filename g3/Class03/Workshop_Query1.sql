--Find all Employees with FirstName = Goran
SELECT *
FROM Employees
WHERE FirstName = 'Goran'

--Find all Employees with LastName starting With ‘S’
SELECT *
FROM Employees
WHERE LastName LIKE 'S%'

--Find all Employees with DateOfBirth greater than ‘01.01.1988’
SELECT *
FROM Employees
WHERE DateOfBirth >= '1988-01-01'

--Where DateOfBirth < GETDATE() --gets current datetime
--Find all Male employees
SELECT *
FROM Employees
--Where Gender = 'M'
--Where Gender LIKE 'M'
WHERE Gender <> 'F'

--Find all employees hired in January/1998
SELECT *
FROM Employees
WHERE HireDate >= '1998-01-01'
	AND HireDate <= '1998-01-31'

--Find all Employees with LastName starting With ‘A’ hired in January/2019
SELECT *
FROM Employees
WHERE HireDate >= '2019-01-01'
	AND HireDate <= '2019-01-31'
	AND LastName LIKE 'A%'

--Find all Employees with FirstName = Aleksandar ordered by Last Name
SELECT *
FROM Employees
WHERE FirstName = 'Aleksandar'
ORDER BY LastName ASC

--List all Employees ordered by FirstName
SELECT *
FROM Employees
ORDER BY FirstName ASC
--Order By FirstName, LastName ASC

--Find all Male employees ordered by HireDate, starting from the last hired
SELECT *
FROM Employees
WHERE Gender = 'M'
ORDER BY HireDate DESC

--List all regions where we have BusinessEntities and Customers in the same time
SELECT Region
FROM BusinessEntities
UNION
SELECT RegionName
FROM Customers
WHERE IsActive = 1

SELECT Region
FROM BusinessEntities
INTERSECT
SELECT RegionName
FROM Customers
WHERE IsActive = 1

