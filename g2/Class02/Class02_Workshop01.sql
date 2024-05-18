--Find all Employee with FirstName = Goran
--Find all Employee with LastName starting With ‘S’
--Find all Employee with DateOfBirth greater than ‘01.01.1988’
--Find all Male Employee
--Find all Employee hired in January/1998
--Find all Employee with LastName starting With ‘A’ hired in January/2019

SELECT *
FROM [dbo].[Employee]
WHERE FirstName = 'Goran'

SELECT *
FROM [dbo].[Employee]
WHERE LastName LIKE 'S%'

SELECT *
FROM [dbo].[Employee]
WHERE [DateOfBirth] > '01.01.1988'

SELECT *
FROM [dbo].[Employee]
WHERE Gender = 'M'

SELECT *
FROM [dbo].[Employee]
WHERE [HireDate] >= '1998.01.01' AND [HireDate] <= '1998.01.31'

SELECT *
FROM [dbo].[Employee]
WHERE LastName LIKE 'A%' AND [HireDate] >= '2019.01.01' AND [HireDate] <= '2019.01.31'