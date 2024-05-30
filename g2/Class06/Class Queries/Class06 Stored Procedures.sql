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
EXEC usp_GetEmployeesByIds @IdOne = 5, @IdTwo = 25, @IdThree = 55
GO