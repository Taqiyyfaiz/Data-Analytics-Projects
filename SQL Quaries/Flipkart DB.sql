CREATE DATABASE flipkart_db;

CREATE TABLE Products (
product_id serial primary key,
name varchar(100) not null,
sku_code char(8) unique not null,
price numeric(10, 2) check (price >= 0),
stock_quantity int default 0 check (stock_quantity >= 0),
is_available Boolean default TRUE,
category text not null,
added_on date default (current_date),
last_update Timestamp default now()
);

ALTER TABLE Products
DROP COLUMN sku_code,
DROP COLUMN last_update;

SELECT * FROM Products;


INSERT INTO products (product_id, name, category, price, stock_quantity, is_available, added_on)
VALUES
(101,'Wireless Mouse','Electronics',1611.53,79,0,'2025-04-29'),
(102,'Bluetooth Speaker','Electronics',135.14,23,1,'2025-06-04'),
(103,'Laptop Stand','Accessories',1020.92,161,0,'2025-07-09'),
(104,'USB-C Hub','Accessories',408.39,164,0,'2025-05-12'),
(105,'Notebook','Stationery',1987.74,116,1,'2025-07-01'),
(106,'Pen Set','Stationery',1048.1,150,1,'2025-06-29'),
(107,'Coffee Mug','Home & Kitchen',1063.53,76,0,'2025-04-15'),
(108,'LED Desk Lamp','Home & Kitchen',239.1,93,0,'2025-05-23'),
(109,'Yoga Mat','Fitness',1514.86,162,1,'2025-05-05'),
(110,'Water Bottle','Fitness',420.99,191,1,'2025-05-09'),
(111,'Smartphone','Electronics',361.2,200,0,'2025-04-18'),
(112,'Headphones','Electronics',154.84,178,1,'2025-05-18'),
(113,'Gaming Keyboard','Accessories',103.24,100,0,'2025-04-19'),
(114,'Monitor','Electronics',305.2,123,0,'2025-05-20'),
(115,'HDMI Cable','Accessories',552.97,105,1,'2025-06-17'),
(116,'Power Bank','Electronics',831.88,13,0,'2025-07-01'),
(117,'Backpack','Accessories',1517.11,64,1,'2025-05-08'),
(118,'Webcam','Electronics',1428.3,76,0,'2025-06-11'),
(119,'Desk Organizer','Home & Kitchen',404.69,136,0,'2025-06-14'),
(120,'Fitness Band','Fitness',1451.69,171,0,'2025-05-06');

SELECT * FROM products;

-- Q1 Show the name and price of all products.
SELECT name, price 
FROM products;
-- Q2 Show all products where the category is 'Electronics'
SELECT * 
FROM Products
WHERE Category = 'Electronics';
-- Q3 Group Products By Category. Show each category at once 
SELECT category 
FROM products
GROUP BY category;
-- Q4 Show categories that have more than 1 products. (Use after Grou)
SELECT category, count(*) 
FROM products 
GROUP BY category
HAVING count(*) > 1;
-- Q5 Show all the products sorted by price in ascending order.
SELECT *
FROM products
order by price ASC;
-- Q6 Show only the 3 products from the table
SELECT *
FROM products 
LIMIT 3;
-- Q7 Show product name as 'item_name' and price as 'item_price'
SELECT name AS item_name, price AS item_price
FROM products;
-- Q8 Show all the Unique Categories from the product
Select distinct category from products;

-- Clauses with Operators 
select * FROM products where price between 400 and 1000;

-- Test 2
-- Q1 Display the name and price of the cheapest product in the entire tabel
select name, price
from products 
where price = (select min(price) from products);
-- Q2 Find the avg price of the products that belong to the 'home & kictchen' or 'fitness' category
SELECT round(avg(price), 2) 
from products
where category in ('Home & Kitchen', 'Fitness');
-- Q3 Show product names and stock quantity where the product is available. Stock is more than 50, and price is not equal to 299/-.
select name, stock_quantity 
from products
where is_available = True AND stock_quantity > 50 AND price != 299;
-- Q4 Find the most expensive product in each category (name and price)
select category, max(price) as max_price
from products
group by category;
-- Q5 Show all tha Unique categories in UPPERCASE sorted in descending order
SELECT DISTINCT UPPER(category)
from products
order by UPPER(category) DESC;