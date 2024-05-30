USE SEDC
GO

-- ================ RECAP - Scalar Functions ================

SELECT * FROM dbo.Employee
SELECT [dbo].[fn_EmployeeFullName](1) AS EmployeeFullName
GO

-- ===> Alter the function to return uppercased full name
ALTER FUNCTION [dbo].[fn_EmployeeFullName](@EmployeeId INT)
RETURNS NVARCHAR(100)
AS
BEGIN
    DECLARE @Result NVARCHAR(100)
    SELECT @Result = CONCAT(FirstName, N' ', LastName)
    FROM [dbo].[Employee]
    WHERE Id = @EmployeeId

    RETURN UPPER(@Result) 
END
GO

-- ===> Assign the return value to a variable
DECLARE @FirstEmployeeFullName nvarchar(100)
SET @FirstEmployeeFullName = dbo.fn_EmployeeFullName(1)
SELECT @FirstEmployeeFullName as FirstEmployee
GO

-- ===> Write function to insert new Employee (CANNOT BE DONE WITH SCALAR FUNCTIONS!)
CREATE FUNCTION fn_InsertEmployee
(
	@FirstName nvarchar(100),
	@LastName nvarchar(100),
	@DateOfBirth date,
	@Gender nchar,
	@HireDate date,
	@NationalIdNumber nvarchar(20)
)
RETURNS int
AS
BEGIN
	-- CANNOT MANIPULATE WITH TABLES DATA OR DEFINITION(STRUCTURE) WITH SCALAR FUNCTIONS !!!
	INSERT INTO [dbo].[Employee]
           ([FirstName] ,[LastName],[DateOfBirth],[Gender],[HireDate],[NationalIdNumber])
     VALUES (@FirstName, @LastName, @DateOfBirth, @Gender, @HireDate, @NationalIdNumber)

	 RETURN SCOPE_IDENTITY()
END