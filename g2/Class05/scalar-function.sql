CREATE FUNCTION dbo.fn_EmployeeFullName(@EmployeeId INT)
RETURNS NVARCHAR(100)
AS
BEGIN
DECLARE @Result NVARCHAR(100)
SELECT @Result = CONCAT(FirstName, N' ', LastName)
FROM [dbo].[Employee]
WHERE Id = @EmployeeId

RETURN @Result
END
GO
SELECT dbo.fn_EmployeeFullName(1)
SELECT dbo.fn_EmployeeFullName(2)