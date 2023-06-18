1. Select the names of all the products in the store.

mysql> select name from products;
+-----------------+
| name            |
+-----------------+
| Hard drive      |
| Memory          |
| ZIP drive       |
| Floppy disk     |
| Monitor         |
| DVD drive       |
| CD drive        |
| Printer         |
| Toner cartridge |
| DVD burner      |
+-----------------+

2. Select the names and the prices of all the products in the store.

mysql> select name,price from products;
+-----------------+-------+
| name            | price |
+-----------------+-------+
| Hard drive      |   240 |
| Memory          |   120 |
| ZIP drive       |   150 |
| Floppy disk     |     5 |
| Monitor         |   240 |
| DVD drive       |   180 |
| CD drive        |    90 |
| Printer         |   270 |
| Toner cartridge |    66 |
| DVD burner      |   180 |
+-----------------+-------+
3. Select the name of the products with a price less than or equal to $200.

mysql> select name from products where price <=200;
+-----------------+
| name            |
+-----------------+
| Memory          |
| ZIP drive       |
| Floppy disk     |
| DVD drive       |
| CD drive        |
| Toner cartridge |
| DVD burner      |
+-----------------+
4. Select all the products with a price between $60 and $120.

mysql> select name from products where price between 60 and 200;
+-----------------+
| name            |
+-----------------+
| Memory          |
| ZIP drive       |
| DVD drive       |
| CD drive        |
| Toner cartridge |
| DVD burner      |
+-----------------+
5. Select the name and price in cents (i.e., the price must be multiplied by 100).

6. Compute the average price of all the products.
7. Compute the average price of all products with manufacturer code equal to 2.
8. Compute the number of products with a price larger than or equal to $180.
9. Select the name and price of all products with a price larger than or equal to $180, and sort first by price (in 	descending order), and then by name (in ascending order).
10. Select all the data from the products, including all the data for each product's manufacturer.
11. Select the product name, price, and manufacturer name of all the products.
12. Select the average price of each manufacturer's products, showing only the manufacturer's code.
13. Select the average price of each manufacturer's products, showing the manufacturer's name.
14. Select the names of manufacturer whose products have an average price larger than or equal to $150.
15. Select the name and price of the cheapest product.
16. Select the name of each manufacturer along with the name and price of its most expensive product.

===========================================================

mysql> select * from products;
+------+-----------------+-------+--------------+
| Code | Name            | Price | Manufacturer |
+------+-----------------+-------+--------------+
|    1 | Hard drive      |   240 |            5 |
|    2 | Memory          |   120 |            6 |
|    3 | ZIP drive       |   150 |            4 |
|    4 | Floppy disk     |     5 |            6 |
|    5 | Monitor         |   240 |            1 |
|    6 | DVD drive       |   180 |            2 |
|    7 | CD drive        |    90 |            2 |
|    8 | Printer         |   270 |            3 |
|    9 | Toner cartridge |    66 |            3 |
|   10 | DVD burner      |   180 |            2 |
+------+-----------------+-------+--------------+
10 rows in set (0.00 sec)

mysql> select * from manufacturers;
+------+-----------------+
| Code | Name            |
+------+-----------------+
|    1 | Sony            |
|    2 | Creative Labs   |
|    3 | Hewlett-Packard |
|    4 | Iomega          |
|    5 | Fujitsu         |
|    6 | Winchester      |
+------+-----------------+



1st higest salary

mysql> select max(Salary) as higest_salary from employees;
+---------------+
| higest_salary |
+---------------+
|        112000 |
+---------------+
1 row in set (0.00 sec)

2nd higest salary
mysql> select max(salary) as second_higest_salary from employees where salary<(select max(salary) from employees);
+----------------------+
| second_higest_salary |
+----------------------+
|                95000 |
+----------------------+
1 row in set (0.00 sec)

3rd higest salary

SELECT salary AS third_highest_salary
    -> FROM employees
    -> ORDER BY salary DESC
    -> LIMIT 1 OFFSET 2;
+----------------------+
| third_highest_salary |
+----------------------+
|                19000 |
+----------------------+
1 row in set (0.00 sec)

another way

mysql> select salary as hiesgt_salary from employees order by salary desc limit 2,1;
+---------------+
| hiesgt_salary |
+---------------+
|         19000 |
+---------------+
1 row in set (0.01 sec)


ORDER BY  DESC
mysql> SELECT * FROM employees ORDER BY salary DESC;
+------+--------------+--------+
| ID   | NAME         | SALARY |
+------+--------------+--------+
|   10 | michal Shaw  | 112000 |
|    7 | mical jobs   |  95000 |
|    8 | rock robest  |  19000 |
|    9 | david mark   |  18000 |
|    6 | Amanda Rock  |  17000 |
|    2 | Steve Madden |  15000 |
|    1 | Amanda Jones |  12000 |
|    5 | Luke Shaw    |  11000 |
|    3 | Robert Henry |  10000 |
|    4 | Shawn Adams  |  10000 |
+------+--------------+--------+
10 rows in set (0.00 sec)

order by ASC

sql> SELECT * FROM employees ORDER BY salary asc;
+------+--------------+--------+
| ID   | NAME         | SALARY |
+------+--------------+--------+
|    3 | Robert Henry |  10000 |
|    4 | Shawn Adams  |  10000 |
|    5 | Luke Shaw    |  11000 |
|    1 | Amanda Jones |  12000 |
|    2 | Steve Madden |  15000 |
|    6 | Amanda Rock  |  17000 |
|    9 | david mark   |  18000 |
|    8 | rock robest  |  19000 |
|    7 | mical jobs   |  95000 |
|   10 | michal Shaw  | 112000 |
+------+--------------+--------+
10 rows in set (0.01 sec)


//like operator start in 

mysql> select * from employees where salary like '9%';
+------+------------+--------+
| ID   | NAME       | SALARY |
+------+------------+--------+
|    7 | mical jobs |  95000 |
+------+------------+--------+
1 row in set (0.00 sec)

mysql> select * from employees where name like 's%';
+------+--------------+--------+
| ID   | NAME         | SALARY |
+------+--------------+--------+
|    2 | Steve Madden |  15000 |
|    4 | Shawn Adams  |  10000 |
+------+--------------+--------+



// like operator in anywhere 

mysql> select * from employees where name like '%s%';
+------+--------------+--------+
| ID   | NAME         | SALARY |
+------+--------------+--------+
|    1 | Amanda Jones |  12000 |
|    2 | Steve Madden |  15000 |
|    4 | Shawn Adams  |  10000 |
|    5 | Luke Shaw    |  11000 |
|    7 | mical jobs   |  95000 |
|    8 | rock robest  |  19000 |
|   10 | michal Shaw  | 112000 |
+------+--------------+--------+