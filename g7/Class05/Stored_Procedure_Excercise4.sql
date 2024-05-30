-- Excercise 4
-- Find a product by name\part of the name, product count, product price

--SELECT * 
--FROM dbo.Products
--GO

CREATE OR ALTER PROCEDURE uspFindProductByName
(
@product_name varchar(100),
@product_count INT OUTPUT,
@price_out decimal OUTPUT
)
AS
BEGIN

SELECT Name, Code, Price
FROM dbo.Products
WHERE Name LIKE '%'+ @product_name + '%'

-- @@ROWCOUNT return the number of rows affected by the last statement
SELECT @product_count = @@ROWCOUNT;

SET @price_out = 
( 
SELECT price 
FROM Products
--WHERE Name = @product_name -- => this will return null for price if the exact product name is not matched
WHERE Name LIKE '%' + @product_name + '%' -- => this will return the price even if the name isnt exact
)
END
GO

DECLARE @count INT;
DECLARE @price DECIMAL;

EXEC uspFindProductByName 'Soy milk', @count OUTPUT, @price OUTPUT 
SELECT @count as 'Number of products found'
SELECT @price as price
GO

SELECT * FROM dbo.Products

