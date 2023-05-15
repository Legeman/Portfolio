DROP DATABASE IF EXISTS `Yuriks_Portfolio_LTD`;
CREATE DATABASE `Yuriks_Portfolio_LTD`; 
USE `Yuriks_Portfolio_LTD`;

SET NAMES utf8 ;
SET character_set_client = utf8mb4 ;

CREATE TABLE `payment_methods` (
  `payment_method_id` tinyint(4) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`payment_method_id`)
); 
INSERT INTO `payment_methods` VALUES (1,'Cash');
INSERT INTO `payment_methods` VALUES (2,'Credit CArd');
INSERT INTO `payment_methods` VALUES (3,'PayPal');
INSERT INTO `payment_methods` VALUES (4,'Wire Transfer');


CREATE TABLE `customers` (
  `customer_id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  `birth_date` date DEFAULT NULL,
  `phone` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`customer_id`)
);
INSERT INTO `customers` VALUES (1,'Anna','Magan','1986-03-28','095-932-9754');
INSERT INTO `customers` VALUES (2,'Ivan','Brusnenko','1986-04-13','066-427-9456');
INSERT INTO `customers` VALUES (3,'Petro','Bobkov','1985-02-07','068-724-7869');
INSERT INTO `customers` VALUES (4,'Oleksandr','Rosenok','1974-04-14','063-231-8017');
INSERT INTO `customers` VALUES (5,'Yurii','Betnuk','1973-11-07',NULL);
INSERT INTO `customers` VALUES (6,'Eva','Twidok','1991-09-04','099-480-8498');
INSERT INTO `customers` VALUES (7,'Olga','Dowsonuk','1964-08-30','066-641-4759');
INSERT INTO `customers` VALUES (8,'Natasha','Nasebok','1993-07-17','095-527-3977');
INSERT INTO `customers` VALUES (9,'Roman','Rumgov','1992-05-23','066-181-3744');
INSERT INTO `customers` VALUES (10,'Ivan','Petrov','1969-10-13','068-246-3370');


CREATE TABLE `offices` (
  `office_id` int(11) NOT NULL,
  `address` varchar(50) NOT NULL,
  `city` varchar(50) NOT NULL,
  `oblast` varchar(50) NOT NULL,
  PRIMARY KEY (`office_id`)
);
INSERT INTO `offices` VALUES (1,'03 Zalushna st','HQ City','HQ');
INSERT INTO `offices` VALUES (2,'550 Odesa st','Odesa','OD');
INSERT INTO `offices` VALUES (3,'435 Chernihiv st','Chernihiv','CH');
INSERT INTO `offices` VALUES (4,'67 Zakarpatiye drive','Mukachevo','ZA');
INSERT INTO `offices` VALUES (5,'45 West road','Rivne','RN');
INSERT INTO `offices` VALUES (6,'123 Ushhorod ave','Ushhorodska','USH');
INSERT INTO `offices` VALUES (7,'96 Slav st','Chernihiv','CH');
INSERT INTO `offices` VALUES (8,'94 Kyiv road','Kyiv','KO');
INSERT INTO `offices` VALUES (9,'12 Westend Hill','Vinitsa','VN');
INSERT INTO `offices` VALUES (10,'45 Cherkasy Parkway','Cherkasy','CHK');


CREATE TABLE `workers` (
  `workers_id` int(11) NOT NULL,
  `first_name` varchar(50) NOT NULL,
  `last_name` varchar(50) NOT NULL,
  PRIMARY KEY (`workers_id`)
  );
INSERT INTO `workers` VALUES (35270,'Serhiy','Ivanenko');
INSERT INTO `workers` VALUES (33391,'Anna','Chernenko');
INSERT INTO `workers` VALUES (37851,'Volodymyr','Zelenko');
INSERT INTO `workers` VALUES (40448,'Yurii','Krashiy');
INSERT INTO `workers` VALUES (56274,'Ivan','Tolkovenko');
INSERT INTO `workers` VALUES (63196,'Taras','Zinchenko');
INSERT INTO `workers` VALUES (67009,'Olga','Shevchenko');
INSERT INTO `workers` VALUES (67370,'Yevheniya','Velichko');
INSERT INTO `workers` VALUES (68249,'Viktor','Genko');
INSERT INTO `workers` VALUES (72540,'Pavlo','Vasin');
INSERT INTO `workers` VALUES (72913,'Olesiya','Kotubenko');


CREATE TABLE `notebooks` (
  `product_id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `quantity_in_stock` int(11) NOT NULL,
  `unit_price` int(50) NOT NULL,
  PRIMARY KEY (`product_id`)
);
INSERT INTO `notebooks` VALUES (1,'Asus',50,499);
INSERT INTO `notebooks` VALUES (2,'Acer',67,350);
INSERT INTO `notebooks` VALUES (3,'Apple',110,1100);
INSERT INTO `notebooks` VALUES (4,'Dell',32,600);
INSERT INTO `notebooks` VALUES (5,'HP',12,676);
INSERT INTO `notebooks` VALUES (6,'Lenovo',78,550);
INSERT INTO `notebooks` VALUES (7,'MSI',99,490);
INSERT INTO `notebooks` VALUES (8,'Samsung',145,520);


SELECT * FROM notebooks WHERE name = 'MSI';

SELECT COUNT(product_id) FROM notebooks;

SELECT COUNT(customer_id) FROM customers WHERE first_name = 'Yurii' AND birth_date > '1972-01-01';

SELECT MIN(quantity_in_stock) AS Least_in_stock FROM notebooks;

SELECT MAX(quantity_in_stock) AS Most_in_stock FROM notebooks;

SELECT AVG(unit_price) AS AVG_Notebooks_price FROM notebooks;

SELECT SUM(quantity_in_stock) AS Total_stock_number FROM notebooks;

SELECT * FROM customers WHERE birth_date >= '1964-08-30';

SELECT * FROM customers WHERE birth_date > '1986-03-28' OR phone LIKE '%9';

SELECT * FROM customers WHERE birth_date LIKE '____-04%';
                                                               
SELECT * FROM customers WHERE first_name LIKE '%nn%' OR birth_date >= '1986-04-13';

SELECT *, (quantity_in_stock*unit_price) AS total_price FROM notebooks WHERE product_id=3 ORDER BY   total_price DESC;

SELECT * FROM customers WHERE last_name REGEXP '^bo|ov$';

UPDATE notebooks SET quantity_in_stock = quantity_in_stock + 31 WHERE product_id =7;

UPDATE customers SET phone = '077-777-7777', last_name = 'Megan' WHERE CustomerID = 1;

UPDATE notebooks SET name = 'Hewlett-Packard', quantity_in_stock = '0' WHERE product_id = 4;

DELETE FROM notebooks WHERE name='Samsung';

ALTER TABLE customers ADD avg_points DECIMAL (5,2);

ALTER TABLE customers DROP COLUMN avg_points;

SELECT * FROM offices WHERE city IN ('Odesa','Chernihiv') OR office_id >=7;

SELECT * FROM customers LIMIT 4;


SELECT 
n.name AS Laptop_Brand,
n.unit_price,
n.quantity_in_stock,
c.first_name, 
c.last_name
FROM notebooks n
JOIN customers c
On n.product_id = c.customer_id;

DROP TABLE customers

     





