CREATE OR ALTER PROCEDURE dbo.usp_CreateOrderDetail
	@OrderId INT,
	@ProductId INT,
	@QuantityId INT
AS
BEGIN
	DECLARE @Price DECIMAL(18, 9)
	DECLARE @TotalPrice DECIMAL(18,9)

	IF NOT EXISTS (SELECT 1 FROM [dbo].[Product] WHERE id = @ProductId)
	BEGIN
		SELECT 'ERROR' AS Status, 'Product does not exist' AS ErrorMessage
		RETURN
	END

	SELECT @Price = [Price]
	FROM [dbo].[Product]
	WHERE [Id] = @ProductId

	BEGIN TRY
		INSERT INTO [dbo].[OrderDetails]([OrderId], [ProductId], [Quantity], [Price])
		VALUES (@OrderId, @ProductId, @QuantityId, @Price)
	END TRY
	BEGIN CATCH
		SELECT 
			ERROR_NUMBER() AS ErrorNumeber,
			ERROR_SEVERITY() AS ErrorSeverity,
			ERROR_STATE() AS ErrorState,
			ERROR_PROCEDURE() AS ErrorProcedure,
			ERROR_LINE() AS ErrorLine,
			ERROR_MESSAGE() AS ErrorMessage
		RETURN
	END CATCH

	SET @TotalPrice = 
	(
		SELECT SUM(Quantity * Price)
		FROM [dbo].[OrderDetails]
		WHERE OrderId = @OrderId
	)

	UPDATE o
	SET o.[TotalPrice] = @TotalPrice
	FROM [dbo].[Order] o
	WHERE o.Id = @OrderId

	SELECT p.Name, SUM(od.Quantity) AS TotalQuantity, SUM(od.Quantity * od.Price) AS TotalPricePerProduct
	FROM [dbo].[OrderDetails] od
	INNER JOIN [dbo].[Product] p ON p.Id = od.ProductId
	GROUP BY p.Name
END
GO

EXEC [dbo].[CreateOrderDetail] @OrderId = 46, @ProductId = 16161, @QuantityId = 5;