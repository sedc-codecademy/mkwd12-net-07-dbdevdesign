--WORKSHOP 1
--Create new procedure called CreateOrder
--REQUIREMENTS
--1st Procedure should create only Order header info (not Order details) 
--2nd Procedure should return the total number of orders in the system for 
--the Customer from the new order (regardless the BusinessEntity)
--3rd Procedure should return second resultset with the total 
--amount of all orders for the customer and business entity on input
--4th Insert few orders in the system

--SELECT * FROM dbo.Orders

CREATE OR ALTER PROCEDURE dbo.CreateOrder 
(
@OrderDate date, @BusinessEnitityID int, @CustomerId int, @EmployeeId int
)
AS 
BEGIN INSERT INTO dbo.Orders(OrderDate, BusinessentityId, CustomerId, EmployeeId)
VALUES (@OrderDate, @BusinessEnitityID, @CustomerId, @EmployeeId)

SELECT COUNT(*) as TotalOrdersForCustomer
FROM dbo.Orders
WHERE CustomerId = @CustomerId

SELECT SUM(TotalPrice) as TotalOrderPrice
FROM dbo.Orders
WHERE CustomerId = @CustomerId
AND BusinessEntityId = @BusinessEnitityID

END
GO

EXEC dbo.CreateOrder
@OrderDate = '2020-08-19',
@BusinessEnitityID = 6,
@CustomerId = 98,
@EmployeeId = 5

SELECT TOP(10) *
FROM dbo.Orders
ORDER BY ID DESC
GO

SELECT * FROM dbo.BusinessEntities
