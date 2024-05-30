CREATE DATABASE PizzaStore

USE PizzaStore
GO

CREATE TABLE Users(
Id INT IDENTITY(1,1) NOT NULL PRIMARY KEY,
Firstname NVARCHAR(100) NOT NULL,
Lastname NVARCHAR(100) NOT NULL,
[Address] NVARCHAR(250) NOT NULL,
Phone NVARCHAR(50) NOT NULL
)

CREATE TABLE Orders(
Id INT Identity(1,1) NOT NULL PRIMARY KEY,
UserId INT NOT NULL, --one to many relationship between user and order
IsDelivered BIT NOT NULL,
Price DECIMAL(4,2) NOT NULL,
CONSTRAINT FK_Orders_Users FOREIGN KEY (UserId)
REFERENCES Users(Id)
)

CREATE TABLE Toppings(
Id INT Identity(1,1) NOT NULL PRIMARY KEY,
[Name] NVARCHAR(200) NOT NULL,
Price DECIMAL (4,2) NOT NULL
)

CREATE TABLE PizzaSizes(
Id INT Identity(1,1) NOT NULL PRIMARY KEY,
[Name] NVARCHAR(200) NOT NULL
)

CREATE TABLE Pizzas(
Id INT Identity(1,1) NOT NULL PRIMARY KEY,
[Name] NVARCHAR(200) NOT NULL,
Price DECIMAL (4,2) NOT NULL,
SizeId INT NOT NULL, --one to many relationship between size and pizza
OrderId INT NOT NULL,--one to many relationship between order and pizza
CONSTRAINT FK_Pizzas_PizzaSizes FOREIGN KEY(SizeId)
REFERENCES PizzaSizes (Id),
CONSTRAINT FK_Pizzas_Orders FOREIGN KEY(OrderId)
REFERENCES Orders (Id)
)

--many to many relationship between pizza and toppings
--we need a new table to represent this relationship
CREATE TABLE PizzaToppings(
Id INT Identity(1,1) NOT NULL PRIMARY KEY,
PizzaId INT NOT NULL,
ToppingId INT NOT NULL,
CONSTRAINT FK_PizzaToppings_Pizzas FOREIGN KEY(PizzaId)
REFERENCES Pizzas(Id),
CONSTRAINT FK_PizzaToppings_Toppings FOREIGN KEY(ToppingId)
REFERENCES Toppings (Id)
)