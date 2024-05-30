SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		G6
-- Create date: 30.05.2024
-- Description:	Declare scalar function (fn_FormatProductName) for retrieving the Product description for specific 
				--ProductId in the following format:
				--Second and Third character from the Code
				--Last three characters from the Name
				--Product Price
-- =============================================
CREATE FUNCTION fn_FormatProductName
(
	@ProductId INT
)
RETURNS NVARCHAR(250)
AS
BEGIN
	-- Declare the return variable here
	DECLARE @Result NVARCHAR(250)

	-- Add the T-SQL statements to compute the return value here
    SELECT @Result = SUBSTRING(Code, 2, 2) + '-' + RIGHT([Name], 3) + '-' + CONVERT(NVARCHAR(30), Price) --CAST(Price AS NVARCHAR(30))
	FROM Products
	WHERE Id = @ProductId
	-- Return the result of the function
	RETURN @Result

END
GO

--SELECT dbo.fn_FormatProductName(44)
SELECT dbo.fn_FormatProductName(47)