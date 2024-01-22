USE vishvarami_db
SELECT * FROM Products
DELETE FROM Products WHERE ProductID=1


ALTER TABLE Products ADD Discontinued BIT; 



SELECT ProductID, ProductName, UnitPrice FROM Products ORDER BY UnitPrice DESC;




UPDATE Products SET Discontinued = 1 WHERE ProductID=1;

DROP TABLE Products


SELECT * FROM Products ORDER BY ProductID;

DELETE FROM Products WHERE ProductID=3;
DElETE FROM Products

USE vishvarami_db

Assignment -1 

SELECT* FROM Products;

CREATE TABLE Products (
ProductID INTEGER, ProductName VARCHAR(20), SupplierID INTEGER, CategoryID INTEGER, QuantityPerUnit INTEGER, UnitPrice INTEGER, UnitsInStock INTEGER, UnitsOnOrder INTEGER, ReorderLevel INTEGER, Discontinued BIT);

INSERT INTO Products VALUES (
1, 'Pen', 20, 1, 2, 20, 5, 1, 2, 1);

INSERT INTO Products VALUES (
2, 'Coffee Mug', 21, 2, 5, 30, 2, 2, 2, 0);

INSERT INTO Products VALUES (
3, 'Laptop', 22, 3, 4, 40, 3, 3,1,0);

INSERT INTO Products VALUES (
4, 'Backpack', 20, 4, 4, 50, 2 ,2,1,0);

INSERT INTO Products VALUES (
5, 'Wallet', 21, 5, 5, 60, 3, 3,2,1);

INSERT INTO Products VALUES (
6,'Notebook', 22, 6, 3, 70, 2, 1,2,0);

INSERT INTO Products VALUES (
7,'Water Bottle', 21, 7, 3, 10, 2, 1, 1,1);

INSERT INTO Products VALUES (
8,'Keychain', 22, 8, 3, 15, 2, 1, 1,0);

INSERT INTO Products VALUES (
9,'T-shirt', 23, 8, 3, 35, 2, 1, 1,0);

INSERT INTO Products VALUES (
10,'Sunglasses', 22, 8, 3, 55, 2, 1, 1,1);

INSERT INTO Products VALUES (
11,'Umbrella', 22, 8, 3, 77, 2, 1, 1,0);


INSERT INTO Products VALUES (
12,'Headphone', 21, 7, 3, 80, 1, 3, 1,0);


SELECT ProductID, ProductName, UnitPrice FROM Products WHERE UnitPrice<20;

SELECT ProductID, ProductName, UnitPrice FROM Products WHERE UnitPrice BETWEEN 15 and 25;

SELECT ProductID, ProductName, UnitPrice FROM Products WHERE UnitPrice>15 AND UnitPrice<25;

SELECT ProductID, ProductName FROM Products WHERE UnitPrice>(SELECT AVG(UnitPrice) FROM Products);

SELECT Count(ProductID) AS Discontinued FROM Products WHERE Discontinued=1;

SELECT Count(ProductID) AS CURRENT_Item FROM Products WHERE Discontinued=0;

SELECT TOP 10 ProductName, UnitPrice FROM Products ORDER BY UnitPrice DESC;

SELECT ProductName,UnitsOnOrder, UnitsInStock From Products WHERE UnitsInStock<UnitsOnOrder;