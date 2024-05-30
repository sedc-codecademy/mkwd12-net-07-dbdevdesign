-- 1st Req => ﻿/* Create the database */

CREATE DATABASE PizzaDB1
GO

USE PizzaDB
GO

-- 2nd Req /* Table Creation */

USE PizzaDB1
GO

CREATE TABLE Toppings(
	Id int NOT NULL PRIMARY KEY CLUSTERED,
	Name nvarchar(255) NOT NULL,
	Price decimal(4, 2) NOT NULL 
)
GO

CREATE TABLE PizzaSizes(
	Id int NOT NULL PRIMARY KEY CLUSTERED,
	Name nvarchar(255) NOT NULL
)
GO

CREATE TABLE Orders(
	Id int NOT NULL PRIMARY KEY CLUSTERED,
	Price decimal(4, 2) NOT NULL,
	IsDelivered bit NOT NULL DEFAULT 0,
	UserId int NOT NULL
)
GO

CREATE TABLE Pizzas(
	Id int NOT NULL PRIMARY KEY CLUSTERED,
	Name nvarchar(255) NOT NULL,
	Price decimal(4, 2) NOT NULL,
	SizeId int NOT NULL,
	OrderId int NOT NULL,	
)
GO

CREATE TABLE PizzaToppings(
	Id int NOT NULL PRIMARY KEY CLUSTERED,
	PizzaId int NOT NULL,
	ToppingId int NOT NULL
) 
GO

CREATE TABLE Users(
	Id int NOT NULL PRIMARY KEY CLUSTERED,
	FirstName nvarchar(255) NOT NULL,
	LastName nvarchar(255) NOT NULL,
	Address nvarchar(255) NOT NULL,
	Phone nvarchar(255) NOT NULL
)
GO

-- 3rd Req /* Creating of the table relationships*/

USE PizzaDB1
GO

ALTER TABLE Orders ADD CONSTRAINT FK_Orders_Users FOREIGN KEY(UserId)
REFERENCES dbo.Users(Id)
GO

ALTER TABLE Pizzas ADD CONSTRAINT FK_Pizzas_PizzaSizes FOREIGN KEY(SizeId)
REFERENCES PizzaSizes(Id)
GO

ALTER TABLE Pizzas ADD CONSTRAINT FK_Pizzas_Orders FOREIGN KEY(OrderId)
REFERENCES Orders(Id)
GO

ALTER TABLE PizzaToppings ADD CONSTRAINT FK_PizzaToppings_Pizzas FOREIGN KEY(PizzaId)
REFERENCES Pizzas(Id)
GO

ALTER TABLE PizzaToppings ADD  CONSTRAINT FK_PizzaToppings_Toppings FOREIGN KEY(ToppingId)
REFERENCES Toppings(Id)
GO