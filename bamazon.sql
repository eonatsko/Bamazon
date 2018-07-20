DROP DATABASE IF EXISTS bamazon;
CREATE DATABASE bamazon;

USE bamazon;

CREATE TABLE  products(
  item_id INT NOT NULL AUTO_INCREMENT,
  `product_name` VARCHAR(100) NOT NULL,
  `department_name` VARCHAR(100) NOT NULL,
  `price` DECIMAL(10,3) NOT NULL,
  `stock_quantity`INTEGER(10) NOT NULL,
   PRIMARY KEY (item_id)
);

INSERT INTO products (`product_name`,`department_name`, `price`,`stock_quantity`)
VALUES("Ninja Professional 72oz Countertop Blender","Home", 49.99, 41);

INSERT INTO products (`product_name`,`department_name`, `price`,`stock_quantity`)
VALUES("BERTA 1875 Watt Ceramic Blow Dryer","Beauty", 16.99, 200);

INSERT INTO products (`product_name`,`department_name`, `price`,`stock_quantity`)
VALUES("Airwalk Women's Legacee Sneaker","Fashion", 29.99, 170);

INSERT INTO products (`product_name`,`department_name`, `price`,`stock_quantity`)
VALUES("BalanceFrom All-Purpose 1/2-Inch Yoga Mat","Sports and Outdoors", 12.74, 300);

INSERT INTO products (`product_name`,`department_name`, `price`,`stock_quantity`)
VALUES("Challenger K1 Kayak, 1-Person Inflatable Kayak","Sports and Outdoors", 47.39, 23);

INSERT INTO products (`product_name`,`department_name`, `price`,`stock_quantity`)
VALUES("Genuine Leather Weight Lifting","Sports and Outdoors", 39.99, 41);

INSERT INTO products (`product_name`,`department_name`, `price`,`stock_quantity`)
VALUES("Toshiba 43-inch TV","Electronics", 249.99, 101);

INSERT INTO products (`product_name`,`department_name`, `price`,`stock_quantity`)
VALUES("Kenmore Smart 91983 9.0 cu. ft. Gas Dryer","Home", 1049.99, 74);

INSERT INTO products (`product_name`,`department_name`, `price`,`stock_quantity`)
VALUES("Aesthetica Nude Lip Contour Kit","Beauty", 24.99, 12);

INSERT INTO products (`product_name`,`department_name`, `price`,`stock_quantity`)
VALUES("Invicta Men's 8927 Pro Diver Collection Automatic Watch","Fashion", 44.99, 25);

SELECT * FROM products;



