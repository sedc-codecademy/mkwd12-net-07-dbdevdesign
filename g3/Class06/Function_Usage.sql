SELECT dbo.fn_FormatProductName(7)

SELECT *
	,dbo.fn_FormatProductName(Id) AS ProductFuncName
FROM Products
WHERE Price < 100
