
/*print the worker table */
SELECT * FROM WORKER;

/*print only name and salary from worker table */
SELECT FIRST_NAME,SALARY FROM Worker;

/*print the name in uppercase*/
SELECT ucase('ramkumar');

/*print the name in lower case letter*/
SELECT lcase('RAMKUMAR');

/*perform add int data*/
SELECT 44+12;

/*print the current time*/
SELECT now();


select * from worker;

/*print the data who have salary greater than 80000*/
SELECT * FROM worker WHERE SALARY > 80000;

/*print the data only hr department*/
SELECT * FROM worker WHERE DEPARTMENT = 'HR';

/*print the worker where salary must between 80000 and 300000*/
SELECT * FROM worker WHERE SALARY BETWEEN 80000 AND 300000;

/*print the data worker only hr and admin department*/
SELECT * FROM worker WHERE DEPARTMENT = 'HR' OR DEPARTMENT = 'Admin';

/*print only hr department data using IN*/
SELECT * FROM worker WHERE DEPARTMENT IN('HR');

/*print that data who dont have in hr and account department */
SELECT * FROM worker WHERE DEPARTMENT NOT IN('HR','Account');

/*print that data who is not assignd any department*/
SELECT * FROM worker WHERE DEPARTMENT IS NULL;

/*print the data where first name contains the "e"*/
SELECT * FROM worker WHERE FIRST_NAME LIKE '%e%';

/*sorting the worker according to salary in ascending order*/
SELECT * FROM worker ORDER BY SALARY ASC;

/*print the department name only */
SELECT DISTINCT DEPARTMENT FROM WORKER;

/*print the department name only*/
SELECT DEPARTMENT FROM WORKER GROUP BY DEPARTMENT;

/*print the department and count department*/
SELECT DEPARTMENT,COUNT(DEPARTMENT) FROM WORKER GROUP BY DEPARTMENT;

/*print every deprtment with average salary*/
SELECT DEPARTMENT,AVG(SALARY) FROM WORKER GROUP BY DEPARTMENT;

/*print the department with minimum salary*/
SELECT DEPARTMENT,MIN(SALARY) FROM WORKER GROUP BY DEPARTMENT;

/*print the department with max salary*/
SELECT DEPARTMENT,MAX(SALARY) FROM WORKER GROUP BY DEPARTMENT;

/*print the department with sum salary*/
SELECT DEPARTMENT,SUM(SALARY) FROM WORKER GROUP BY DEPARTMENT;





