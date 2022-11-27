mysql> CREATE TABLE contacts (
    ->     id INT PRIMARY KEY AUTO_INCREMENT,
    ->     first_name VARCHAR(50) NOT NULL,
    ->     last_name VARCHAR(50) NOT NULL,
    ->     email VARCHAR(255) NOT NULL
    -> );




mysql> desc contacts;
+------------+--------------+------+-----+---------+----------------+
| Field      | Type         | Null | Key | Default | Extra          |
+------------+--------------+------+-----+---------+----------------+
| id         | int          | NO   | PRI | NULL    | auto_increment |
| first_name | varchar(50)  | NO   |     | NULL    |                |
| last_name  | varchar(50)  | NO   |     | NULL    |                |
| email      | varchar(255) | NO   |     | NULL    |                |
+------------+--------------+------+-----+---------+----------------+


mysql> select * from contacts;
+----+------------+-----------------+---------------------------------+
| id | first_name | last_name       | email                           |
+----+------------+-----------------+---------------------------------+
|  1 | Carine     | Schmitt         | carine.schmitt@verizon.net      |
|  2 | Jean       | King            | jean.king@me.com                |
|  3 | Peter      | Ferguson        | peter.ferguson@google.com       |
|  4 | Janine     | Labrune         | janine.labrune@aol.com          |
|  5 | Jonas      | Bergulfsen      | jonas.bergulfsen@mac.com        |
|  6 | Janine     | Labrune         | janine.labrune@aol.com          |
|  7 | Susan      | Nelson          | susan.nelson@comcast.net        |
|  8 | Zbyszek    | Piestrzeniewicz | zbyszek.piestrzeniewicz@att.net |
|  9 | Roland     | Keitel          | roland.keitel@yahoo.com         |
| 10 | Julie      | Murphy          | julie.murphy@yahoo.com          |
| 11 | Kwai       | Lee             | kwai.lee@google.com             |
| 12 | Jean       | King            | jean.king@me.com                |
| 13 | Susan      | Nelson          | susan.nelson@comcast.net        |
| 14 | Roland     | Keitel          | roland.keitel@yahoo.com         |
+----+------------+-----------------+---------------------------------+



// ORDER by email



 SELECT * FROM contacts ORDER BY email;
+----+------------+-----------------+---------------------------------+
| id | first_name | last_name       | email                           |
+----+------------+-----------------+---------------------------------+
|  1 | Carine     | Schmitt         | carine.schmitt@verizon.net      |
|  4 | Janine     | Labrune         | janine.labrune@aol.com          |
|  6 | Janine     | Labrune         | janine.labrune@aol.com          |
|  2 | Jean       | King            | jean.king@me.com                |
| 12 | Jean       | King            | jean.king@me.com                |
|  5 | Jonas      | Bergulfsen      | jonas.bergulfsen@mac.com        |
| 10 | Julie      | Murphy          | julie.murphy@yahoo.com          |
| 11 | Kwai       | Lee             | kwai.lee@google.com             |
|  3 | Peter      | Ferguson        | peter.ferguson@google.com       |
|  9 | Roland     | Keitel          | roland.keitel@yahoo.com         |
| 14 | Roland     | Keitel          | roland.keitel@yahoo.com         |
|  7 | Susan      | Nelson          | susan.nelson@comcast.net        |
| 13 | Susan      | Nelson          | susan.nelson@comcast.net        |
|  8 | Zbyszek    | Piestrzeniewicz | zbyszek.piestrzeniewicz@att.net |
+----+------------+-----------------+---------------------------------+



//find duplicate and COUNT all email

// SELECT email, COUNT(email) FROM contacts GROUP BY email HAVING  COUNT(email) > 1;



mysql> SELECT email, COUNT(email) FROM contacts GROUP BY email HAVING  COUNT(email) > 1;
+--------------------------+--------------+
| email                    | COUNT(email) |
+--------------------------+--------------+
| jean.king@me.com         |            2 |
| janine.labrune@aol.com   |            2 |
| susan.nelson@comcast.net |            2 |
| roland.keitel@yahoo.com  |            2 |
+--------------------------+--------------+


//find duplicate by first_name and count all


//  SELECT first_name, COUNT(first_name) FROM contacts GROUP BY first_name HAVING  COUNT(first_name) > 1;


  SELECT first_name, COUNT(first_name) FROM contacts GROUP BY first_name HAVING  COUNT(first_name) > 1;
+------------+-------------------+
| first_name | COUNT(first_name) |
+------------+-------------------+
| Jean       |                 2 |
| Janine     |                 2 |
| Susan      |                 2 |
| Roland     |                 2 |
+------------+-------------------+


// find duplicate by last_name an COUNT all


mysql>     SELECT last_name, COUNT(last_name) FROM contacts GROUP BY last_name HAVING  COUNT(last_name) > 1;
+-----------+------------------+
| last_name | COUNT(last_name) |
+-----------+------------------+
| King      |                2 |
| Labrune   |                2 |
| Nelson    |                2 |
| Keitel    |                2 |
+-----------+------------------+



//find the all duplicate on multiple record and row


mysql> SELECT first_name, COUNT(first_name),
    ->     last_name, COUNT(last_name),
    ->     email, COUNT(email) FROM contacts GROUP BY
    ->     first_name,
    ->     last_name,
    ->     email HAVING
    ->      COUNT(first_name) > 1
    ->      AND COUNT(last_name) > 1
    ->      AND COUNT(email) > 1;
+------------+-------------------+-----------+------------------+--------------------------+--------------+
| first_name | COUNT(first_name) | last_name | COUNT(last_name) | email                    | COUNT(email) |
+------------+-------------------+-----------+------------------+--------------------------+--------------+
| Jean       |                 2 | King      |                2 | jean.king@me.com         |            2 |
| Janine     |                 2 | Labrune   |                2 | janine.labrune@aol.com   |            2 |
| Susan      |                 2 | Nelson    |                2 | susan.nelson@comcast.net |            2 |
| Roland     |                 2 | Keitel    |                2 | roland.keitel@yahoo.com  |            2 |
+------------+-------------------+-----------+------------------+--------------------------+--------------+



// delete all the duplicate and all multiple row


mysql>  delete t1 from contacts t1 inner join contacts t2 WHERE
    ->         t1.id < t2.id and
    ->         t1.first_name = t2.first_name AND
    ->         t1.last_name = t2.last_name and
    ->         t1.email = t2.email;
Query OK, 4 rows affected (0.01 sec)

mysql> select * from constacts;
ERROR 1146 (42S02): Table 'practice.constacts' doesn't exist
mysql> select * from contacts;
+----+------------+-----------------+---------------------------------+
| id | first_name | last_name       | email                           |
+----+------------+-----------------+---------------------------------+
|  1 | Carine     | Schmitt         | carine.schmitt@verizon.net      |
|  3 | Peter      | Ferguson        | peter.ferguson@google.com       |
|  5 | Jonas      | Bergulfsen      | jonas.bergulfsen@mac.com        |
|  6 | Janine     | Labrune         | janine.labrune@aol.com          |
|  8 | Zbyszek    | Piestrzeniewicz | zbyszek.piestrzeniewicz@att.net |
| 10 | Julie      | Murphy          | julie.murphy@yahoo.com          |
| 11 | Kwai       | Lee             | kwai.lee@google.com             |
| 12 | Jean       | King            | jean.king@me.com                |
| 13 | Susan      | Nelson          | susan.nelson@comcast.net        |
| 14 | Roland     | Keitel          | roland.keitel@yahoo.com         |
+----+------------+-----------------+---------------------------------+
