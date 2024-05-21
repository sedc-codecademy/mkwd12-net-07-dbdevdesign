USE SEDC

CREATE TABLE TableA(idA int NOT NULL)
CREATE TABLE TableB(idB int NOT NULL)

INSERT INTO TableA VALUES (1), (2)

SELECT *
FROM TableA

INSERT INTO TableB VALUES (2), (3)

SELECT *
FROM TableB

--CROSS JOIN
SELECT * 
FROM TableA
CROSS JOIN TableB
ORDER BY idA, idB

--INNER JOIN
SELECT * 
FROM TableA
INNER JOIN TableB
ON idA = idB

--LEFT OUTER JOIN
SELECT *
FROM TableA LEFT OUTER JOIN TableB --take all data from the table on the left (TableA) and only the ones that match on the other side (TableB)
ON idA = idB

SELECT *
FROM TableB LEFT OUTER JOIN TableA --take all data from the table on the left (TableB) and only the ones that match on the other side (TableA)
ON idA = idB

--RIGHT OUTER JOIN
SELECT *
FROM TableA RIGHT OUTER JOIN TableB
ON idA = idB

SELECT *
FROM TableB RIGHT OUTER JOIN TableA
ON idA = idB

--FULL OUTER JOIN 

SELECT *
FROM TableA
FULL OUTER JOIN TableB
On idA = idB