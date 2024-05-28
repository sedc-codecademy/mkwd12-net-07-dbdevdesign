--Declare scalar variable for storing FirstName values
--Assign value ‘Aleksandar’ to the FirstName variable
--Find all Employees having FirstName same as the variable
--Declare table variable that will contain EmployeeId and DateOfBirth
--Fill the table variable with all Female employees
--Declare temp table that will contain LastName and HireDate columns
--Fill the temp table with all Male employees having First Name starting with ‘A’
--Retrieve the employees from the table which last name is with 7 characters

DECLARE @FirstName nvarchar(50)
SET @FirstName = 'Aleksandar'
SELECT @FirstName

SELECT *
FROM [dbo].[Employee]
WHERE FirstName = @FirstName
GO

-- table variable
DECLARE @EmployeeList TABLE (EmployeeId INT, DateOfBirth DATE)
INSERT INTO @EmployeeList (EmployeeId, DateOfBirth)
SELECT Id, DateOfBirth
FROM [dbo].[Employee]
WHERE Gender = 'F'

SELECT * FROM @EmployeeList
GO

--temp table
CREATE TABLE #EmployeeList (LastName nvarchar(50), HireDate date)

INSERT INTO #EmployeeList(LastName, HireDate)
SELECT LastName, HireDate
FROM [dbo].[Employee]
WHERE Gender = 'M' AND FirstName LIKE 'A%'

SELECT *
FROM #EmployeeList
Where LEN(LastName) = 7

SELECT * FROM #EmployeeList
GO

DROP TABLE #EmployeeList
GO