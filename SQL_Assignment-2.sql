/* Assignment-2 */

USE vishvarami_db;

CREATE TABLE salesman(
	salesman_id INTEGER,
	name VARCHAR(20),
	city VARCHAR(10),
	commission INTEGER
	);

CREATE TABLE customer(
	customer_id INTEGER,
	cust_name VARCHAR(20),
	city VARCHAR(10),
	grade INTEGER,
	salesman_id INTEGER);

	
CREATE TABLE orders(
	ord_no INTEGER,
	purch_amt INTEGER,
	ord_date DATE,
	customer_id INTEGER,
	salesman_id INTEGER);


INSERT INTO salesman VALUES (1,'John','Delhi',5);

INSERT INTO salesman VALUES (2,'Alice','Mumbai',3);

INSERT INTO salesman VALUES (3,'Bob','Chennai',15);

INSERT INTO salesman VALUES (4,'Mary','Jaipur',8);

INSERT INTO salesman VALUES (5,'David','Kochi',9);

INSERT INTO salesman VALUES (6,'Sarah','Pune',7);

INSERT INTO salesman VALUES (7,'Mike','Bhopal',10);

INSERT INTO salesman VALUES (8,'Emily','Kochi',10);

INSERT INTO salesman VALUES (9,'Kevin','Delhi',5);

INSERT INTO salesman VALUES (10,'Laura','Pune',15);

INSERT INTO salesman VALUES (11,'Ken','Pune',11);

INSERT INTO salesman VALUES (12,'Ben','Pune',12);


SELECT * FROM salesman;

DROP TABLE salesman;

INSERT INTO customer VALUES (101,'Aarav','Delhi',200,1);

INSERT INTO customer VALUES (102,'Nidhi','Kochi',300,8);

INSERT INTO customer VALUES (103,'Tara','Pune',400,10);

INSERT INTO customer VALUES (104,'Priya','Bhopal',450,7);

INSERT INTO customer VALUES (105,'Meera','Chennai',350,3);

INSERT INTO customer VALUES (106,'Pooja','Mumbai',200,2);

INSERT INTO customer VALUES (107,'Krishna','Jaipur',250,4);

INSERT INTO customer VALUES (108,'Radha','Kochi',300,5);

INSERT INTO customer VALUES (109,'Kavish','Pune',500,6);

INSERT INTO customer VALUES (110,'Ramesh','Pune',550,10);

INSERT INTO customer VALUES (111,'Suresh','Kochi',250,9);

INSERT INTO customer VALUES (112,'Mita','Pune',300,7);

INSERT INTO customer VALUES (113,'Gita','Kochi',300,7);

INSERT INTO customer VALUES (114,'Ritu','Jaipur',800,10);

INSERT INTO customer VALUES (115,'Sita','Delhi',700,5);

INSERT INTO customer VALUES (116,'Sangita','Mumbai',900,NULL);



SELECT * FROM customer;


INSERT INTO orders VALUES(21, 500, '2020-10-11',101,5);

INSERT INTO orders VALUES(22, 200, '2020-10-13',102,6);

INSERT INTO orders VALUES(23, 400, '2020-10-15',103,7);

INSERT INTO orders VALUES(24, 800, '2020-10-18',104,8);

INSERT INTO orders VALUES(25, 250, '2020-10-20',105,9);

INSERT INTO orders VALUES(26, 350, '2020-10-25',106,10);

INSERT INTO orders VALUES(27, 600, '2020-11-11',107,2);

INSERT INTO orders VALUES(28, 700, '2020-11-15',108,3);

INSERT INTO orders VALUES(29, 750, '2020-11-19',109,4);

INSERT INTO orders VALUES(30, 600, '2020-11-11',110,1);

INSERT INTO orders VALUES(31, 800, '2020-11-18',111,9);

INSERT INTO orders VALUES(32, 850, '2020-11-25',112,7);

INSERT INTO orders VALUES(33, 850, '2020-11-25',113,7);

INSERT INTO orders VALUES(34, 850, '2020-11-25',114,10);

INSERT INTO orders VALUES(35, 2550, '2020-11-26',114,10);



SELECT * FROM orders;

DELETE FROM  orders WHERE ord_no=32;

/* 1 */
SELECT salesman.name, cust_name,customer.city FROM customer  JOIN salesman ON customer.city=salesman.city;

/* 2 */
SELECT ord_no, purch_amt,customer.cust_name, customer.city FROM orders INNER JOIN customer ON orders.customer_id=customer.customer_id WHERE purch_amt>500 AND purch_amt<2000 ;

/* 3 */
SELECT customer.cust_name, customer.city, salesman.name, salesman.commission FROM salesman INNER JOIN customer ON salesman.salesman_id = customer.salesman_id;

/* 4 */
SELECT customer.cust_name, customer.city, name, commission FROM salesman INNER JOIN customer ON salesman.city=customer.city WHERE commission>12;

/* 5 */
SELECT customer.cust_name, customer.city, name, salesman.city, commission FROM salesman INNER JOIN customer ON salesman.salesman_id=customer.salesman_id WHERE  salesman.city!=customer.city AND commission>12;

/* 6 */
SELECT o.ord_no, o.ord_date, o.purch_amt, c.cust_name, c.grade, s.name, s.commission FROM orders o
INNER JOIN customer c ON o.customer_id = c.customer_id 
INNER JOIN salesman s ON o.salesman_id=s.salesman_id;

/* 7 */
SELECT c.cust_name, c.customer_id, c.city, c.grade, c.salesman_id, s.name, s.commission, o.ord_no, o.ord_date, o.purch_amt FROM orders o
INNER JOIN customer c ON o.customer_id = c.customer_id 
INNER JOIN salesman s ON o.salesman_id=s.salesman_id;

/* 8 */
SELECT c.cust_name, c.city, c.grade, s.name, s.city FROM customer c INNER JOIN salesman s ON c.salesman_id = s.salesman_id ORDER BY c.customer_id;

/* 9 */
SELECT c.cust_name, c.city, c.grade, s.name, s.city FROM customer c INNER JOIN salesman s ON c.salesman_id = s.salesman_id WHERE c.grade<300 ORDER BY c.customer_id;

/* 10 */
SELECT c.cust_name, c.city, o.ord_date, o.purch_amt FROM customer c LEFT JOIN orders o ON c.customer_id = o.customer_id  ORDER BY o.ord_date;

/* 11 */
SELECT c.cust_name, c.city, o.ord_no, o.ord_date, o.purch_amt, s.name, s.commission FROM customer c
LEFT JOIN orders o ON c.customer_id=o.customer_id
LEFT JOIN salesman s ON c.salesman_id=s.salesman_id;

/* 12 */
SELECT s.salesman_id, s.name, c.cust_name FROM salesman s
LEFT JOIN customer c ON s.salesman_id=c.salesman_id

/* 13 */
SELECT s.name, c.cust_name, c.city, c.grade, o.ord_no, o.ord_date, o.purch_amt FROM salesman s
LEFT JOIN customer c ON s.salesman_id = c.salesman_id
LEFT JOIN orders o ON s.salesman_id = o.salesman_id

/* 14 */
SELECT * FROM salesman s LEFT JOIN orders o ON s.salesman_id=o.salesman_id
LEFT JOIN customer c ON o.customer_id = c.customer_id WHERE o.purch_amt>=2000 OR (o.purch_amt IS NULL AND c.grade IS NOT NULL)

/* 15 */
SELECT * FROM salesman s LEFT JOIN customer c ON s.salesman_id = c.salesman_id
LEFT JOIN orders o ON c.customer_id = o.customer_id WHERE o.purch_amt>=2000 OR (o.purch_amt IS NULL AND c.grade IS NOT NULL)

/* 16 */
SELECT c.cust_name, c.city, o.ord_no, o.ord_date, o.purch_amt FROM orders o INNER JOIN customer c ON o.customer_id=c.customer_id 
WHERE c.grade IS NOT NULL


/* 17 */
SELECT * FROM salesman 
CROSS JOIN customer;

/* 18 */
SELECT * FROM salesman s CROSS JOIN customer c WHERE s.city = c.city

/* 19 */
SELECT * FROM salesman s CROSS JOIN customer c WHERE s.city IS NOT NULL AND c.grade IS NOT NULL;

/* 20 */
SELECT * FROM salesman s CROSS JOIN customer c WHERE s.city != c.city AND c.grade IS NOT NULL;