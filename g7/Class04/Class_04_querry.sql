--CLASS04 Build-in and SCALAR FUNCTIONS
--1st. Declare scalar variable for storing FirstName values
--2nd. Assign value ‘Aleksandar’ to the FirstName variable
--3rd. Find all Employees having FirstName same as the variable
--4th. Declare table variable that will contain EmployeeId and DateOfBirth
--5th. Fill the table variable with all Female employees
--6th. Declare temp table that will contain LastName and HireDate columns
--7th. Fill the temp table with employees having First Name starting with ‘A’
--8th. Retrieve the employees from the table which last name is with 7 characters

SELECT * FROM dbo.BusinessEntities
SELECT * FROM dbo.Employees
SELECT * FROM dbo.Products
SELECT * FROM dbo.Customers 
SELECT * FROM dbo.[Orders]
SELECT * FROM dbo.[OrderDetails]

--scalar variable
DECLARE @FirstName nvarchar(100) -- => 1st req
SET @FirstName = 'Aleksandar' -- => 2nd req

--3rd.
SELECT *
FROM dbo.Employees
WHERE FirstName = @FirstName
GO

--4th
DECLARE @EmployeeList TABLE
(EmployeeId int, FirstName nvarchar(100), DateOfBirth date);

--5th
INSERT INTO @EmployeeList
SELECT Id, FirstName, DateOfBirth
FROM dbo.Employees
WHERE Gender = 'F'

SELECT * FROM @EmployeeList
GO

--6th
CREATE TABLE #EmployeeList
(LastName nvarchar(100), HireDate date);

INSERT INTO #EmployeeList
SELECT LastName, HireDate
FROM dbo.Employees
WHERE FirstName LIKE 'A%'

--7th 
SELECT *
FROM #EmployeeList
WHERE LEN(LastName) = 7 -- => 8th requirement

DROP TABLE #EmployeeList
GO

--WORKSHOP2
--Declare scalar function (fn_FormatProductName) for retrieving the Product description for specific ProductId 
--in the following format:
--Second and Third character from the Code
--Last three characters from the Name
--Product Price

DROP FUNCTION IF EXISTS dbo.fn_FormatProductName;
GO

CREATE FUNCTION dbo.fn_FormatProductName (@ProductId int)
RETURNS nvarchar(100)
AS
BEGIN 

DECLARE @Output nvarchar(100)

SELECT @Output = SUBSTRING(Code, 2, 2) + RIGHT(Name, 3) + '-' + CAST(Price as nvarchar(10))
FROM dbo.Products
WHERE id = @ProductId

RETURN @Output

END
GO

--IN JS THIS SCALAR FUNCTION WOULD LOOK SOMETHING LIKE =>
--function dbo.fn_FormatProductName(productId) {
-- let output;
-- block of code logic to set value for output
-- return output
--}

--calling the function
SELECT *,dbo.fn_FormatProductName (id) as FunctionOutput
FROM dbo.Products
GO

--check this aswell
SELECT *,dbo.fn_FormatProductName (1) as FunctionOutput
FROM dbo.Products
GO


