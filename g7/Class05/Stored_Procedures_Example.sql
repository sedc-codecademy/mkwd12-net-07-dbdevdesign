USE [SEDC]
GO

--CREATING STORED PROCEDURE
CREATE OR ALTER PROCEDURE TestPrint (@First as int = 0, @Second as int = 1)
AS 
BEGIN
PRINT 'First'
PRINT @First
PRINT 'Second'
PRINT @Second
END

--WAYS OF EXECUTING THE PROCEDURE
EXEC TestPrint
EXEC TestPrint @First=1
EXEC TestPrint @Second= 10
EXEC TestPrint 10, 20
EXEC TestPrint @Second=50, @First=100

DECLARE @RetunValue int
EXEC @RetunValue = TestPrint
SELECT @RetunValue AS ReturnValue