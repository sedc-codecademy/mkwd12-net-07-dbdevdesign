USE SEDC

DECLARE @Name NVARCHAR(250)
--SET @Name = 'Ana'
SET @Name = 'A'

IF (LEN(@Name) < 2)
		SELECT 'This name is too short'
ELSE
		SELECT @Name + ' is a sutable name'

---------------------------------
DECLARE @Age INT
--SET @Age = 24
SET @Age = 124
IF (@Age > 120)
	SELECT 'ERROR' AS [Status]
ELSE 
    SELECT 'SUCCESS' AS [Status]