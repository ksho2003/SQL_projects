/* Assignment4.sql 
Kailee Higgins Ott
CS 31A, Winter 2022 */
USE megastore;

/* Question 1
 Rows returned: 9
*/

CREATE TABLE GLOBAL_LOCATIONS (
   id INT(4) PRIMARY KEY,
   loc_name VARCHAR(20),
   address VARCHAR(20),
   city VARCHAR(20),
   zip_postal_code VARCHAR(20),
   phone VARCHAR(15),
   email VARCHAR(15) UNIQUE KEY,
   manager_id INT(4),
   emergency_contact VARCHAR(20),
);

DESC GLOBAL_LOCATIONS;

/*Question 2
Rows returned: 9
*/
ALTER TABLE GLOBAL_LOCATIONS
ADD UNIQUE KEY (email);

/*Question 3
Rows returned: 10
*/
ALTER TABLE GLOBAL_LOCATIONS
ADD date_opened date;

DESC GLOBAL_LOCATIONS;

/*Question 4
Rows returned: 10
*/
SELECT COLUMN_NAME, DATA_type
FROM INFORMATION_SCHEMA.COLUMNS
WHERE 
   TABLE_SCHEMA = Database()
   AND TABLE_NAME = 'GLOBAL_LOCATIONS';

/*Question 5
Rows returned: 9
*/
ALTER TABLE GLOBAL_LOCATIONS
DROP date_opened;

/* Question 6
Rows returned: 9
*/

ALTER TABLE GLOBAL_LOCATIONS
RENAME to GLOBAL_LOCATIONS_BACKUP;

/* Question 7
Rows returned:
*/
CREATE TABLE EMPLOYEE_PAY(
   employee_id INT PRIMARY KEY,
   ssn CHAR UNIQUE KEY,
   salary NUMERIC NOT NULL,
   hire_date DATE NOT NULL
)

/*Question 8
Rows returned:
*/
INSERT INTO EMPLOYEE_PAY (employee_id, ssn, salary, hire_date)
   VALUES (184167702, '744-04-9444', 5500, 2011-03-15);

SELECT * FROM EMPLOYEE_PAY;

/*Question 9
Rows returned:
*/
DESC EMPLOYEE_PAY;

ALTER TABLE EMPLOYEE_PAY
ADD email CHAR(30);
DESC EMPLOYEE_PAY;

/*Question 10
Rows returned:
*/
SHOW TABLES; 

/*Question 11
Rows returned:
*/
ALTER TABLE EMPLOYEE_PAY
DROP email;

/*Question 12
Rows returned:
*/
DELETE GLOBAL_LOCATIONS_BACKUP;
SHOW TABLES;

/*Question 13
Rows returned:
*/
INSERT INTO CATEGORIES(catg_id, catg_desc)
   VALUES ('FU', 'feurniture');
SELECT * FROM CATEGORIES;

/*Question 14
Rows returned:
*/
UPDATE CATEGORIES
   SET catg_desc = 'furniture'
   WHERE catg_id = 'FU';


