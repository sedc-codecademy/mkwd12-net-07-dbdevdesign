SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		G6
-- Create date: 30.05.2024
-- Description:	Stored procedure demo
-- =============================================
CREATE PROCEDURE TestPrint
			@First INT = 0,
			@Second INT = 1
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    PRINT 'First'
	PRINT @First
	PRINT 'Second'
	PRINT @Second
END
GO

EXEC TestPrint
EXEC TestPrint @First = 3
EXEC TestPrint @Second = 3
EXEC TestPrint 10, 20
EXEC TestPrint @Second = 50, @First= 100