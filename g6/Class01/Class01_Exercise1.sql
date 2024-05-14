USE SEDC

CREATE TABLE BusinessEntities(
Id int NOT NULL,
[Name] nvarchar(100) NULL,
Region nvarchar(1000), 
Zipcode nvarchar(10),
Size nvarchar(10)
)

CREATE TABLE Employees(
Id int NOT NULL,
FirstName nvarchar(100) NOT NULL,
LastName nvarchar(100) NOT NULL,
DateOfBirth date,
Gender nchar(1),
HireDate date,
NationalNumber nvarchar(20)
)

CREATE TABLE Products(
Id int NOT NULL,
Code nvarchar(50),
[Name] nvarchar(100),
[Description] nvarchar(MAX),
[Weight] decimal(18,2),
Price decimal(18,2),
Cost decimal(18,2)
)

CREATE TABLE Customers(
Id int NOT NULL,
[Name] nvarchar(100) NOT NULL,
AccountNumber nvarchar(50),
City nvarchar(100),
RegionNumber nvarchar(100),
CustomerSize nvarchar(10),
PhoneNumber nvarchar(20),
IsActive bit NOT NULL
)

CREATE TABLE Orders(
Id bigint NOT NULL,
OrderDate datetime,
[Status] smallint,
BusinessEntityId int, --the business entity that takes the order
CustomerId int, --the customer that makes the order
EmployeeId int, --the employee that takes the order
TotalPrice decimal(18,2),
Comment nvarchar(MAX)
)

CREATE TABLE OrderDetails(
Id bigint NOT NULL,
OrderId bigint, --orderId must be bigint because the id of the Orders table is bigint
ProductId int, --productId must be int because the id of the Products table is int
Quantity int,
Price decimal(18,2)
)