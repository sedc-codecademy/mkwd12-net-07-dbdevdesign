CREATE TABLE TableA (idA int NOT NULL)
CREATE TABLE TableB (idB int NOT NULL)

INSERT INTO TableA VALUES (1), (2),(3)
INSERT INTO TableB VALUES (2), (3),(4)

ALTER TABLE [dbo].TableB
ADD PRIMARY KEY (idB)

-- CROSS JOIN  (MxN)
SELECT *
FROM [dbo].[TableA]
CROSS JOIN [dbo].[TableB]
ORDER BY idA, idB

-- INNER JOIN
SELECT *
FROM [dbo].[TableA]
INNER JOIN [dbo].[TableB] ON idA = idB

-- LEFT JOIN
SELECT *
FROM [dbo].[TableA]
LEFT JOIN [dbo].[TableB] ON idA = idB

-- RIGHT JOIN
SELECT *
FROM [dbo].[TableA]
RIGHT JOIN [dbo].[TableB] ON idA = idB

-- FULL JOIN
SELECT *
FROM [dbo].[TableA]
FULL JOIN [dbo].[TableB] ON idA = idB