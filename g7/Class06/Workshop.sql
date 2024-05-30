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

-- 4th Req /* Insert some data in the tables */

USE PizzaDB1
GO

INSERT INTO Users(Id, FirstName, LastName, Address, Phone)
VALUES(1, 'Bob', 'Bobsky', 'Bob Street 22', '070111222')

INSERT INTO Users(Id, FirstName, LastName, Address, Phone)
VALUES(2, 'Jill', 'Wayne', 'Jill Street 22', '070222333')

INSERT INTO Users(Id, FirstName, LastName, Address, Phone)
VALUES(3, 'Greg', 'Gregsky', 'Greg Street 22', '070333444')

GO

/* ------------------------------------------------------------------------ */

USE PizzaDB
GO

INSERT INTO PizzaSizes(Id, Name)
VALUES(1, 'Small')

INSERT INTO PizzaSizes(Id, Name)
VALUES(2, 'Medium')

INSERT INTO PizzaSizes(Id, Name)
VALUES(3, 'Large')

INSERT INTO PizzaSizes(Id, Name)
VALUES(4, 'Family')

GO

/* ------------------------------------------------------------------------ */

INSERT INTO Orders(Id, Price, IsDelivered, UserId)
VALUES(1, 0.5, 1, 1)

INSERT INTO Orders(Id, Price, IsDelivered, UserId)
VALUES(2, 0.5, 1, 1)

INSERT INTO Orders(Id, Price, IsDelivered, UserId)
VALUES(3, 0.6, 0, 1)

INSERT INTO Orders(Id, Price, IsDelivered, UserId)
VALUES(4, 0.3, 0, 2)

INSERT INTO Orders(Id, Price, IsDelivered, UserId)
VALUES(5, 0.5, 1, 3)

/* ------------------------------------------------------------------------ */

USE PizzaDB
GO

/* Order 1 */
INSERT INTO Pizzas(Id, Name, SizeId, Price, OrderId)
VALUES(1, 'Capricciosa', 1, 2, 1)

INSERT INTO Pizzas(Id, Name, SizeId, Price, OrderId)
VALUES(2, 'Pepperoni', 3, 3.7, 1)

/* Order 2 */

INSERT INTO Pizzas(Id, Name, SizeId, Price, OrderId)
VALUES(3, 'Margarita', 1, 1.6, 2)

INSERT INTO Pizzas(Id, Name, SizeId, Price, OrderId)
VALUES(4, 'Seafood', 2, 2.9, 2)

INSERT INTO Pizzas(Id, Name, SizeId, Price, OrderId)
VALUES(5, 'Hawaiian', 2, 2.7, 2)

/* Order 3 */

INSERT INTO Pizzas(Id, Name, SizeId, Price, OrderId)
VALUES(6, 'Capricciosa', 2, 2.5, 3)

INSERT INTO Pizzas(Id, Name, SizeId, Price, OrderId)
VALUES(7, 'Pepperoni', 4, 4.8, 3)

INSERT INTO Pizzas(Id, Name, SizeId, Price, OrderId)
VALUES(8, 'Capricciosa', 3, 3.2, 3)

INSERT INTO Pizzas(Id, Name, SizeId, Price, OrderId)
VALUES(9, 'Hawaiian', 4, 5.2, 3)

/* Order 4 */

INSERT INTO Pizzas(Id, Name, SizeId, Price, OrderId)
VALUES(10, 'Capricciosa', 3, 3, 4)

/* Order 5 */

INSERT INTO Pizzas(Id, Name, SizeId, Price, OrderId)
VALUES(11, 'Margarita', 4, 4, 5)

INSERT INTO Pizzas(Id, Name, SizeId, Price, OrderId)
VALUES(12, 'Seafood', 3, 4.5, 5)

INSERT INTO Pizzas(Id, Name, SizeId, Price, OrderId)
VALUES(13, 'Pepperoni', 3, 4.2, 5)

INSERT INTO Pizzas(Id, Name, SizeId, Price, OrderId)
VALUES(14, 'Capricciosa', 4, 3.7, 5)

GO

/* ------------------------------------------------------------------------ */

INSERT INTO Toppings(Id, Name, Price)
VALUES(1, 'Cheese', 0.4)

INSERT INTO Toppings(Id, Name, Price)
VALUES(2, 'Mushrooms', 0.8)

INSERT INTO Toppings(Id, Name, Price)
VALUES(3, 'Bacon', 1)

INSERT INTO Toppings(Id, Name, Price)
VALUES(4, 'Onions', 0.2)

INSERT INTO Toppings(Id, Name, Price)
VALUES(5, 'Garlic', 0.3)

/* ------------------------------------------------------------------------ */

USE PizzaDB
GO

INSERT INTO PizzaToppings(Id, PizzaId, ToppingId)
VALUES(1, 1, 1)

INSERT INTO PizzaToppings(Id, PizzaId, ToppingId)
VALUES(2, 1, 3)

INSERT INTO PizzaToppings(Id, PizzaId, ToppingId)
VALUES(3, 2, 1)

INSERT INTO PizzaToppings(Id, PizzaId, ToppingId)
VALUES(4, 4, 3)

INSERT INTO PizzaToppings(Id, PizzaId, ToppingId)
VALUES(5, 4, 5)

INSERT INTO PizzaToppings(Id, PizzaId, ToppingId)
VALUES(6, 6, 1)

INSERT INTO PizzaToppings(Id, PizzaId, ToppingId)
VALUES(7, 7, 1)

INSERT INTO PizzaToppings(Id, PizzaId, ToppingId)
VALUES(8, 9, 2)

INSERT INTO PizzaToppings(Id, PizzaId, ToppingId)
VALUES(9, 10, 4)

INSERT INTO PizzaToppings(Id, PizzaId, ToppingId)
VALUES(10, 11, 1)

INSERT INTO PizzaToppings(Id, PizzaId, ToppingId)
VALUES(11, 11, 5)

INSERT INTO PizzaToppings(Id, PizzaId, ToppingId)
VALUES(12, 12, 4)

INSERT INTO PizzaToppings(Id, PizzaId, ToppingId)
VALUES(13, 14, 1)

INSERT INTO PizzaToppings(Id, PizzaId, ToppingId)
VALUES(14, 14, 2)

/* Extra Requirements */
/* There should be a function that concatenates First and Last Name of a user​ */
