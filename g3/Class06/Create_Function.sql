CREATE FUNCTION fn_FormatProductName (@ProductId INT)
RETURNS NVARCHAR(20)
AS
BEGIN
	DECLARE @Result NVARCHAR(20)

	SELECT @Result = SUBSTRING(Code, 2, 2) + '-' + RIGHT([Name], 3) + '-' + CONVERT (NVARCHAR, Price)
	FROM Products
	WHERE Id = @ProductId

	RETURN @Result
END
