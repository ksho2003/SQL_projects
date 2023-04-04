
/* Assignment3.sql 
Kailee Higgins Ott
   CS 31A, Winter 2022 */
   
/* put the database name into this command */
USE megastore;

/* Query 1
Purpose: Display the product ID, warehouse ID 
and quantity using appropriate aliases for all 
products that have a quantity between 50 and 100.00. 
Rows returned:
*/

SELECT prod_id AS "product id",
   warehouse_id AS "warehouse id",
   quantity_on_hand AS "quantity onhand"
FROM inventory
WHERE quantity_on_hand BETWEEN (50, 100);   