USE SEDC

-- scalar variable
DECLARE @FirstName nvarchar(50), @LastName nvarchar(50)
SET @FirstName = 'Aleksandar'
--SELECT @FirstName, @LastName

SELECT @FirstName = 'Edi', @LastName = 'Stojanovski'

SELECT @FirstName, @LastName

DECLARE @FullName nvarchar(100)
SET @FullName = @FirstName + ' ' + @LastName

SELECT @FullName

SELECT *
FROM [dbo].[Employee]
WHERE [FirstName] = @FirstName

GO
--ERROR, the variables must be in the scope where is declare
--SELECT @FirstName, @LastName

-- Table variable
DECLARE @FemaleEmployeeList TABLE 
(EmployeeId INT NOT NULL, FirstName nvarchar(100), LastName nvarchar(100));

INSERT INTO @FemaleEmployeeList (EmployeeId, FirstName, LastName)
VALUES (101, 'Ana', 'Nikolova')
INSERT INTO @FemaleEmployeeList (EmployeeId, FirstName, LastName)
VALUES (102, 'Aleksandra', 'Nikolova')

SELECT *
FROM @FemaleEmployeeList

INSERT INTO @FemaleEmployeeList (EmployeeId, FirstName, LastName)
SELECT Id, FirstName, LastName
FROM [dbo].[Employee]
WHERE Gender = 'F'

SELECT *
FROM @FemaleEmployeeList
GO
--ERROR, the e table variables must be in the scope where is declare
--SELECT *
--FROM @FemaleEmployeeList

-- Temp table
CREATE TABLE #FemaleEmployeeList
(EmployeeId INT NOT NULL, FirstName nvarchar(100), LastName nvarchar(100));

INSERT INTO #FemaleEmployeeList (EmployeeId, FirstName, LastName)
VALUES (101, 'Ana', 'Nikolova')
INSERT INTO #FemaleEmployeeList (EmployeeId, FirstName, LastName)
VALUES (102, 'Aleksandra', 'Nikolova')

SELECT *
FROM #FemaleEmployeeList
GO
SELECT *
FROM #FemaleEmployeeList

INSERT INTO #FemaleEmployeeList (EmployeeId, FirstName, LastName)
SELECT Id, FirstName, LastName
FROM [dbo].[Employee]
WHERE Gender = 'F'

SELECT *
FROM #FemaleEmployeeList

-- CONTROL FLOW
DECLARE @Name nvarchar(50)
SET @Name = 'B';

IF(LEN(@Name) < 2)
	SELECT 'To short name'
ELSE
	SELECT @Name
