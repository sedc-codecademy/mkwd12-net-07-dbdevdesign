SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		G6
-- Create date: 28.05.2024
-- Description:	A function that returns employee full name by id
-- =============================================
CREATE FUNCTION GetEmployeeFullNameById  -- public string GetEmployeeFullNameById(int employeeId)
(
	@EmployeeId INT -- this is the employeeId param 
)
RETURNS NVARCHAR(202) --this is the return type (string)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result NVARCHAR(202)

	-- Add the T-SQL statements to compute the return value here
	SELECT @Result = Firstname + ' ' + Lastname
	FROM Employees
	WHERE Id = @EmployeeId

	-- Return the result of the function
	RETURN @Result

END
GO

SELECT dbo.GetEmployeeFullNameById(15) --always call it with the schema (dbo)
