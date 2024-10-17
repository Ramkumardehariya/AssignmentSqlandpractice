
/*create account table where should be id name and balance and must be id = primary key, name = unique, balance = greater than 1000 */
CREATE TABLE account(
	id INT PRIMARY KEY,
    name VARCHAR(255) UNIQUE,
    balance INT,
    CONSTRAINT acc_balance_chk CHECK(balance > 1000)
);

/*insert one data */
INSERT INTO account(id, name, balance)
VALUES (1, 'A', 10000);

/*insert again one data*/
INSERT INTO account(id, name, balance)
VALUES (2, 'B', 10000);

SELECT * FROM account;

/*delete the table account*/
DROP table account;

/*create account table where should be id name and balance and must be id = primary key, name = unique, balance = not null default with 0 */
CREATE TABLE account(
	id INT PRIMARY KEY,
    name VARCHAR(255) UNIQUE,
    balance INT NOT NULL DEFAULT 0
);

-- ADD
/*add one intrest columm*/
ALTER TABLE account ADD intrest INT NOT NULL DEFAULT 0;

-- MODIFY
/*modify that column should be float not null default 0*/
ALTER TABLE account MODIFY intrest FLOAT NOT NULL DEFAULT 0;

-- RENAME 
/*update the name of table account to account_details*/
ALTER TABLE ACCOUNT RENAME TO ACCOUNT_DETAILS;


DESC account;
SELECT * FROM ACCOUNT_DETAILS;



-- CHANGE COLOUMN 
/*update the column name intrest to saving intrest*/
ALTER TABLE ACCOUNT CHANGE COLUMN INTREST SAVING_INTREST FLOAT NOT NULL DEFAULT 0;

-- DROP COLUMN 
/*delete only saving intrest column*/
ALTER TABLE ACCOUNT DROP COLUMN SAVING_INTREST;


/*inserte only id and name*/
INSERT INTO account(id, name)
VALUES (2, 'B');
