-- DDL Operations

-- Create and use the database
CREATE DATABASE Testing;
USE Testing;

-- Create the table
CREATE TABLE students (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    grade VARCHAR(2) NOT NULL
);

-- Add a new column
ALTER TABLE students ADD COLUMN email VARCHAR(100);

-- Modify a column (changing data type of 'email' to VARCHAR(150))
ALTER TABLE students MODIFY COLUMN email VARCHAR(150);

-- Rename a column (changing 'email' to 'contact_email')
ALTER TABLE students CHANGE COLUMN email contact_email VARCHAR(150);

-- Drop the column
ALTER TABLE students DROP COLUMN contact_email;

-- DML Operations

-- Insert data into the table
INSERT INTO students (name, age, grade) VALUES ('Alice', 20, 'A');
INSERT INTO students (name, age, grade) VALUES ('Bob', 21, 'B');
INSERT INTO students (name, age, grade) VALUES ('Charlie', 22, 'C');
INSERT INTO students (name, age, grade) VALUES ('David', 23, 'D');
INSERT INTO students (name, age, grade) VALUES ('Eve', 24, 'E');
INSERT INTO students (name, age, grade) VALUES ('Frank', 25, 'F');
INSERT INTO students (name, age, grade) VALUES ('Grace', 26, 'G');
INSERT INTO students (name, age, grade) VALUES ('Hank', 27, 'H');
INSERT INTO students (name, age, grade) VALUES ('Ivy', 28, 'I');
INSERT INTO students (name, age, grade) VALUES ('Jack', 29, 'J');

-- Select data from the table
SELECT * FROM students;

-- Update data in the table
UPDATE students SET grade = 'A+' WHERE name = 'Alice';

-- Delete data from the table
DELETE FROM students WHERE name = 'Bob';

-- Truncate the table (optional)
TRUNCATE TABLE students;

-- Drop the table (optional)
DROP TABLE students;

-- Drop the database (optional)
DROP DATABASE my_database;




-- Explanation of ALTER TABLE Commands
-- Add a New Column


ALTER TABLE students ADD COLUMN email VARCHAR(100);
-- This command adds a new column called email with a VARCHAR type of length 100 to the students table.


-- Modify a Column

ALTER TABLE students MODIFY COLUMN email VARCHAR(150);
-- This command modifies the email column to change its data type to VARCHAR(150).

-- Rename a Column

ALTER TABLE students CHANGE COLUMN email contact_email VARCHAR(150);
-- This command renames the column email to contact_email and keeps its data type as VARCHAR(150).

-- Drop a Column

ALTER TABLE students DROP COLUMN contact_email;
-- This command removes the contact_email column from the students table.

-- Summary
-- DDL Commands:

CREATE DATABASE, CREATE TABLE: Create a database and a table.
1 ALTER TABLE:
ADD COLUMN: Add a new column to a table.
MODIFY COLUMN: Change the data type of an existing column.
CHANGE COLUMN: Rename an existing column.
DROP COLUMN: Remove a column from a table.
DROP TABLE, DROP DATABASE: Remove a table or a database.
TRUNCATE TABLE: Remove all data from a table.

-- DML Commands:

INSERT INTO: Add new records to a table.
SELECT: Retrieve data from a table.
UPDATE: Modify existing records in a table.
DELETE: Remove records from a table.

