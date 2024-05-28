--Excercise 2
-- FIND ALL EMPLOYEES BY GIVEN GENDER, PLUS RETURN THE TOTAL COUNT OF THOSE EMPLOYEES

--USE [SEDC]
--SELECT * FROM dbo.Employees

CREATE PROCEDURE usp_GetEmployeesByGivenGender
(
@Gender nchar(1) = 'M',
@GenderCount int OUT
)
AS 
BEGIN

--First req => find all employees by given gender
SELECT *
FROM dbo.Employees
WHERE Gender = @Gender

--Second requirement =>get total number of employees per given gender
SELECT @GenderCount = COUNT(*)
FROM dbo.Employees
WHERE Gender = @Gender

END
GO

DECLARE @ReturnValue int, @GenderCountOut int

EXEC @ReturnValue = usp_GetEmployeesByGivenGender @Gender = 'F', @GenderCount = @GenderCountOut OUTPUT;
SELECT @ReturnValue AS ReturnValue, @GenderCountOut AS GenderCountOut

