CREATE PROCEDURE dbo.sp_CreateCustomer (
	@Name NVARCHAR(100)
	,@AccountNumber NVARCHAR(100)
	,@City NVARCHAR(100)
	,@RegionName NVARCHAR(100)
	,@CustomerSize NVARCHAR(10)
	,@PhoneNumbe NVARCHAR(20)
	,@IsActive BIT
	)
AS
BEGIN
	INSERT INTO Customers (
		[Name]
		,AccountNumber
		,City
		,RegionName
		,CustomerSize
		,PhoneNumber
		,IsActive
		)
	VALUES (
		@Name
		,@AccountNumber
		,@City
		,@RegionName
		,@CustomerSize
		,@PhoneNumbe
		,@IsActive
		)

	SELECT Count(*) AS TotalNumberOfCustomersStartingWithSameLetter
	FROM Customers
	WHERE LEFT([Name], 1) = LEFT(@Name, 1)

	SELECT *
	FROM Customers
	WHERE RegionName = @RegionName
END
