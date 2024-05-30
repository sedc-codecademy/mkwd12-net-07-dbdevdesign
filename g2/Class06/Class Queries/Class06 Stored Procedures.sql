USE SEDC
GO

-- ================== STORED PROCEDURES ==================

-- ====> Example: Get All Employees
CREATE OR ALTER PROCEDURE usp_GetAllEmployees
AS
BEGIN
	SELECT * FROM dbo.Employee
END
GO
-- ==> Calling usp_GetAllEmployees
EXECUTE usp_GetAllEmployees
EXEC usp_GetAllEmployees
GO


-- ====> Example: Get Employee by Id
CREATE OR ALTER PROCEDURE usp_GetEmployeeById (@EmployeeId int)
AS
BEGIN
	SELECT * FROM Employee WHERE Id = @EmployeeId
END
GO
-- ==> Calling the procedure (with one argument)
EXEC usp_GetEmployeeById 13
--EXEC usp_GetEmployeeById 'text' -- ERROR!
--EXEC usp_GetEmployeeById 13, 14 -- ERROR!

EXEC usp_GetEmployeeById @EmployeeId = 50
GO


-- ====> Example: Get Employee by Ids
CREATE OR ALTER PROCEDURE usp_GetEmployeesByIds (@IdOne int, @IdTwo int, @IdThree int)
AS
BEGIN
	--SELECT * FROM Employee WHERE Id = @IdOne or Id = @IdTwo or Id = @IdThree
	SELECT * FROM Employee WHERE Id in (@IdOne, @IdTwo, @IdThree)
END
GO
-- ==> Calling usp_GetEmployeesByIds (with multiple arguments)
EXEC usp_GetEmployeesByIds 1, 10, 100
EXEC usp_GetEmployeesByIds 
	@IdOne = 5, 
	@IdTwo = 25, 
	@IdThree = 55
GO


-- ====> Example: Insert new Employee

CREATE OR ALTER PROCEDURE dbo.usp_InsertEmployee
(
	--@Id int, -- NO !
	@FirstName nvarchar(100),
	@LastName nvarchar(100),
	@DateOfBirth date,
	@Gender nchar,
	@HireDate date,
	@NationalIdNumber nvarchar(20)
)
AS
BEGIN
	INSERT INTO [dbo].[Employee]
           ([FirstName] ,[LastName],[DateOfBirth],[Gender],[HireDate],[NationalIdNumber])
     VALUES (@FirstName, @LastName, @DateOfBirth, @Gender, @HireDate, @NationalIdNumber)
	 --SELECT SCOPE_IDENTITY() as [LastEmployeeId] -- will return the last added Id in the scope where it is called
END
GO

--EXEC dbo.usp_InsertEmployee 'Bob', 'Bobsky', '1990-01-01', 'M', '2010-10-10', '11111111' -- BAD EXAMPLE !!!

SELECT * FROM dbo.Employee e ORDER BY e.Id desc
GO

DECLARE @ResultValue int
EXEC @ResultValue = dbo.usp_InsertEmployee 
	@FirstName = 'Boba',
	@DateOfBirth = '1990-01-01',
	@NationalIdNumber = '111111111',
	@Gender = 'F',
	@HireDate = '2010-10-10',
	@LastName = 'Bobsky' -- when using named arguments, the order doesn't matter
SELECT @ResultValue
GO

-- ===> Alter the usp_InsertEmployee procedure to Return the Id of the new Employee

CREATE OR ALTER PROCEDURE dbo.usp_InsertEmployee
(
	@FirstName nvarchar(100),
	@LastName nvarchar(100),
	@DateOfBirth date,
	@Gender nchar,
	@HireDate date,
	@NationalIdNumber nvarchar(20),
	@EmployeeId int OUT
)
AS
BEGIN
	INSERT INTO [dbo].[Employee]
           ([FirstName] ,[LastName],[DateOfBirth],[Gender],[HireDate],[NationalIdNumber])
     VALUES (@FirstName, @LastName, @DateOfBirth, @Gender, @HireDate, @NationalIdNumber)
	 
	 SET @EmployeeId = SCOPE_IDENTITY()
	 -- SCOPE_IDENTITY() returns the last added Id in the scope
END
GO

DECLARE @EmployeeIdOUT int
EXEC dbo.usp_InsertEmployee 
	@FirstName = 'John',
	@DateOfBirth = '1990-01-01',
	@NationalIdNumber = '111111111',
	@Gender = 'M',
	@HireDate = '2010-10-10',
	@LastName = 'Bobsky',
	@EmployeeId = @EmployeeIdOUT OUT
SELECT @EmployeeIdOUT as LastAddedEmployee

SELECT * FROM dbo.Employee e ORDER BY e.Id DESC


-- ============== Scalar Functions vs Stored Procedures  ==============

-- *** Scalar Functions ***
-- The only statement that we can use is SELECT 
-- Must return a single value
-- Cannot modify tables data, nor tables definitions (structure)
-- Primarily used for data transformation and calculation within SQL queries

-- *** Stored Procedures ***
-- Can manipulate with both tables data and tables definitions (structure) and even create new db objects 
-- All statements can be used (SELECT, DROP, ALTER, CREATE, DELETE, INSERT, UPDATE etc...)
-- Doesn't need to return value
-- Can return multiple values
-- More suitable for complex operations and performance improvements
