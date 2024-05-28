USE SEDC
GO

SELECT Firstname,
LEFT (Firstname, 3) AS LeftFunction,
RIGHT (Firstname, 3) AS RightFunction,
LEN(Firstname) AS LenFunction,
SUBSTRING(Firstname, 1, 4) AS SubstringFunction,
REPLACE(Firstname, 'Ale', 'X-') AS ReplaceFunction
FROM Employees


SELECT * FROM OrderDetails
SELECT SUBSTRING(CAST(Price AS nvarchar(100)), 1, 2) FROM OrderDetails --with cast we are converting price to be of type nvarchar instead of decimal

