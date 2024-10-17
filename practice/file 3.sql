CREATE DATABASE temp;
USE temp;

CREATE TABLE Customer(
	id integer PRIMARY KEY,
	cname varchar(225),
	Address varchar(225),
	Gender char(2),
	City varchar(225),
	Pincode integer
);

SELECT * FROM CUSTOMER;
drop table customer;

/* insert a one tuple in customer table */
INSERT INTO CUSTOMER(ID, CNAME, ADDRESS, GENDER, CITY, PINCODE)
       VALUES(1251, 'RAMKUMAR', 'RANJHI', 'M', 'JABALPUR', '4489441');

/* insert only id and name */
INSERT INTO CUSTOMER(ID, CNAME) VALUES(1234, 'SHRI RAM');

/* update a data address and gender where id == 1234 */
UPDATE customer SET address ='payli', Gender = 'M', Pincode='443438' WHERE id = 1234;

/* write a sql safe update = 0 */
SET SQL_SAFE_UPDATES = 0;

/* update all customer pincode only */
UPDATE CUSTOMER SET Pincode = 480441;

/* delete customer where id = 1234 */
DELETE FROM Customer WHERE id = 1234;

DELETE FROM Customer;

/* insert multiple data in customer table */
INSERT INTO Customer
VALUES (1245,'Ram Kumar', 'Dilbagh Nagar', 'M','Jalandhar', 144002),
       (1300,'Shyam Singh', 'Ludhiana H.O', 'M','Ludhiana', 141001),
       (245,'Neelabh Shukla', 'Ashok Nagar', 'M','Jalandhar', 144003),
       (210,'Barkha Singh', 'Dilbagh Nagar', 'F','Jalandhar', 144002),
       (500,'Rohan Arora', 'Ludhiana H.O', 'M','Ludhiana', 141001);
	
/* update a data where id = 211 ,  name and gender or if not present then add automatically */
REPLACE INTO Customer(id,cname,Gender)
        Values(211, 'Rameshwar', 'M');
/* update a data where id = 1252 and name if not present then add automatically */
REPLACE INTO Customer(id, cname)
        VALUES(1252, 'Ram Mehra');
        
/* UPDATE WHERE ID = 1300 and address if not present then add*/
REPLACE INTO Customer SET id = 1300, address = 'chhindwara';

/*update id , name  and address where id == 1234*/
REPLACE INTO Customer(id, cname, Address)
         select id, cname, address From Customer WHERE id = 1245;
        
select * from customer;

/*insert one more data */
INSERT INTO Customer
       VALUES (1252,'Ram Kumar3', 'Dilbagh Nagar', 'M','Jalandhar', 144002);

/*create a order details table */
CREATE TABLE Order_details(
       Order_id integer,
       delivery_date DATE,
       cust_id INT,
       FOREIGN KEY(cust_id) references Customer(id) ON DELETE SET NULL
);

/* insert one tuple in order details*/
INSERT INTO Order_details
VALUES (1, '2019-03-11', 1252);

/*insert one tuple in order details*/
INSERT INTO Order_details
VALUES (2, '2019-03-12', 1252);

select * from customer;
select * from order_details;
DELETE FROM Customer WHERE id = 1252;

/*delete order_details table*/
DROP TABLE order_details;

/*create student table where name and id only*/
CREATE TABLE student (
id INT PRIMARY KEY,
name VARCHAR(255)
);

/*insert one data*/
INSERT INTO student Values( 1 , 'Ankit');
SELECT * FROM student;