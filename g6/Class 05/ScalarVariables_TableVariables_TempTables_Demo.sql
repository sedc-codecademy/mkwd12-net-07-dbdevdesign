USE SEDC
GO 

DECLARE @EmployeeId INT
SET @EmployeeId = 1

SELECT @EmployeeId
GO

--SELECT @EmployeeId --not valid after the batch where it is declared has ended (ended by go)

DECLARE @EmployeeList TABLE --we need to declare the columns of the table variable, just like when we create a regular table
(EmployeeId INT NOT NULL, FirstName NVARCHAR(100), LastName NVARCHAR(100)) --you don't need to specify not null, by default every coulmn is not null 

INSERT INTO @EmployeeList
SELECT Id, Firstname, Lastname
FROM Employees

SELECT *
FROM @EmployeeList
GO

CREATE TABLE #EmployeeList2  --# means that it is a temp table
(EmployeeId INT NOT NULL, FirstName NVARCHAR(100), LastName NVARCHAR(100))

INSERT INTO #EmployeeList2
SELECT Id, Firstname, Lastname
FROM Employees

SELECT *
FROM #EmployeeList2
GO

--scalar variables examples
DECLARE @Firstname NVARCHAR(100), @LastName NVARCHAR(100), @Fullname NVARCHAR(201)
SET @Firstname = 'Ana'
SET @LastName = 'Stojanovski'

SET @Fullname = @Firstname + ' ' + @LastName

SELECT @Fullname

SELECT *
FROM Employees
WHERE FirstName LIKE '%' + @Firstname + '%'
GO

--table variable example
DECLARE @FemaleEmployeeList TABLE(EmployeeId INT, Firstname NVARCHAR(100), Lastname NVARCHAR(100))
INSERT INTO @FemaleEmployeeList VALUES(101, 'Tijana', 'Stojanovska')  --we are inserting into the table variable @FemaleEmployeeList, NOT INTO the table Employees (the values in the table Employees are not affected)

INSERT INTO @FemaleEmployeeList --we are inserting into the table variable @FemaleEmployeeList, NOT INTO the table Employees (the values in the table Employees are not affected)
SELECT Id, Firstname, Lastname
FROM Employees
WHERE Gender = 'F'

SELECT * 
FROM @FemaleEmployeeList
GO

--temp table example
CREATE TABLE #FemaleEmployeeList (EmployeeId INT, Firstname NVARCHAR(100), Lastname NVARCHAR(100))
INSERT INTO #FemaleEmployeeList VALUES(101, 'Tijana', 'Stojanovska')  --we are inserting into the temp table #FemaleEmployeeList, NOT INTO the table Employees (the values in the table Employees are not affected)

INSERT INTO #FemaleEmployeeList --we are inserting into the temp table #FemaleEmployeeList, NOT INTO the table Employees (the values in the table Employees are not affected)
SELECT Id, Firstname, Lastname
FROM Employees
WHERE Gender = 'F'

SELECT * 
FROM #FemaleEmployeeList
GO