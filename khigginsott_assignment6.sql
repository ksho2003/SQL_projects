/* Assignment6.sql 
Kailee Higgins Ott
CS 31A, Winter 2022 */

USE MEGASTORE;
/*Question 1*/
SELECT AVG(salary) AS Average 
FROM employees 
WHERE manager_id = 100;

/*Question 2*/
SELECT 
  MIN(salary) AS lowest_salary, 
  MAX(hire_date) AS recent_hire, 
  MIN(last_name) AS f_last_name, 
  MAX(last_name) AS l_last_name
FROM employees
WHERE dept_id IN (30, 60);


/*Question 3*/
SELECT CONCAT(first_name, ' ', last_name) AS "employee name", salary
FROM employees
WHERE last_name LIKE '%ar%';

/*Question 4*/
SELECT MIN(last_name) AS first_last_name, MAX(last_name) AS 
last_last_name FROM employees;

/*Question 5*/
SELECT emp_id, CONCAT('$', ROUND(salary/52, 2)) AS 'weekly salary'
FROM EMPLOYEES;

/*Question 6*/
SELECT prod_id, UPPER(prod_desc) AS 'Prod_description'
FROM products;

/*Question 7*/
SELECT cust_id, first_name, last_name, ROUND(credit_limit) AS 'balance'
FROM customers;

/*Question 8*/
SELECT o.ord_id, c.cust_id, c.first_name, c.last_name, 
DATE_ADD(o.ord_date, INTERVAL 20 DAY) AS promotion_date
FROM orders o
JOIN customers c ON o.cust_id = c.cust_id;

/*Question 9*/
SELECT prod_id, COUNT(*) as numorders
FROM order_details
GROUP BY prod_id
ORDER BY NumOrders DESC;

/*Question 10*/
SELECT o.cust_id as cust_id, COUNT(DISTINCT od.prod_id) as number_of_items
FROM ORDERS o
JOIN ORDER_DETAILS od ON o.ord_id = od.ord_id
GROUP BY o.cust_id
HAVING COUNT(DISTINCT od.prod_id) > 1;

/*Question 11*/
SELECT p.catg_id, COUNT(*) as number_of_products, AVG(p.prod_list_price) as 
'Average price of the products'
FROM products p
WHERE p.catg_id IN (
    SELECT catg_id
    FROM products
    GROUP BY catg_id
    HAVING COUNT(*) > 5
)
GROUP BY p.catg_id;

/*Question 12*/
SELECT AVG(prod_list_price) as avgPrice, catg_id
FROM products
GROUP BY catg_id;

/*Question 13*/
SELECT o.ord_id, od.prod_id, p.catg_id, p.prod_name
FROM ORDERS o
JOIN ORDER_DETAILS od ON o.ord_id = od.ord_id
JOIN PRODUCTS p ON od.prod_id = p.prod_id
WHERE p.catg_id = 'SPG'
UNION ALL
SELECT o.ord_id, od.prod_id, p.catg_id, p.prod_name
FROM ORDERS o
JOIN ORDER_DETAILS od ON o.ord_id = od.ord_id
JOIN PRODUCTS p ON od.prod_id = p.prod_id
WHERE p.catg_id = 'PET'
ORDER BY ord_id;


/*Question 14*/
SELECT p.prod_id, p.catg_id, p.prod_name
FROM ORDERS o
JOIN ORDER_DETAILS od ON o.ord_id = od.ord_id
JOIN PRODUCTS p ON od.prod_id = p.prod_id
WHERE p.catg_id = 'HW' AND MONTH(o.ord_date) = 11
UNION
SELECT p.prod_id, p.catg_id, p.prod_name
FROM ORDERS o
JOIN ORDER_DETAILS od ON o.ord_id = od.ord_id
JOIN PRODUCTS p ON od.prod_id = p.prod_id
WHERE p.catg_id = 'HW' AND MONTH(o.ord_date) = 12;
