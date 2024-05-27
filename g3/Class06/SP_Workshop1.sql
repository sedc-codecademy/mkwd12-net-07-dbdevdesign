CREATE PROCEDURE dbo.sp_CreateOrder (
	@BusinessEntityId INT
	,@CustomerId INT
	,@EmployeeId INT
	,@Comment NVARCHAR(MAX)
	)
AS
BEGIN
	INSERT INTO [dbo].[Orders] (
		[OrderDate]
		,[Status]
		,[BusinessEntityId]
		,[CustomerId]
		,[EmployeeId]
		,[TotalPrice]
		,[Comment]
		)
	VALUES (
		GETDATE()
		,0
		,@BusinessEntityId
		,@CustomerId
		,@EmployeeId
		,0
		,@Comment
		)

	SELECT Count(*) CustomerTotalOrders
	FROM Orders
	WHERE CustomerId = @CustomerId

	SELECT SUM(o.TotalPrice) AS TotalPrice
	FROM Orders o
	WHERE o.CustomerId = @CustomerId
		AND o.BusinessEntityId = @BusinessEntityId
END
