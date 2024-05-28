--EXCERCISE 3
-- MAKE A STORED PROCEDURE THAT INSERTS RECORDS INTO EMPLOYEE TABLE AND RETURN THE EMPLOYEE ID

--SELECT * 
--FROM dbo.Employees

CREATE OR ALTER PROCEDURE dbo.usp_InsertEmployee
(
@FirstName nvarchar(100), @LastName nvarchar(100), @DateOfBirth date, @Gender nchar(1), @HireDate date,
@NationalIdNumber nvarchar(20), @EmployeeID int OUT
)
AS 
BEGIN
INSERT INTO dbo.Employees ([FirstName], [LastName], [DateOfBirth], [Gender], [HireDate], [NationalIdNumber])
VALUES (@FirstName, @LastName, @DateOfBirth, @Gender, @HireDate, @NationalIdNumber)

--Scope_identity return the last identity value into an identity column in the same scope.
--a scope is a module: stored procedure, function, batch

SET @EmployeeID = SCOPE_IDENTITY()
SELECT * 
FROM dbo.Employees 
WHERE ID = @EmployeeID
END
GO

DECLARE @ReturnValue int, @EmployeeIdOut int

EXEC @ReturnValue = dbo.usp_InsertEmployee
@FirstName = 'TestNameOneTWO',
@LastName = 'TestLastNameOneTWO',
@DateOfBirth = '1960-04-05',
@Gender = 'F',
@HireDate = '1993-04-05',
@NationalIdNumber = '987654345',
@EmployeeId = @EmployeeIdOut OUT

SELECT @ReturnValue as ReturnValue, @EmployeeIdOut as EmployeeIdOut
SELECT * FROM Employees
