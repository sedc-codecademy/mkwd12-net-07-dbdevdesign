USE SEDC

-- BUILD-IN FUN

SELECT FirstName, LastName,
Left(FirstName, 3) AS Left_3,
Right(FirstName, 4) AS Right_4,
Len(FirstName) As Len_firstName,
Replace(FirstName, 'Ale', 'X-') AS Replace_FN,
SUBSTRING(FirstName, 2, 5) AS Substring_FN_5,
SUBSTRING(FirstName, 2, Len(FirstName)) AS Substring_FN,
CONCAT(FirstName, N' ', LastName) AS Concat_FN_LN
FROM [dbo].[Employee]
WHERE FirstName = 'Aleksandar'
GO


-- Date Fun
DECLARE @dt DATETIME
SET @dt = GETDATE()

SELECT @dt AS DateNow, DATEADD(day, 7, @dt) AS Date_DAY
SELECT @dt AS DateNow, DATEADD(day, -7, @dt) AS Date_DAY_Minus

SELECT @dt AS DateNow, DATEDIFF(day, '2024-01-01', @dt)
SELECT @dt AS DateNow, DATEDIFF(MONTH, '2024-01-01', @dt)
SELECT @dt
GO