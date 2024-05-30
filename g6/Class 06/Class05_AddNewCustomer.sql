SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:		G6
-- Create date: 30.05.2024
-- Description:	Create procedure for adding new customer
				--As output from the procedure return the following data:
				--Total number of customers starting with the same character as the new customer;
				--Additionally in second resultset return how many customers already exist in the new customer region.
-- =============================================
CREATE PROCEDURE AddNewCustomer
	@Name NVARCHAR (100),
	@AccountNumber NVARCHAR(50),
	@City NVARCHAR(100),
	@Region NVARCHAR(100),
	@IsActive BIT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--adding new customer
    INSERT INTO Customers([Name], AccountNumber, City, RegionNumber, IsActive)
	VALUES (@Name, @AccountNumber, @City, @Region, @IsActive)

	--Total number of customers starting with the same character as the new customer;
	SELECT COUNT(*) TotalCustomersWithEqualFirstLetter
	FROM Customers
	WHERE LEFT([Name], 1) = SUBSTRING(@Name, 1, 1) --you can use both substring or left in both cases

	--Additionally in second resultset return how many customers already exist in the new customer region.
	SELECT COUNT(*) AS CustomersInRegion
	FROM Customers
	WHERE RegionNumber = @Region
END
GO

EXEC AddNewCustomer
@Name = 'Viva',
@AccountNumber = '123',
@City = 'Skopje',
@Region = 'Skopski',
@IsActive = 1

SELECT * 
FROM Customers
WHERE LEFT([Name], 1) = 'V'

SELECT * 
FROM Customers
WHERE RegionNumber = 'Skopski'