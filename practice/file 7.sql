USE ORG;
SELECT  * FROM Worker;
SELECT * FROM Bonus;
SELECT * FROM Title;

-- Q-1. Write an SQL query to fetch “FIRST_NAME” from Worker table using the alias name as <WORKER_NAME>.
SELECT FIRST_NAME AS WORKER_NAME FROM worker;

-- Q-2. Write an SQL query to fetch “FIRST_NAME” from Worker table in upper case.
SELECT UPPER(first_name) FROM Worker;

-- Q-3. Write an SQL query to fetch unique values of DEPARTMENT from Worker table.
SELECT DISTINCT Department FROM Worker;
SELECT Department FROM Worker GROUP BY department;

-- Q-4. Write an SQL query to print the first three characters of  FIRST_NAME from Worker table.
SELECT substring(first_name, 1, 3) FROM Worker;

-- Q-5. Write an SQL query to find the position of the alphabet (‘b’) in the first name column ‘Amitabh’ from Worker table.
SELECT instr(first_name, 'b') FROM Worker WHERE First_name = 'Amitabh';

-- Q-6. Write an SQL query to print the FIRST_NAME from Worker table after removing white spaces from the right side.
SELECT RTRIM(first_name) FROM Worker;

-- Q-7. Write an SQL query to print the DEPARTMENT from Worker table after removing white spaces from the left side.
SELECT LTRIM(first_name) FROM Worker;

-- Q-8. Write an SQL query that fetches the unique values of DEPARTMENT from Worker table and prints its length.
SELECT distinct department, LENGTH(department) FROM worker;

-- Q-9. Write an SQL query to print the FIRST_NAME from Worker table after replacing ‘a’ with ‘A’.
SELECT REPLACE(first_name, 'a', 'A') FROM Worker;

-- Q-10. Write an SQL query to print the FIRST_NAME and LAST_NAME from Worker table into a single column COMPLETE_NAME.
-- A space char should separate them.
SELECT CONCAT(first_name, ' ', last_name) AS Complete_name FROM Worker;

-- Q-11. Write an SQL query to print all Worker details from the Worker table order by FIRST_NAME Ascending.
SELECT * FROM Worker ORDER BY first_name;

-- Q-12. Write an SQL query to print all Worker details from the Worker table order by 
-- FIRST_NAME Ascending and DEPARTMENT Descending.
SELECT * FROM Worker ORDER BY first_name, department DESC;

-- Q-13. Write an SQL query to print details for Workers with the first name as “Vipul” and “Satish” from Worker table.
SELECT * FROM Worker WHERE first_name IN('vipul' , 'Satish');

-- Q-14. Write an SQL query to print details of workers excluding first names, “Vipul” and “Satish” from Worker table.
SELECT * FROM Worker WHERE first_name NOT IN('vipul' , 'Satish');

-- Q-15. Write an SQL query to print details of Workers with DEPARTMENT name as “Admin*”.
SELECT * FROM Worker WHERE department LIKE 'Admin%';

-- Q-16. Write an SQL query to print details of the Workers whose FIRST_NAME contains ‘a’.
SELECT * FROM Worker WHERE first_name LIKE '%a%';

-- Q-17. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘a’.
SELECT * FROM Worker WHERE first_name LIKE '%a';

-- Q-18. Write an SQL query to print details of the Workers whose FIRST_NAME ends with ‘h’ and contains six alphabets.
SELECT * FROM Worker WHERE first_name LIKE '_____h';

-- Q-19. Write an SQL query to print details of the Workers whose SALARY lies between 100000 and 500000.
SELECT * FROM Worker WHERE salary BETWEEN 100000 AND 500000;

-- Q-20. Write an SQL query to print details of the Workers who have joined in Feb’2014.
SELECT * FROM Worker WHERE YEAR(joining_date) = 2014 AND MONTH(joining_date) = 02;

-- Q-21. Write an SQL query to fetch the count of employees working in the department ‘Admin’.
SELECT department, count(*) FROM Worker where department = 'Admin';

-- Q-22. Write an SQL query to fetch worker full names with salaries >= 50000 and <= 100000.
SELECT CONCAT(first_name, ' ', last_name) AS fullName FROM Worker WHERE salary >= 50000 AND salary <= 100000;

-- Q-23. Write an SQL query to fetch the no. of workers for each department in the descending order.
SELECT distinct department, count(worker_id) AS No_of_worker FROM Worker group by department order by no_of_worker desc;

-- Q-24. Write an SQL query to print details of the Workers who are also Managers.
SELECT w.* FROM Worker AS w INNER JOIN Title AS t ON worker_id = worker_ref_id WHERE worker_title = 'Manager';

-- Q-25. Write an SQL query to fetch number (more than 1) of same titles in the ORG of different types.
SELECT worker_title, COUNT(*) AS count FROM title GROUP BY worker_title having count > 1;

-- Q-26. Write an SQL query to show only odd rows from a table.
-- select * from worker where MOD (WORKER_ID, 2) != 0; 
SELECT * FROM Worker where MOD(Worker_id,2) <> 0;

-- Q-27. Write an SQL query to show only even rows from a table. 
SELECT * FROM Worker where MOD(Worker_id,2) = 0;

-- Q-28. Write an SQL query to clone a new table from another table.
CREATE TABLE worker_clone LIKE worker;
INSERT INTO worker_clone SELECT * FROM worker;
SELECT * FROM Worker_clone;
DROP TABLE worker_clone;

-- Q-29. Write an SQL query to fetch intersecting records of two tables.
SELECT worker.* FROM worker INNER JOIN worker_clone using(worker_id);

-- Q-30. Write an SQL query to show records from one table that another table does not have.
-- MINUS
SELECT worker.* FROM worker LEFT JOIN worker_clone using(worker_id) WHERE worker_clone.worker_id is NULL;

-- Q-31. Write an SQL query to show the current date and time.
-- DUAL
SELECT current_date();
select now();

-- Q-32. Write an SQL query to show the top n (say 5) records of a table order by descending salary.
SELECT * FROM Worker ORDER BY salary desc LIMIT 5;

-- Q-33. Write an SQL query to determine the nth (say n=5) highest salary from a table.
SELECT * FROM Worker ORDER BY salary desc LIMIT 4,1;

-- Q-34. Write an SQL query to determine the 5th highest salary without using LIMIT keyword.
SELECT * FROM Worker AS W1 WHERE 4  = ( SELECT COUNT( DISTINCT(w2.SALARY)) FROM Worker AS w2 WHERE w2.salary >= w1.salary );
 
-- Q-35. Write an SQL query to fetch the list of employees with the same salary.
SELECT * FROM worker w1, worker w2 WHERE W1.salary = w2.salary AND w1.worker_id != w2.worker_id;

-- Q-36. Write an SQL query to show the second highest salary from a table using sub-query.
SELECT max(salary) FROM Worker WHERE salary not in (SELECT max(salary) FROM Worker);

-- Q-37. Write an SQL query to show one row twice in results from a table.
SELECT * FROM Worker 
UNION ALL 
SELECT * FROM WORKER ORDER BY worker_id;

-- Q-38. Write an SQL query to list worker_id who does not get bonus.
SELECT * FROM Worker WHERE worker_id NOT IN(SELECT worker_ref_id FROM Bonus);

-- Q-39. Write an SQL query to fetch the first 50% records from a table.
SELECT * FROM Worker WHERE Worker_id <= (SELECT count(worker_id)/2 FROM Worker);

-- Q-40. Write an SQL query to fetch the departments that have less than 4 people in it.
SELECT distinct department, count(department) as depCount FROM Worker GROUP BY department having depCount < 4;

-- Q-41. Write an SQL query to show all departments along with the number of people in there.
SELECT Department , count(*) FROM Worker GROUP BY department;

-- Q-42. Write an SQL query to show the last record from a table.
SELECT * FROM Worker WHERE worker_id = (SELECT MAX(worker_id) FROM Worker);

-- Q-43. Write an SQL query to fetch the first row of a table.
SELECT * FROM Worker WHERE worker_id = (SELECT MIN(worker_id) FROM Worker);

-- Q-44. Write an SQL query to fetch the last five records from a table.
(SELECT * FROM worker ORDER BY worker_id DESC LIMIT 5) ORDER BY worker_id;

-- Q-45. Write an SQL query to print the name of employees having the highest salary in each department.
SELECT w.department, w.first_name, w.salary FROM (SELECT MAX(salary) as maxsal,department FROM Worker GROUP BY Department) temp 
inner join worker w on temp.department = w.department AND temp.maxsal = w.salary;

-- Q-46. Write an SQL query to fetch three max salaries from a table using co-related subquery
SELECT distinct salary from worker w1 WHERE 3 >= (SELECT count(distinct salary) from worker w2 WHERE w1.salary <= w2.salary) order by w1.salary desc;

SELECT distinct salary FROM worker ORDER BY salary desc LIMIT 3;
-- Q-47. Write an SQL query to fetch three min salaries from a table using co-related subquery
SELECT distinct salary from worker w1 WHERE 3 >= (SELECT count(distinct salary) from worker w2 WHERE w1.salary >= w2.salary) order by w1.salary desc;

-- Q-48. Write an SQL query to fetch nth max salaries from a table.
SELECT distinct salary from worker w1 WHERE n >= (SELECT count(distinct salary) from worker w2 WHERE w1.salary >= w2.salary) order by w1.salary desc;

-- Q-49. Write an SQL query to fetch departments along with the total salaries paid for each of them.
select department , sum(salary) as depSal from worker group by department order by depSal desc;

-- Q-50. Write an SQL query to fetch the names of workers who earn the highest salary.
select first_name, salary from worker where salary = (select max(Salary) from worker);
