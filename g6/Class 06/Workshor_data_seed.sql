/* Data Inserts */

/* ------------------------------------------------------------------------ */

USE PizzaStore
GO

INSERT INTO Users(FirstName, LastName, Address, Phone)
VALUES('Bob', 'Bobsky', 'Bob Street 22', '070111222')

INSERT INTO Users(FirstName, LastName, Address, Phone)
VALUES('Jill', 'Wayne', 'Jill Street 22', '070222333')

INSERT INTO Users(FirstName, LastName, Address, Phone)
VALUES('Greg', 'Gregsky', 'Greg Street 22', '070333444')

GO

/* ------------------------------------------------------------------------ */

USE PizzaStore
GO

INSERT INTO PizzaSizes(Name)
VALUES('Small')

INSERT INTO PizzaSizes(Name)
VALUES('Medium')

INSERT INTO PizzaSizes(Name)
VALUES('Large')

INSERT INTO PizzaSizes(Name)
VALUES('Family')

GO

/* ------------------------------------------------------------------------ */

INSERT INTO Orders(Price, IsDelivered, UserId)
VALUES(0.5, 1, 1)

INSERT INTO Orders(Price, IsDelivered, UserId)
VALUES(0.5, 1, 1)

INSERT INTO Orders(Price, IsDelivered, UserId)
VALUES(0.6, 0, 1)

INSERT INTO Orders(Price, IsDelivered, UserId)
VALUES(0.3, 0, 2)

INSERT INTO Orders(Price, IsDelivered, UserId)
VALUES(0.5, 1, 3)

/* ------------------------------------------------------------------------ */

USE PizzaStore
GO

/* Order 1 */
INSERT INTO Pizzas(Name, SizeId, Price, OrderId)
VALUES('Capricciosa', 1, 2, 1)

INSERT INTO Pizzas(Name, SizeId, Price, OrderId)
VALUES('Pepperoni', 3, 3.7, 1)

/* Order 2 */

INSERT INTO Pizzas(Name, SizeId, Price, OrderId)
VALUES('Margarita', 1, 1.6, 2)

INSERT INTO Pizzas(Name, SizeId, Price, OrderId)
VALUES('Seafood', 2, 2.9, 2)

INSERT INTO Pizzas(Name, SizeId, Price, OrderId)
VALUES('Hawaiian', 2, 2.7, 2)

/* Order 3 */

INSERT INTO Pizzas(Name, SizeId, Price, OrderId)
VALUES('Capricciosa', 2, 2.5, 3)

INSERT INTO Pizzas(Name, SizeId, Price, OrderId)
VALUES('Pepperoni', 4, 4.8, 3)

INSERT INTO Pizzas(Name, SizeId, Price, OrderId)
VALUES('Capricciosa', 3, 3.2, 3)

INSERT INTO Pizzas(Name, SizeId, Price, OrderId)
VALUES('Hawaiian', 4, 5.2, 3)

/* Order 4 */

INSERT INTO Pizzas(Id, Name, SizeId, Price, OrderId)
VALUES(10, 'Capricciosa', 3, 3, 4)

/* Order 5 */

INSERT INTO Pizzas(Name, SizeId, Price, OrderId)
VALUES('Margarita', 4, 4, 5)

INSERT INTO Pizzas(Name, SizeId, Price, OrderId)
VALUES('Seafood', 3, 4.5, 5)

INSERT INTO Pizzas(Name, SizeId, Price, OrderId)
VALUES('Pepperoni', 3, 4.2, 5)

INSERT INTO Pizzas(Name, SizeId, Price, OrderId)
VALUES('Capricciosa', 4, 3.7, 5)

GO

/* ------------------------------------------------------------------------ */

INSERT INTO Toppings(Name, Price)
VALUES('Cheese', 0.4)

INSERT INTO Toppings(Name, Price)
VALUES('Mushrooms', 0.8)

INSERT INTO Toppings(Name, Price)
VALUES('Bacon', 1)

INSERT INTO Toppings(Name, Price)
VALUES('Onions', 0.2)

INSERT INTO Toppings(Name, Price)
VALUES('Garlic', 0.3)

/* ------------------------------------------------------------------------ */

USE PizzaStore
GO

INSERT INTO PizzaToppings(PizzaId, ToppingId)
VALUES(1, 1)

INSERT INTO PizzaToppings(PizzaId, ToppingId)
VALUES(1, 3)

INSERT INTO PizzaToppings(PizzaId, ToppingId)
VALUES(2, 1)

INSERT INTO PizzaToppings(PizzaId, ToppingId)
VALUES(4, 3)

INSERT INTO PizzaToppings(PizzaId, ToppingId)
VALUES(4, 5)

INSERT INTO PizzaToppings(PizzaId, ToppingId)
VALUES(6, 1)

INSERT INTO PizzaToppings(PizzaId, ToppingId)
VALUES(7, 1)

INSERT INTO PizzaToppings(PizzaId, ToppingId)
VALUES(9, 2)

INSERT INTO PizzaToppings(PizzaId, ToppingId)
VALUES(10, 4)

INSERT INTO PizzaToppings(PizzaId, ToppingId)
VALUES(11, 1)

INSERT INTO PizzaToppings(PizzaId, ToppingId)
VALUES(11, 5)

INSERT INTO PizzaToppings(PizzaId, ToppingId)
VALUES(12, 4)

INSERT INTO PizzaToppings(PizzaId, ToppingId)
VALUES(14, 1)

INSERT INTO PizzaToppings(PizzaId, ToppingId)
VALUES(14, 2)

/* ------------------------------------------------------------------------ */