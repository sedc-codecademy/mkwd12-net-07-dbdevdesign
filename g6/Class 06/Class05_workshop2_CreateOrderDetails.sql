SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		G6
-- Create date: 30.05.2024
-- Description:	Create new procedure called CreateOrderDetail;
--Procedure should take the single price for item from Product table (Price column);
--Procedure should add details for specific order (new record for new Product/Quantity for specific order);
--When the order detail is inserted, procedure should correct the TotalPrice column in the main table (dbo.order);
--Output from this procedure should be resultset with order details in a form of pairs: ProductName and TotalPrice per product (Price*Quantity);
--Insert few order details for some orders;

-- =============================================
CREATE PROCEDURE CreateOrderDetails
    @OrderId BIGINT,
	@ProductId INT,
	@Quantity INT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	 DECLARE @Price DECIMAL(18,2), @TotalPrice DECIMAL (18,2)

	 --get  the product price
     SELECT @Price = Price
	 FROM Products
	 WHERE Id = @ProductId

	 --insert order details
	 --Procedure should add details for specific order (new record for new Product/Quantity for specific order);
	 INSERT INTO OrderDetails
	 VALUES (@OrderId, @ProductId, @Quantity, @Price)

	 --When the order detail is inserted, procedure should correct the TotalPrice column in the main table (dbo.order);
	 --calculate the price
	 SELECT @TotalPrice = SUM(Quantity * Price)
	 FROM OrderDetails
	 WHERE OrderId = @OrderId

	 --correct the total price
	 UPDATE Orders
	 SET TotalPrice = @TotalPrice
	 WHERE Id = @OrderId

	 --Output from this procedure should be resultset with order details in a form of pairs: ProductName and TotalPrice per product (Price*Quantity);
	 SELECT P.[Name] AS ProductName, SUM(OD.Quantity * OD.Price) AS TotalPricePerProduct
	 FROM OrderDetails OD
		INNER JOIN Products P
			ON P.Id = OD.ProductId
	WHERE OD.OrderId = @OrderId
	GROUP BY P.[Name]
END
GO

EXEC CreateOrderDetails @OrderId = 2103, @ProductId = 44, @Quantity = 5
EXEC CreateOrderDetails @OrderId = 2104, @ProductId = 45, @Quantity = 3