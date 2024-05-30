SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		G6
-- Create date: 30.05.2024
-- Description:	Create new procedure called CreateOrder;
--Procedure should create only Order header info (not Order details); 
--Procedure should return the total number of orders in the system for the Customer from the new order (regardless the BusinessEntity);
--Procedure should return second resultset with the total amount of all orders for the customer and business entity on input;

-- =============================================
ALTER PROCEDURE CreateOrder
	@OrderDate Datetime,
	@Status SMALLINT,
	@BusinessEntityId INT,
	@CustomerId INT,
	@EmployeeId INT,
	@TotalPrice DECIMAL(18, 2),
	@Comment NVARCHAR(MAX) NULL
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

   --add new order
   INSERT INTO Orders
   VALUES (@OrderDate, @Status, @BusinessEntityId, @CustomerId, @EmployeeId, @TotalPrice, @Comment)

   --Procedure should return the total number of orders in the system for the Customer from the new order
   SELECT COUNT(*) AS TotalOrdersForCustomer
   FROM Orders
   WHERE CustomerId = @CustomerId

   --Procedure should return second resultset with the total amount of all orders for the customer and business entity on input;
   SELECT SUM(TotalPrice) AS TotalOrderPrice
   FROM Orders
   WHERE CustomerId = @CustomerId AND @BusinessEntityId = BusinessEntityId
END
GO

EXEC CreateOrder
@OrderDate = '2019-04-30 00:00:00.000',
@Status = 0,
@BusinessEntityId = 8,
@CustomerId = 1,
@EmployeeId = 5,
@TotalPrice = 300,
@Comment = 'New order3'
