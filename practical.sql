CREATE DATABASE IF NOT EXISTS Practicle_;

USE Practicle_;

CREATE TABLE IF NOT EXISTS Employee (
Eid INT PRIMARY KEY,
Ename VARCHAR(50),
Age INT NOT NULL,
Salary INT NOT NULL,
Address VARCHAR(70)
);

INSERT INTO Employee VALUES ( 101,"Hari Aryal",20,30000,"kalanki");
INSERT INTO Employee VALUES ( 102,"Dipesh Giri",22,40000,"sorahakhutte");
INSERT INTO Employee VALUES ( 103,"Manzil Gautam",24,26000,"tripureshor");
INSERT INTO Employee VALUES ( 104,"Prabesh Aryal",22,56000,"lolang");
INSERT INTO Employee VALUES ( 105,"Basnet Sameer",20,60000,"ktm");
INSERT INTO Employee VALUES ( 106,"Bishal Acharya",30,25000,"lainchaur");
INSERT INTO Employee VALUES ( 107,"Hari Khatri",50,32000,"thamel");

UPDATE practicle_.Employee SET Address = 'kalanki' WHERE (Eid = '106');

# lab1

SELECT Ename,Salary FROM Employee WHERE Address = "kalanki";

#lab2

SELECT *FROM Employee;

#lab3

SELECT Eid, Ename, Address FROM Employee; 

#lab4


SELECT Eid, Ename, Age FROM Employee ORDER BY Ename ASC;
SELECT Eid, Ename, Age,Salary FROM Employee ORDER BY Age ASC, Salary DESC;

#lab5

SELECT 18 + 5;
SELECT 18 - 3;
SELECT 18 * 9;
SELECT 18 / 7;
SELECT 18 % 5;

#lab6

SELECT 4 + 15 / 3;
SELECT (4 + 15) / 3;

#lab7

SELECT MAX(Employee.Salary) as Max_Salary, MIN(Employee.Salary) as Min_Salary FROM Employee;

#lab8

SELECT Address, COUNT(Eid)as "No. of Employees" 
FROM Employee 
GROUP BY Address;

#lab9

SELECT Address, COUNT(Eid)as "No. of Employees" 
FROM Employee 
GROUP BY Address
HAVING COUNT(Eid) > 1;

#lab10

CREATE TABLE IF NOT EXISTS Person (
Pid INT PRIMARY KEY,
Lastname VARCHAR(25),
Firstname VARCHAR(25),
Address VARCHAR(50),
City VARCHAR(50)
);

INSERT INTO practicle_.Person (Pid, Lastname, Firstname, Address, City) VALUES ('1', 'Aryal ', 'Hari', 'Kalanki', 'ktm');
INSERT INTO practicle_.Person (Pid, Lastname, Firstname, Address, City) VALUES ('2 ', 'NULL', 'Prabesh', 'lolang', 'ktm');
INSERT INTO practicle_.Person (Pid, Lastname, Firstname, Address, City) VALUES ('3', 'Basnet', 'Sameer', 'sanotimi', 'bhaktapur');
INSERT INTO practicle_.Person (Pid, Lastname, Firstname, Address, City) VALUES ('5', 'Giri', 'Dipesh ', 'sorakhutta', 'Lalitpur');


SELECT *FROM Person;
SELECT *FROM Person 
WHERE Lastname IS NULL;

#lab11

SELECT Ename as Employee_Name
FROM Employee
WHERE Salary > 35000;

#lab12

SELECT Ename || Eid as Emp_details
FROM Employee;

#lab13

SELECT * FROM Person WHERE Address = 'sorakhutta';

#lab14

CREATE TABLE Exam (
Name VARCHAR(50),
Age INT NOT NULL,
City VARCHAR(50)
);

INSERT INTO Exam VALUES ("Hari", 31, "Kathmandu");
INSERT INTO Exam VALUES ("prabesh", 21, "Kathmandu");
INSERT INTO Exam VALUES ("dipesh", 55, "Ktm");
INSERT INTO Exam VALUES ("basnet", 20, "Kathmandu");

SELECT *FROM Exam;
SELECT DISTINCT *FROM  Exam;


#lab15

DESCRIBE Employee;
DESCRIBE Person;

#lab 16
SELECT *FROM Employee
WHERE Salary BETWEEN 30000 AND 50000;


#lab17

SELECT Ename,Age,Address FROM Employee WHERE Address IN ('kalanki','lolang');

#lab18

SELECT Eid , Ename FROM Employee WHERE Ename LIKE 'B%';

#lab 19

SELECT *FROM Employee WHERE Age <25 AND Salary >=30000;

#lab20

SELECT *FROM Employee WHERE Age <25 OR Salary >=30000;

#lab 21

SELECT *FROM Employee
WHERE NOT Address = "kalanki";

#lab22

SELECT *FROM Employee
WHERE Salary =( SELECT MAX(Salary) FROM Employee );

SELECT Ename
FROM Employee WHERE Address IN (SELECT Address
FROM Employee
WHERE Address = "kalanki");

#lab23

CREATE TABLE customers(
customer_id INT PRIMARY KEY,
customer_name VARCHAR(50),
Address VARCHAR(50),
City VARCHAR(25),
Postal_code INT 
);

CREATE TABLE orders (
orderid INT PRIMARY KEY,
customer_id INT,
order_status VARCHAR(10) NOT NULL,
FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

select *from orders;

SELECT *FROM customers CROSS JOIN orders ;

#lab24

SELECT *FROM customers NATURAL JOIN orders ;


#lab25

SELECT *FROM customers INNER JOIN orders USING (customer_id) ;

#lab26

SELECT c.customer_id,c.customer_name,c.city,o.orderid,o.order_status
FROM customers c INNER JOIN orders o
ON c.customer_id = o.customer_id
ORDER BY o.orderid;

#lab27

SELECT *FROM customers c LEFT OUTER JOIN orders o 
ON c.customer_id = o.customer_id
ORDER BY o.orderid;

#lab28

SELECT  *FROM customers c RIGHT OUTER JOIN orders o
ON c.customer_id = o.customer_id
ORDER BY o.orderid;


#lab29

SELECT  *FROM customers c LEFT OUTER JOIN orders o
ON c.customer_id = o.customer_id
UNION
SELECT  *FROM customers c RIGHT OUTER JOIN orders o
ON c.customer_id = o.customer_id;



#lab30
#Illustration of Creating Table with Enforcement of Integrity Constraints
#PRIMARY KEY, NOT NULL, UNIQUE, CHECK, REFERENTIAL INTEGRITY. 

CREATE TABLE POST (
Post_code INT PRIMARY KEY,
Post VARCHAR(20) NOT NULL ,
Email VARCHAR(25) UNIQUE KEY,
FullTime BOOLEAN NOT NULL,
Eid INT ,
CHECK ( FullTime = true ), 
FOREIGN KEY (Eid) REFERENCES Employee(Eid)
);

DESCRIBE POST;

drop table post;
INSERT INTO POST VALUES ( 779,"CMO","kslfdkj@gmail.com",true,107);
SELECT *FROM post;


