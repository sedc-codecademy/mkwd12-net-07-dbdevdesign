--first set of execution

USE [master]
GO

DROP DATABASE IF EXISTS [SEDC]
GO

CREATE DATABASE [SEDC]
GO

USE [SEDC]
GO

DROP TABLE IF EXISTS [dbo].[OrderDetails]
DROP TABLE IF EXISTS [dbo].[Orders]
DROP TABLE IF EXISTS [dbo].[BusinessEntities]
DROP TABLE IF EXISTS [dbo].[Customers]
DROP TABLE IF EXISTS [dbo].[Employees]
DROP TABLE IF EXISTS [dbo].[Products]
GO

-- you can skip PKs in this class and introduce them when learning about constraints

CREATE TABLE Customers (
	[Id] int IDENTITY(1,1) NOT NULL,
	[Name] nvarchar(100) NOT NULL,
	[AccountNumber] nvarchar(100) NULL,
	[City] nvarchar(100) NULL,
	[RegionName] nvarchar(100) NULL,
	[CustomerSize] nvarchar(10) NULL,
	[PhoneNumber] nvarchar(20) NULL,
	[IsActive] bit NOT NULL,
CONSTRAINT [PK_Customers] PRIMARY KEY (Id)
)

CREATE TABLE Employees (
	[Id] int IDENTITY(1,1) NOT NULL,
	[FirstName] nvarchar(100) NOT NULL,
	[LastName] nvarchar(100) NOT NULL,
	[DateOfBirth] date NULL, 
	[Gender] nchar(1) NULL, -- 'F' / 'M'
	[HireDate] date NULL,
	[NationalIdNumber] nvarchar(20) NULL
CONSTRAINT [PK_Employees] PRIMARY KEY (Id)
)

CREATE TABLE Products (
	[Id] int IDENTITY(1,1) NOT NULL,
	[Code] nvarchar(50) NULL,
	[Name] nvarchar(100) NULL,
	[Description] nvarchar(max) NULL,
	[Weight] decimal(18, 2) NULL,
	[Price] decimal(18,2) NULL,
	[Cost] decimal(18,2) NULL,
CONSTRAINT [PK_Products] PRIMARY KEY (Id)
)


CREATE TABLE Orders(
	[Id] bigint IDENTITY(1,1) NOT NULL,
	[OrderDate] date NULL,
	[Status] smallint NULL,
	[BusinessEntityId] int NULL,
	[CustomerId] int NULL,
	[EmployeeId] int NULL,
	[TotalPrice] decimal(18,2) NULL,
	[Comment] nvarchar(max) NULL
CONSTRAINT [PK_Orders] PRIMARY KEY (Id)
)

CREATE TABLE OrderDetails(
	[Id] int IDENTITY(1,1) NOT NULL,
	[OrderId] bigint NULL,
	[ProductId] int NULL,
	[Quantity] int NULL,
	[Price] decimal(18,2) NULL,
CONSTRAINT [PK_OrderDetails] PRIMARY KEY (Id)
)

CREATE TABLE BusinessEntities(
	[Id] int IDENTITY(1,1) NOT NULL,
	[Name] nvarchar(100) NULL,
	[Region] nvarchar(1000) NULL,
	[Zipcode] nvarchar(10) NULL,
	[Size] nvarchar(10) NULL,
CONSTRAINT [PK_BusinessEntities] PRIMARY KEY (Id)
)
GO

-- second set of execution

-- Business Entity
------------------

delete from dbo.OrderDetails where 1=1;
delete from dbo.[Orders] where 1=1;
delete from dbo.BusinessEntities where 1=1;
delete from dbo.Employees where 1=1;
delete from dbo.Products where 1=1;
delete from dbo.Customers where 1=1;
GO

insert into dbo.BusinessEntities (Name,Region,Zipcode,Size)
values ('Vitalia Skopje','Skopski','1000','Large')
GO

insert into dbo.BusinessEntities (Name,Region,Zipcode,Size)
values ('Vitalia Bitola','Bitolski','2000','Large')
GO

insert into dbo.BusinessEntities (Name,Region,Zipcode,Size)
values ('Vitalia Strumica','Strumicki','987','Medium')
GO

insert into dbo.BusinessEntities (Name,Region,Zipcode,Size)
values ('Vitalia Kumanovo','Kumanovski','500','Medium')
GO

insert into dbo.BusinessEntities (Name,Region,Zipcode,Size)
values ('Vitalia Tetovo','Polog','700','Small')
GO

insert into dbo.BusinessEntities (Name,Region,Zipcode,Size)
values ('Vitalia Stip','Stipski','300','Small')
GO

insert into dbo.BusinessEntities (Name,Region,Zipcode,Size)
values ('Vitalia Ohrid','Ohridski','100','Small')
GO


-- Employee table

declare @FirstName table (FirstName nvarchar(50))
insert into @FirstName values ('Aleksandar'),('Ana'),('Borce'),('Biljana'),('Viktor'),('Valentina'),('Goran'),('Gordana'),('Maja'),('Marko')

declare @LastName table (LastName nvarchar(50))
insert into @LastName values ('Stojanovski'),('Nikolovski'),('Zdravevski'),('Ivanovski'),('Popovski'),('Mitrevski'),('Stoilov'),('Pandev'),('Todorov'),('Trajanov')

insert into dbo.Employees(FirstName,LastName,DateOfBirth,Gender,HireDate,NationalIdNumber)
select f.FirstName, l.LastName,'1980.01.01' as date, case when FirstName in ('Ana','Biljana','Valentina','Gordana','Maja') then 'F' else 'M' end as Gender,'2015.01.01' as HireDate,1 as IdNumber
from @FirstName f
CROSS JOIN @LastName l
GO

update e set DateOfBirth = dateadd(MM,Id,DateOfBirth),  
			 HireDate = dateadd(MM,2*Id,'1990.01.01'), 
			 NationalIdNumber =  id + cast(10000000 * rand(id*10) as int)
from dbo.Employees e
GO


-- Customer
-----------
declare @City table (City nvarchar(100),Region nvarchar(100))
insert into @City
select substring(name,9,100),Region 
from dbo.BusinessEntities
UNION select 'Radovis','Strumicki'
UNION select 'Kocani','Stipski'
UNION select 'Gevgelija','Strumicki'

declare @Market table (name nvarchar(100))
insert into @Market values ('Vero'),('Tinex'),('Ramstor'),('Kam'),('Zito'),('Zegin'),('Eurofarm'),('Makpetrol'),('Lukoil'),('Tobacco')

insert into dbo.Customers (Name, City,RegionName, isActive)
select m.name + N' ' + c.City as Name, c.City as City, case when c.Region = 'Strumicki' then 'Stipski' else c.Region end as Region, 1 as IsActive
from @Market m
CROSS APPLY @City c

update c set AccountNumber = id + cast(233255 * rand(id*7) as int),
CustomerSize = case when id%3 = 0 then 'Small' when id % 3 = 1 then 'Medium' else 'Large' end, 
PhoneNumber = N'070' + Cast(cast(1000000 * rand(id*3) as int) as nvarchar(10))
 from dbo.Customers c

 GO

-- Product
-----------

INSERT INTO dbo.Products (Name)
VALUES('Crunchy'),('Granola'),('Regular/soft'),('Gluten Free'),('Multigrain'),('Take away'),('Cornflakes'),('Cereals'),('Protein Bar'),('Raw bars'),('No Sugar Added'),('Multigrain'),
('Gluten Free'),('Kids Bar'),('Fruit, Nuts & Seeds'),('Protein balls'),('Rice Cakes'),('Mini cereal bites'),('Dried Fruits'),('Crackers'),('Cookies'),('Unrefined sugars'),
('Natural Sweeteners'),('Diabetic'),('Plant-based drinks'),('Smoothie drinks'),('Natural Juices'),('Green Teas'),('Functional Teas'),('Fruit Teas'),('Seeds'),('Oils & Vinegars'),
('Gluten Free Pasta'),('Flours'),('Superfoods'),('Sport Supplements'),('Honey Syrup'),('Sweet Spreads'),('Spices'),('Soups'),('Salty Spreads'),('Soy Pates'),('Soy milks')


update p set Weight = cast(100* id * rand(100+id) as int),
Cost = cast(20 + 10* id * rand(23+id) as int),
Price = 5 + id + cast(20 + 10* id * rand(23+id) as int),
Code = substring(Name,1,3) + cast(id as nvarchar(10)),
Description = Name + ' description'
from dbo.Products p
GO

-- Order
--------
 
 Insert into dbo.[Orders] (OrderDate, Status, BusinessEntityId, CustomerId,EmployeeId,TotalPrice,Comment)
 select '2019.05.01' as OrderDate, 0 as Status, b.Id , c.Id, e.Id, 0 as TotalPrice, N'' as comment
 from dbo.BusinessEntities b
 cross apply dbo.Customers c
 cross apply dbo.Employees e
 where b.Id not in (13,15)
 and c.Id % 10 >3
 and e.Id % 10 <7
 and b.Region = c.RegionName

 update o set OrderDate =  dateadd(DD,-(Id%120),OrderDate)
 from dbo.[Orders] o
 GO

 -- Order details
 INSERT INTO dbo.OrderDetails (OrderId, ProductId,Quantity,Price)
 select o.id,p.Id, 1 + (p.id + o.id) % 13,p.Price
 from [Orders] o
 cross apply Products p 
 where (o.id %2 + o.id %3 )= p.id % 11
 and p.id % 10 not in (3,4)
 and o.id % 10 < 7
 GO

 ; with cte as (
 select o.Id, sum(d.Quantity * d.Price) as TotalPrice
 from dbo.[Orders] o
 inner join dbo.OrderDetails d on o.Id = d.OrderId
 group by o.id 
 )
 update o set TotalPrice = c.TotalPrice
 from dbo.[Orders] o
 inner join cte c on c.Id = o.id

GO


SELECT * from dbo.BusinessEntities
select * from dbo.Employees
SELECT * from dbo.Products
select * from dbo.Customers 
select * from dbo.[Orders]
select * from dbo.[OrderDetails]

--end 
--class code bellow =>

--SQL Comaparison operators
-- = Equal
-- <> Not Equal
-- > Greater
-- < Lesser
-- >= Greater or Equal
-- <= Lesser or Equal
-- LIKE pattern matching
-- BETWEEN between a given range

--WORKSHOP1
--Find all Employees with FirstName = Goran
--Find all Employees with LastName starting With ‘S’
--Find all Employees with DateOfBirth greater than ‘01.01.1988’
--Find all Male employees
--Find all employees hired in January/1998
--Find all Employees with LastName starting With ‘A’ hired in January/2019

SELECT * 
FROM Employees
WHERE FirstName = 'Goran'
GO

SELECT *
FROM Employees
WHERE LastName like 'M%'
GO

SELECT *
FROM Employees
WHERE DateOfBirth > '1988.01.01'
GO

SELECT *
FROM Employees
WHERE Gender = 'M'
GO

SELECT *
FROM Employees
WHERE HireDate >= '1998.01.01' and HireDate < '1998.02.01'
GO

SELECT * 
FROM Employees
WHERE HireDate >= '1990.01.01' and HireDate < '1990.05.05'
and LastName like 'S%'
GO