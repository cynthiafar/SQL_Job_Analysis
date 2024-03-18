/* ALL CODE */


/* CREATE TABLE 

CREATE TABLE table_name (
    column_name datatype,
    column_name2 datatype,
   ....
);

*/

/* CREATE TABLE WITH DATA TYPES 
CREATE TABLE 
    job_applied (
    job_id INT, 
    application_sent_date DATE,
	custom_resume BOOLEAN, 
	resume_file_name VARCHAR(255),
	cover_letter_sent BOOLEAN,
	cover_letter_file_name VARCHAR(255), 
  status VARCHAR(50) 
);

*/


/* INSERT DATA INTO TABLE 


INSERT INTO table_name (column_name, column_name2, ...)
VALUES (value1, value2, ...);

*/ 


/* ALTER TABLE (ADD / RENAME/ ALTER / DROP COLUMN )

ALTER TABLE table_name
-- ADD column_name datatype;
-- RENAME COLUMN column_name TO new_name;
-- ALTER COLUMN column_name TYPE datatype;
-- DROP COLUMN column_name;

*/

/* UPDATE EXSITING DATA IN TABLE 

UPDATE table_name
SET column_name = 'new_value'
WHERE condition;

/*

/* DROP TABLE 
 BE CAREFUL THIS DELETES THE ENTIRE TABLE 

 DROP TABLE job_applied;

 */