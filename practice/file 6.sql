CREATE DATABASE JOINS;

USE JOINS;

CREATE TABLE Employee (
       id INT NOT NULL PRIMARY KEY,
       fname CHAR(25),
       lname CHAR(25),
       age char(2),
       emailID VARCHAR(255),
       PhoneNO INT(10),
       City CHAR(25)
);

INSERT INTO Employee
        VALUES(1,'Aman','Proto',32, 'aman@gmail.com',898,'Delhi'),
			  (2,'Yagya','Narayan',44, 'yagya@gmail.com',222,'Palam'),
              (3,'Rahul','BD',22, 'rahul@gmail.com',444,'Kolkata'),
              (4,'Jatin','Hermit',31, 'jatin@gmail.com',666,'Raipur'),
              (5,'PK','Pandey',21, 'pk@gmail.com',555,'Jaipur');


              
select * from employee;
Drop table employee;

CREATE TABLE CLIENTTABLE(
       id INT NOT NULL PRIMARY KEY,
       first_name CHAR(25),
       last_name CHAR(25),
       age char(2),
       emailID VARCHAR(255),
       PhoneNO INT(10),
       City CHAR(25),
       empID INT(25),
       FOREIGN KEY (empID) REFERENCES Employee(id)
);

INSERT INTO CLIENTTABLE
       VALUES (1,'Mac','Rogers',47,'mac@hotmail.com',333,'Kolkata',3),
              (2,'Max','Poirier',27,'max@hotmail.com',222,'Kolkata',3),
              (3,'Peter','Jain',24,'peter@hotmail.com',111,'Delhi',1),
              (4,'Sushant','Aggarwal',23,'sushant@hotmail.com',45454,'Hyderabad',5),
              (5,'Pratap','Singh',36,'pratap@hotmail.com',77767,'Mumbai',2);
              
select * from clienttable;
drop table clienttable;

CREATE TABLE Project (
       id INT NOT NULL PRIMARY KEY,
       empID INT(10),
       name CHAR(25),
       satartdate CHAR(25),
       clintID VARCHAR(255),
       FOREIGN KEY (empID) REFERENCES EMPLOYEE(id)
);

INSERT INTO Project 
	   VALUES (1,1,'A','2021-04-21',3),
              (2,2,'B','2021-03-12',1),
              (3,3,'C','2021-01-16',5),
              (4,3,'D','2021-04-27',2),
              (5,5,'E','2021-05-01',4);

select * from Project;
drop table project;


-- INNER JOIN
SELECT e.id, e.fname, e.lname, p.id, p.name from Employee as e INNER JOIN Project as p ON e.id = p.empID;
SELECT * from Employee as e INNER JOIN Project as p ON e.id = p.empID;
SELECT e.id, e.fname, e.lname, p.id, p.name from Employee as e , Project as p WHERE e.id = p.empID;

-- Fetch our all the employee Id`s and eheir contact detail who have been working 
-- from jaipur with clients name working in Hyderabad.alter
SELECT e.id, e.emailID, e.phoneNO, c.last_name from Employee as e INNER JOIN
Clienttable as c ON e.id = c.empID WHERE e.city = 'Jaipur' AND c.city = 'Hyderabad';

-- LEFT JOIN
-- Fetch our each project allocated to each employee.
SELECT * FROM  Employee as e LEFT JOIN Project as p ON e.id = p.empID;


-- Right join
-- List out all the projects along with employee`s name and their respective allocated email ID.
SELECT p.id, p.name , e.fname,e.lname, e.emailId from Employee as e RIGHT JOIN Project as p ON e.id = p.empID;


-- CROSS JOIN 
-- List out all the combinations possible for the employee`s name and projects that can exist.
SELECT e.fname,e.lname, p.id, p.name from employee as e CROSS JOIN Project as p;


INSERT INTO Employee
        VALUES(6,'Amar','singh',18, 'amar@gmail.com',200,'itarsi'),
			  (7,'ayush','singh',20, 'ayush@gmail.com',500,'jabalpur');


CREATE TABLE DEPT1(
       empid INT,
       name varchar(10),
       role varchar(10),
       FOREIGN KEY (empid) REFERENCES Employee(id)
);

INSERT INTO DEPT1
       VALUES (1,'A','engineer'),
              (2,'B','salesman'),
              (3,'C','manager'),
              (4,'D','salesman'),
              (5,'E','engineer');
              
SELECT * from dept1;
drop table dept1;
              
CREATE TABLE DEPT2(
       empid INT,
       name varchar(10),
       role varchar(10),
       FOREIGN KEY (empid) REFERENCES Employee(id)
);

INSERT INTO DEPT2
       VALUES (3,'C','manager'),
              (6,'F','marketing'),
              (7,'G','salesman');
              
SELECT * FROM DEPT2;
DROP TABLE DEPT2;

-- SET OPERATIONS
-- List out all the employee in the comany
SELECT * FROM DEPT1 UNION SELECT * FROM DEPT2;

-- LIST all the employees in all department who work as salesman
SELECT * FROM DEPT1 WHERE role = 'salesman' UNION SELECT * FROM DEPT2 WHERE role = 'salesman';

-- INTERSECT
-- LIST out all the employees who work for both the departmen
SELECT dept1.* FROM DEPT1 INNER JOIN DEPT2 using(empid);

-- MINUS
-- List out all the employees working in dept1 but not in dept2
SELECT DEPT1.* FROM DEPT1 LEFT JOIN DEPT2 using(empid) WHERE DEPT2.empid IS NULL;

-- SUB QUERIES
-- WHERE clause same table
-- employee with age > 30
SELECT * FROM Employee WHERE age IN(SELECT age FROM Employee WHERE age > 30);

-- WHERE cluse different table 
-- employee details working in more than 1 project.
SELECT * FROM Employee WHERE id IN(SELECT empId FROM Project group by empId having count(empId) > 1);

-- single value subquerry
-- emp details having age > avg(age)
SELECT * FROM Employee WHERE age > (SELECT avg(age) FROM Employee);

-- FROM CLAUSE
-- Select max age person whose first name has 'a'
SELECT max(age) FROM (SELECT * from Employee WHERE fname LIKE '%a%') AS temp;

-- CORELATED Subqueries 
-- FIND 3rd oldest employee 
SELECT * FROM Employee as e1 WHERE 3 = (SELECT count(age) FROM Employee as e2 WHERE e2.age >= e1.age);

-- VIEW 
SELECT * FROM Employee;

-- creating a view
CREATE VIEW custom_view AS SELECT fname, lname FROM Employee;

-- VIEWING FROM VIEW
SELECT * FROM custom_view;

-- ALTERING THE VIEW
ALTER VIEW custom_view AS SELECT fname, lname,age FROM Employee;

-- DROPING THE VIEW 
DROP VIEW IF EXISTS custom_view;