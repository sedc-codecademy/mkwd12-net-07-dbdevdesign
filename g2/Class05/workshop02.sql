ALTER FUNCTION dbo.fn_FormatProductName(@ProductId INT)
RETURNS NVARCHAR(100)
AS
BEGIN
DECLARE @Result NVARCHAR(100)
SELECT @Result = SUBSTRING(Code, 2, 2) + '-' + RIGHT(Name, 3) + '-' + CAST(Price as nvarchar(10))
FROM [dbo].[Product]
WHERE Id = @ProductId

RETURN @Result
END
GO

SELECT *, dbo.fn_FormatProductName(id) as FunctionOutput
FROM [dbo].[Product]