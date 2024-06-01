--CLASS 07 => ERROR HANDLING

-- GET ERROR NUMBER
BEGIN TRY
-- generate a divide by zero error
SELECT 1/0
END TRY
BEGIN CATCH
SELECT ERROR_NUMBER() AS ErrorNumber
END CATCH
GO

-- GET ERROR SEVERITY
BEGIN TRY
-- generate a vidide by zero
SELECT 1/0
END TRY
BEGIN CATCH
SELECT ERROR_SEVERITY() AS ErrorSeverity
END CATCH
GO

-- GET ERROR STATE
BEGIN TRY
SELECT 1/0;
END TRY
BEGIN CATCH
SELECT ERROR_STATE() AS ErrorState;
END CATCH
GO

-- GET ERROR_PROCEDURE
use PizzaDB

IF OBJECT_ID ( 'usp_ExampleProc', 'P' ) IS NOT NULL
DROP PROCEDURE ups_ExampleProc1;
GO

--CREATE a stored procedure that will generate a divide by zero error
CREATE PROCEDURE usp_ExampleProc1
AS
SELECT 1/0;
GO

BEGIN TRY
-- We execute the stored procedure inside the TRY block
EXECUTE usp_ExampleProc1;
END TRY
BEGIN CATCH
SELECT ERROR_PROCEDURE() AS ErrorProcedure;
END CATCH
GO

--GET ERROR MESSAGE
BEGIN TRY
SELECT 1/0;
END TRY
BEGIN CATCH;
SELECT ERROR_MESSAGE() AS ErrorMessage;
END CATCH
GO

-- ALL TOGETHER ALL THE ERROR MESSAGES
-- verifying of the stored procedure does not already exist

IF OBJECT_ID ( 'usp_GetErrorInfo', 'P') IS NOT NULL
DROP PROCEDURE usp_GetErrorInfo;
GO

-- Create procedure to retrieve error information
CREATE PROCEDURE usp_GetErrorInfo
AS
SELECT
ERROR_NUMBER() AS ErrorNumber,
ERROR_SEVERITY() AS ErrorSeverity,
ERROR_STATE() AS ErrorState,
ERROR_PROCEDURE() AS ErrorProcedure,
ERROR_LINE() AS ErrorLine,
ERROR_MESSAGE() AS ErrorMessage;
GO

BEGIN TRY
SELECT 1/0;
END TRY
BEGIN CATCH
EXECUTE usp_GetErrorInfo;
END CATCH;

----------
-- The same thing as above but in a different way =>
IF OBJECT_ID ('usp_ExampleProc', 'P' ) IS NOT NULL
DROP PROCEDURE usp_ExampleProc;
GO

-- CREATE A PROCEDURE THAT WILL DIVIDE BY ZERO
CREATE PROCEDURE usp_ExampleProc
AS 
SELECT 1/0;
GO

BEGIN TRY
EXECUTE usp_ExampleProc
END TRY
BEGIN CATCH
SELECT
ERROR_NUMBER() AS ErrorNumber,
ERROR_SEVERITY() AS ErrorSeverity,
ERROR_STATE() AS ErrorState,
ERROR_PROCEDURE() AS ErrorProcedure,
ERROR_LINE() AS ErrorLine,
ERROR_MESSAGE() AS ErrorMessage;
END CATCH 
GO

--------------------- BEST WAY --------------

BEGIN TRY
EXECUTE usp_ExampleProc
END TRY
BEGIN CATCH
EXECUTE usp_GetErrorInfo;
END CATCH 
GO
