CREATE PROCEDURE dbo.sp_CreateOrderDetails (
	@OrderId INT
	,@ProductId INT
	,@Quantity INT
	)
AS
BEGIN
	--INSERT INTO [dbo].[OrderDetails] (
	--	[OrderId]
	--	,[ProductId]
	--	,[Quantity]
	--	,[Price]
	--	)
	--SELECT @OrderId
	--	,@ProductId
	--	,@Quantity
	--	,@Quantity * p.Price
	--FROM Products p
	--WHERE p.Id = @ProductId
	DECLARE @ProductPrice INT

	SELECT @ProductPrice = Price
	FROM Products
	WHERE Id = @ProductId

	INSERT INTO [dbo].[OrderDetails] (
		[OrderId]
		,[ProductId]
		,[Quantity]
		,[Price]
		)
	VALUES (
		@OrderId
		,@ProductId
		,@Quantity
		,@Quantity * @ProductPrice
		)

	UPDATE Orders
	SET TotalPrice = TotalPrice + (@Quantity * @ProductPrice)
	WHERE Id = @OrderId
	
	SELECT p.[Name],
		CONVERT(NVARCHAR, od.Quantity) + N'X' + CONVERT(NVARCHAR, p.Price) + N'=' + CONVERT(NVARCHAR, od.Quantity * p.Price)
	FROM OrderDetails od
	INNER JOIN Products p ON od.ProductId = p.Id
	WHERE od.OrderId = @OrderId

	SELECT OrderDate
		,TotalPrice
	FROM Orders
	WHERE Id = @OrderId
END
