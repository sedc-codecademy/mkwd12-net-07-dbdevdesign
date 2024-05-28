-- STORED PROCEDURES --
--Excercise1

--Create procedure for adding new customer
--As output from the procedure return the following data:
--Total number of customers starting with the same character as the new customer
--Additionally in second resultset return how many customers 
--already exist in the new customer region

--HOW THIS LOOKS LIKE IN JS function named dbo.NewCustomer(@Name nvarchar(100), @AccountNumber nvarchar(50), @City nvarchar(100), @RegionName nvarchar(100), @isActive bit)

CREATE OR ALTER PROCEDURE dbo.NewCustomer
(
@Name nvarchar(100), @AccountNumber nvarchar(50), @City nvarchar(100), @RegionName nvarchar(100), @isActive bit
)
AS
BEGIN
INSERT INTO dbo.Customers ([Name], [AccountNumber], [City], [RegionName], [IsActive])
VALUES (@Name, @AccountNumber, @City, @RegionName, @isActive)

SELECT COUNT(*) as TotalCustomersFirstLetter
FROM dbo.Customers
WHERE SUBSTRING(Name,1,1) = SUBSTRING(@Name,1,1)

SELECT COUNT(*) as CustomersInRegion
FROM dbo.Customers
WHERE RegionName = @RegionName
END
GO

SELECT * FROM dbo.Customers

-- IN JS HOW WE CALL A FUNCTION
-- dbo.NewCustomer('Vero Bitola 2', '1234321', 'Bitola', 'Bitolski', 1)

EXEC dbo.NewCustomer
	@Name = 'Vero Bitola 2',
	@AccountNumber = '1234321',
	@City = 'Bitola',
	@RegionName = 'Bitolski',
	@IsActive = 1

EXEC dbo.NewCustomer 
	@Name = 'Viva',
	@AccountNumber = '123',
	@City  = 'Skopje',
	@RegionName ='Skopski',
	@isActive = 1





