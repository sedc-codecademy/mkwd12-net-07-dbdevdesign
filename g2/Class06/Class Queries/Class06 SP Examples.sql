USE SEDC
GO

-- ====> Example: Get Employees by Gender
CREATE OR ALTER PROCEDURE usp_GetEmployeesByGender
(
	@Gender nchar(1) = 'M', -- default parameter
	@GenderCount int OUT
)
AS
BEGIN
	SELECT * FROM dbo.Employee e
	WHERE e.Gender = @Gender;

	SELECT @GenderCount = COUNT(*)
	FROM dbo.Employee e
	WHERE e.Gender = @Gender;
END
GO

DECLARE @MaleCount int, @FemaleCount int

EXEC dbo.usp_GetEmployeesByGender 
	@GenderCount = @MaleCount OUT

EXEC dbo.usp_GetEmployeesByGender
	@Gender = 'F',
	@GenderCount = @FemaleCount OUT

SELECT @MaleCount as MaleCount, @FemaleCount as FemaleCount



-- ====> Example: Get Product Details by Product Name
-- Also return the Product price and total quantity of that particular order
SELECT TOP(9) * FROM dbo.Product
SELECT * FROM dbo.Product
GO

CREATE OR ALTER PROCEDURE usp_FindProductDetailsByName
	@ProductName nvarchar(100),
	@TotalQuantityOrdered int OUTPUT,
	@ProductPrice decimal(18,2) OUTPUT
AS
BEGIN
	-- Select product details (name, description, price, qunatity ordered)
	SELECT 
		p.[Name],
		p.[Description],
		p.Price,
		SUM(od.Quantity) as TotalQuantity
	FROM dbo.Product p
	JOIN dbo.OrderDetails od ON p.Id = od.ProductId
	WHERE p.[Name] like '%' + @ProductName + '%'
	GROUP BY p.[Name], p.[Description], p.Price

	-- Set the output parameteres
	SELECT TOP(1) @ProductPrice = p.Price 
	FROM dbo.Product p
	WHERE p.[Name] like '%' + @ProductName + '%'

	SELECT @TotalQuantityOrdered = SUM(od.Quantity)
	FROM dbo.Product p
	JOIN dbo.OrderDetails od ON p.Id = od.ProductId
	WHERE p.[Name] like '%' + @ProductName + '%'
END
GO

DECLARE @QuantityOrdered int, @ProdPrice decimal(18,2)

EXEC usp_FindProductDetailsByName
	@ProductName = 'Crunchy',
	@TotalQuantityOrdered = @QuantityOrdered OUTPUT,
	@ProductPrice = @ProdPrice OUT

SELECT @QuantityOrdered as Quantity, @ProdPrice as Price
GO




