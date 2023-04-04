/* Assignment5.sql 
Kailee Higgins Ott
CS 31A, Winter 2022 */

USE MEGASTORE;
/*Question 1*/
SELECT orders.ord_id, orders.ord_date, customers.cust_id,
customers.first_name, customers.last_name
FROM orders
INNER JOIN customers
ON orders.cust_id = customers.cust_id;

/*Question 2*/
SELECT orders.ord_id, customers.cust_id, customers.first_name, 
customers.last_name, orders.ord_date
FROM orders
INNER JOIN customers
ON orders.cust_id = customers.cust_id
WHERE orders.ord_date = '2014-04-04';

/*Question 3*/
SELECT customers.cust_id, customers.first_name, customers.last_name
FROM customers
LEFT JOIN orders
ON customers.cust_id = orders.cust_id
WHERE orders.ord_date != '2014-04-04';

/*Question 4*/
SELECT orders.ord_id, orders.ord_date, order_details.prod_id, products.prod_desc, 
categories.catg_id
FROM orders
INNER JOIN order_details
ON orders.ord_id = order_details.ord_id
INNER JOIN products
ON order_details.prod_id = products.prod_id
INNER JOIN categories
ON products.catg_id = categories.catg_id
ORDER BY categories.catg_id, orders.ord_id;

/*Question 5*/
SELECT orders.ord_id, orders.ord_date, customers.first_name, customers.last_name
FROM orders
INNER JOIN customers
ON orders.cust_id = customers.cust_id
LEFT JOIN order_details
ON orders.ord_id = order_details.ord_id
LEFT JOIN products
ON order_details.prod_id = products.prod_id
WHERE customers.first_name = 'Samuel'
AND customers.last_name = 'Morse'
AND (products.prod_desc IS NULL OR products.prod_desc != 
	'Electric Pancake griddle');

/*Question 6*/
SELECT customers.cust_id, customers.last_name as Customer, orders.ord_id, 
order_details.prod_id, products.prod_name
FROM customers
INNER JOIN orders
ON customers.cust_id = orders.cust_id
INNER JOIN order_details
ON orders.ord_id = order_details.ord_id
INNER JOIN products
ON order_details.prod_id = products.prod_id
LIMIT 10;

/*Question 7*/
SELECT orders.ord_id, customers.cust_id, customers.last_name, 
order_details.prod_id, products.prod_name
FROM orders
JOIN customers ON orders.cust_id = customers.cust_id
JOIN order_details ON orders.ord_id = order_details.ord_id
JOIN products ON order_details.prod_id = products.prod_id
WHERE products.catg_id = 'MUS';


/*Question 8*/
SELECT customers.cust_id, customers.credit_limit, credit_ratings.rating
FROM customers
JOIN credit_ratings ON customers.credit_limit BETWEEN credit_ratings.low_limit 
AND credit_ratings.high_limit;

/*Question 9*/
SELECT products.prod_id, products.prod_desc, products.catg_id, order_details.ord_id
FROM products
LEFT JOIN order_details ON products.prod_id = order_details.prod_id
WHERE products.catg_id = 'MUS';

/*Question 10*/
SELECT customers.cust_id, customers.last_name, orders.ord_id
FROM customers
LEFT JOIN orders ON customers.cust_id = orders.cust_id;

/*Question 11*/
SELECT products.prod_id, products.prod_name, categories.catg_desc
FROM products
JOIN categories ON products.catg_id = categories.catg_id
ORDER BY categories.catg_id, products.prod_id;

/*Question 12*/
SELECT e1.first_name as first_name,
       e1.last_name as last_name,
       e2.first_name as mgr_first_name,
       e2.last_name as mgr_last_name
FROM employees e1
LEFT JOIN employees e2
ON e1.manager_id = e2.emp_id;








