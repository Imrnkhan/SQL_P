-- find Higest salary in table
select MAX (salary) from table;


2nd higest salary in TABLE


SELECT MAX(Salary) FROM employee whare salary<(SELECT MAX(salary)FROM employee)


//another way ORDER BY

SELECT id, name, salary FROM employees ORDER BY salary DESC LIMIT 1;

