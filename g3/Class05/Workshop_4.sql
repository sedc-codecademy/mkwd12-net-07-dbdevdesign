--Declare scalar variable for storing FirstName values
DECLARE @Name NVARCHAR(100)

--Assign value ‘Aleksandar’ to the FirstName variable
SET @Name = 'Aleksandar'

--Find all Employees having FirstName same as the variable
SELECT *
FROM Employees
WHERE FirstName = @Name

--Declare table variable that will contain EmployeeId and DateOfBirth
DECLARE @FemaleEmployees TABLE (
	EmployeeId INT
	,DateOfBirth DATE
	)

--Fill the table variable with all Female employees
INSERT INTO @FemaleEmployees
SELECT Id
	,DateOfBirth
FROM Employees
WHERE Gender = 'F'

SELECT *
FROM @FemaleEmployees

--Declare temp table that will contain LastName and HireDate columns
CREATE TABLE #TempEmployeesTable (
	LastName NVARCHAR(100)
	,HireDate DATE
	)

--Fill the temp table with all Male employees having First Name starting with ‘A’
INSERT INTO #TempEmployeesTable
SELECT LastName
	,HireDate
FROM Employees
WHERE LEFT(FirstName, 1) = 'A'
	AND Gender = 'M'

	--Retrieve the employees from the table which last name is with 7 characters
SELECT *
FROM #TempEmployeesTable
WHERE LEN(LastName) = 7

DROP TABLE #TempEmployeesTable
