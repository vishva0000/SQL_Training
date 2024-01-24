/*          Assignment-4          */
use vishvarami_db

CREATE TABLE ncustomer(cust_id INTEGER PRIMARY KEY, cust_name VARCHAR(10), cust_country VARCHAR(10));

INSERT INTO ncustomer VALUES(101,'Riya','India');

INSERT INTO ncustomer VALUES(102,'Mike','US');

INSERT INTO ncustomer VALUES(103,'Bob','US');

INSERT INTO ncustomer VALUES(104,'Kevin','US');

INSERT INTO ncustomer VALUES(105,'John','US');

INSERT INTO ncustomer VALUES(106,'Priya','India');

INSERT INTO ncustomer VALUES(107,'Jiya','India');

INSERT INTO ncustomer VALUES(108,'Rahul','India');

INSERT INTO ncustomer VALUES(109,'Vini','India');

INSERT INTO ncustomer VALUES(110,'Asha','India');

INSERT INTO ncustomer VALUES(112,'Noah','UK');

INSERT INTO ncustomer VALUES(113,'Oliver','UK');

INSERT INTO ncustomer VALUES(114,'Leo','UK');

INSERT INTO ncustomer VALUES(115,'Taylor','UK');

SELECT * FROM ncustomer;


CREATE TABLE norders (order_id INTEGER PRIMARY KEY, ord_amt INTEGER, ord_cat_id INTEGER, ord_year INTEGER, freight INTEGER, cust_id INTEGER);

INSERT INTO norders VALUES(1, 500, 21, 2022, 150, 101);

INSERT INTO norders VALUES(2, 600, 21, 2022, 150, 102);

INSERT INTO norders VALUES(3, 550, 21, 2022, 140, 103);

INSERT INTO norders VALUES(4, 500, 21, 2022, 140, 104);

INSERT INTO norders VALUES(5, 450, 21, 2022, 130, 105);

INSERT INTO norders VALUES(6, 600, 22, 2022, 120, 106);

INSERT INTO norders VALUES(7,700, 22, 2022, 150, 107);

INSERT INTO norders VALUES(8, 800, 22, 2023, 180, 108);

INSERT INTO norders VALUES(9, 800, 22, 2023, 150, 109);

INSERT INTO norders VALUES(10, 800, 22, 2023, 170, 110);

INSERT INTO norders VALUES(11, 500, 23, 2023, 150, 111);

INSERT INTO norders VALUES(12, 500, 23, 2023, 120, 112);

INSERT INTO norders VALUES(13, 600, 23, 2023, 150, 113);

INSERT INTO norders VALUES(14, 500, 23, 2023, 120, 114);

INSERT INTO norders VALUES(15, 700, 23, 2023, 150, 115);

INSERT INTO norders VALUES(17, 700, 23, 2023, 300, 112);


SELECT * FROM norders;

				/**********************Solution***********************/

		/*  1 */

/* For finding average freight*/
	
CREATE PROCEDURE averageFreight 
 AS 
	SELECT AVG(freight) AS Average_Freight FROM norders;
Go

EXEC averageFreight;

/*     For Trigger   */
CREATE TRIGGER checkFreight
ON norders
AFTER INSERT, UPDATE
AS
BEGIN
	DECLARE @avgFreight INT, @freight INT

	SELECT @avgFreight =  AVG(freight) FROM norders;

	SELECT @freight = freight FROM inserted;

	IF @freight > @avgFreight
	 begin
        RAISERROR('Invalid Freight Update Or Insert Statment is cancelled ',16,1); 
		ROLLBACK TRANSACTION;
        end
END;


		/*  2 */
CREATE PROCEDURE salesByCountry
AS
	SELECT ncustomer.cust_country,SUM(norders.ord_amt) AS totalSales FROM norders JOIN ncustomer ON norders.cust_id=ncustomer.cust_id GROUP BY ncustomer.cust_country; 
GO

EXEC salesByCountry;

		/*  3 */

CREATE PROCEDURE salesByYear
AS
	SELECT norders.ord_year,SUM(norders.ord_amt) AS totalSales FROM norders JOIN ncustomer ON norders.cust_id=ncustomer.cust_id GROUP BY norders.ord_year; 
GO

EXEC salesByYear;

		/*  4 */

CREATE PROCEDURE salesByCategory
AS
	SELECT norders.ord_cat_id AS Catagory,SUM(norders.ord_amt) AS totalSales FROM norders JOIN ncustomer ON norders.cust_id=ncustomer.cust_id GROUP BY norders.ord_cat_id; 
GO

EXEC salesByCategory;

		/*  5 */

CREATE PROCEDURE tenMostExpensive
AS
	SELECT TOP 10 ProductName, UnitPrice FROM Products ORDER BY UnitPrice DESC;
GO

EXEC tenMostExpensive;

		/*  6 */
CREATE TABLE norders (order_id INTEGER PRIMARY KEY, ord_amt INTEGER, ord_cat_id INTEGER, ord_year INTEGER, freight INTEGER, cust_id INTEGER);

CREATE PROCEDURE InsertOrderDetails @id INTEGER, @amount INTEGER, @categoryId INTEGER, @year INTEGER, @freight INTEGER, @customerId INTEGER
AS
	INSERT INTO norders VALUES(@id, @amount, @categoryId, @year, @freight, @customerId);
GO

EXEC InsertOrderDetails @id=16, @amount=800, @categoryId=22, @year=2022,@freight=120,@customerId=111;

		/*  7 */

CREATE PROCEDURE UpdateOrderDetails @id INTEGER, @amount INTEGER, @categoryId INTEGER, @freight INTEGER, @customerId INTEGER
AS
	UPDATE norders SET ord_amt= @amount,ord_cat_id= @categoryId,freight= @freight, cust_id= @customerId WHERE order_id=@id;
GO

EXEC UpdateOrderDetails @id=1, @amount=600, @categoryId=24, @freight=100, @customerId=113;

SELECT * FROM norders;