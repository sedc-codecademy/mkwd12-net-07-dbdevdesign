--use SEDC
----------- DEMO IN ACTION -----------


CREATE OR ALTER PROCEDURE dbo.CreateOrderDetail (@OrderId int, @ProductId int, @QuantityId int)
AS
BEGIN

DECLARE @Price decimal(18,9)
DECLARE @TotalPrice decimal(18,9)

-- get the product price
SELECT @Price = Price
FROM dbo.Products
WHERE id = @ProductId

BEGIN TRY
INSERT INTO dbo.OrderDetails([OrderId], [ProductId], [Quantity], [Price])
VALUES (@OrderId, @ProductID, @QuantityId, @Price)
END TRY
BEGIN CATCH
SELECT
ERROR_NUMBER() AS ErrorNumber,
ERROR_SEVERITY() AS ErrorSeverity,
ERROR_STATE() AS ErrorState,
ERROR_PROCEDURE() AS ErrorProcedure,
ERROR_LINE() AS ErrorLine,
ERROR_MESSAGE() AS ErrorMessage;
END CATCH;

--calculating the total price =>
SET @TotalPrice = 
(
SELECT SuM(Quantity * Price)
FROM dbo.OrderDetails o
WHERE o.OrderId = @OrderId
)

-- Correcting/updating the total price
UPDATE o SET TotalPrice = @TotalPrice
FROM Orders o
WHERE id = @OrderId

SELECT p.Name, SUM(o.Quantity) AS TotalQuantity, SUM(o.Quantity * o.Price) AS TotalPricePerProduct
FROM dbo.OrderDetails o
INNER JOIN dbo.Products p on p.id = o.ProductId
WHERE o.OrderId = @OrderId
GROUP BY p.Name

END 
GO

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

EXEC dbo.CreateOrderDetail @OrderId = 23, @ProductId = 1242342, @QuantityId = 5
GO

BEGIN TRY
EXECUTE dbo.CreateOrderDetail @OrderId = 433, @ProductId = 4363453, @QuantityId = 5
END TRY
BEGIN CATCH
EXECUTE usp_GetErrorInfo;
END CATCH 
GO