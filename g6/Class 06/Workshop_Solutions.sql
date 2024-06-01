use PizzaStore
go

/* There should be a function that concatenates First and Last Name of a user​ */

select * from Users

select u.*, dbo.GetFullName(FirstName, LastName) as FullName from Users u

select dbo.GetFullName('Bob', 'Bobski') as FullName
select 'Bob ' + 'Bobski' as FullName

CREATE FUNCTION GetFullName(
	@firstName nvarchar(200),
	@lastName nvarchar(200)
)
returns nvarchar(401)
as
begin
	--return @firstName + N' ' + @lastName
	return CONCAT(@firstName, N' ', @lastName)
end
go



/* There should be a view to show all pizzas that are not delivered yet and the full names of the users waiting for them​ */

CREATE VIEW UndeliveredPizzas AS
select p.Name,
	p.SizeId,
	o.Id,
	dbo.GetFullName(u.Firstname, u.Lastname) as [User]
from Pizzas p
inner join Orders o on o.Id = p.OrderId
inner join Users u on u.Id = o.UserId
where o.IsDelivered = 0
go

select * from UndeliveredPizzas
go


/* There should be a stored procedure that when provided an OrderId, can return the full price of a whole order ( Delivery + All Pizza + All Toppings )​ */

create procedure GetFullPriceForOrder @OrderId int
as
begin
	declare @pizzasPrice decimal(4, 2)
	declare @toppingsPrice decimal(4, 2)
	declare @orderPrice decimal(4, 2)

	select @pizzasPrice = SUM(p.Price), @toppingsPrice = SUM(t.Price) from Orders o
	inner join Pizzas p on p.OrderId = o.Id
	inner join PizzaToppings pt on p.Id = pt.PizzaId
	inner join Toppings t on pt.ToppingId = t.Id
	where o.Id = @OrderId

	select @orderPrice = o.Price from Orders o
	where o.Id = @OrderId

	select @OrderId as [Order Id],
		@pizzasPrice as [Pizzas Price], 
		@toppingsPrice as [Topping Price], 
		@orderPrice as [Delivery Price],
		SUM(@pizzasPrice + @toppingsPrice + @orderPrice) as FullPrice
end
go

exec dbo.GetFullPriceForOrder @OrderId = 3
go

/* There should be a view that lists pizzas by the number of times ordered, starting from the most popular one ( Most times ordered )​ */
--There should be a view that lists pizzas by the number of times ordered (Call this view ordered by the most popular pizza on top)

select * from Orders
select * from Pizzas

create view PizzaPopularity 
as
select p.[Name], count(p.[Name]) NoTimesOrdered from Pizzas p
group by p.[Name]
go

--SELECT p.Name, 
--	COUNT(p.Name) AS [Number of times ordered] 
--FROM Orders AS o
--INNER JOIN Pizzas AS p ON o.Id = p.OrderId
--INNER JOIN PizzaToppings AS pt ON p.Id = pt.PizzaId
--GROUP BY p.Name

--select * from Orders o
--inner join Pizzas p on o.Id = p.OrderId
--inner join PizzaToppings pt on p.Id = pt.PizzaId

select * from dbo.PizzaPopularity
order by NoTimesOrdered desc
go

--There should be a view that lists toppings by the number of times ordered (Call this view ordered by the most popular topping on top)
/* There should be a view that lists toppings by the number of times ordered, starting from the most popular one ( Most times ordered )​ */

select * from Pizzas
select * from PizzaToppings
select * from Toppings

create view ToppingPopularity
as
select t.[Name], count(t.[Name]) as NoTimesOrdered from Orders o
inner join Pizzas p on o.Id = p.OrderId
inner join PizzaToppings pt on pt.PizzaId = p.Id
inner join Toppings t on pt.ToppingId = t.Id
group by t.[Name]
go

select * from dbo.ToppingPopularity
order by NoTimesOrdered desc
go



/* There should be a view with users and the amount of pizzas they ordered​ (FullName, OrderedPizzas)*/
-- bob bobski, 15

select * from Users
select * from Orders
select * from Pizzas

create view CountOfPizzasOrderedByUser
as
select dbo.GetFullName(u.Firstname, u.Lastname) as UserFullName,
	count(p.Id) as PizzasOrdered	
from Users u
inner join Orders o on o.UserId = u.Id
inner join Pizzas p on p.OrderId = o.Id
group by dbo.GetFullName(u.Firstname, u.Lastname)
go

select * from dbo.CountOfPizzasOrderedByUser
order by PizzasOrdered desc
go