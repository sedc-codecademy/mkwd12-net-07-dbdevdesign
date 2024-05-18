-- FIltering 


SELECT * FROM dbo.Employees
WHERE FirstName = 'Aleksandar'

-- Workshop 01

-- Find all Employees with FirstName = Goran

SELECT * FROM Employees 
WHERE FirstName = 'Goran'

-- Find all Employees with LastName starting With ‘S’

SELECT * FROM Employees
WHERE LastName like 'S%' -- starts with 'S'

-- Find all Employees with DateOfBirth greater than ‘01.01.1988’

SELECT * FROM Employees
WHERE DateOfBirth > '1988.01.01'

-- Find all Male employees

SELECT * FROM Employees
WHERE Gender = 'M'

-- Find all employees hired in January/1998

SELECT * FROM Employees
WHERE HireDate >= '1998.01.01' AND HireDate < '1998.02.01'

-- Find all Employees with LastName starting With ‘A’ hired in January/2019

SELECT * FROM Employees
WHERE LastName like 'A%' AND HireDate >= '2019.01.01' AND HireDate < '2019.02.01'


-- Find all eployees that FirstName starts with A or B
SELECT * FROM Employees
WHERE FirstName like 'A%' OR FirstName like 'B%'
-- Same results
SELECT * FROM Employees
WHERE FirstName like '[AB]%'

-- Find all Employees that Gender is diferent that Male
SELECT * FROM Employees
WHERE Gender <> 'M'