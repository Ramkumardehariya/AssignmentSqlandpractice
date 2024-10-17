-- DDL QURUIES --
SELECT * FROM BOOKS;
-- 1. Add a new column to the books table: 
ALTER TABLE BOOKS ADD COLUMN LANGUAGE VARCHAR(10);

SELECT * FROM STAFF;
-- 2. Rename the position column in the staff table to job_title
ALTER TABLE STAFF RENAME TO JOB_TITLE;

SELECT * FROM JOB_TITLE;

SELECT * FROM MEMBERS;
-- 3. drop the email column from the members table:
ALTER TABLE MEMBERS DROP COLUMN EMAIL;







-- DML QUERIES
-- 1. Insert new data into the books table:
INSERT INTO AUTHOR (author_id, first_name, last_name, date_of_birth, nationality)
VALUES (101, 'Harper', 'Lee', '1926-04-28', 'American');

INSERT INTO BOOKS(BOOK_ID, TITLE, AUTHOR_ID, PUBLICATION_YEAR, GENRE, ISBN, AVAILABLE_COPIES)
       VALUES (1, 'To Kill a Mockingbird', 101, 1960, 'Fiction', '978-0-06-4', 5);
SELECT * FROM AUTHOR;
SELECT * FROM BOOKS;

-- 2. Update a member's contact number:
INSERT INTO members (MEMBER_ID, FIRST_NAME, LAST_NAME, DATE_OF_BIRTH, CONTACT_NUMBER, MEMBERSHIP_DATE)
VALUES (1, 'John', 'Doe', '1990-05-15', 9876543210, '2023-09-01');
SELECT * FROM MEMBERS;

UPDATE MEMBERS SET CONTACT_NUMBER = '7489629277' WHERE MEMBER_ID = 1;

-- 4. Insert a new loan record:
INSERT INTO loans (LOAN_ID, BOOK_ID, MEMBER_ID, LOAN_DATE, RETURN_DATE, ACTUAL_RETURN_DATE)
VALUES (1, 2, 2, '2024-10-01', '2024-10-15', NULL),
	   (2, 3, 3, '2024-10-05', '2024-10-20', NULL);
        
INSERT INTO books (book_id, title, author_id, publication_year, genre, isbn, available_copies)
VALUES (2, '1984', 102, '1991', 'Dystopian', '978-0-4', 4),
       (3, 'Pride and Prejudice', 103, '1919', 'Romance', '978-0-9', 2);

INSERT INTO members (MEMBER_ID, FIRST_NAME, LAST_NAME, DATE_OF_BIRTH, CONTACT_NUMBER, MEMBERSHIP_DATE)
VALUES (2, 'Alice', 'Smith', '1985-07-12', 1234567890, '2024-01-15'),
       (3, 'Bob', 'Johnson', '1992-03-25', 9876543210, '2024-05-10');

INSERT INTO author (author_id, first_name, last_name, date_of_birth, nationality)
VALUES (102, 'George', 'Orwell', '1903-06-25', 'British'),
       (103, 'Jane', 'Austen', '1775-12-16', 'British');
SELECT * FROM AUTHOR;
SELECT * FROM MEMBERS;
SELECT * FROM BOOKS;
SELECT * FROM LOANS;

-- 3. Delete a specific loan record:
DELETE FROM LOANS WHERE LOAN_ID = 1;





-- JOIN QURIES
-- Join Queries
/* 1. Retrieve all books along with their authors:
2. Find all books currently on loan along with member details:
3. List all books borrowed by a specific member:
4. Get the total number of books and the total available copies for each
genre:
5. Find all staff members who are librarians and their hire dates:
*/

-- 1. Retrieve all books along with their authors:
SELECT b.book_id, b.title, a.first_name AS author_first_name, a.last_name AS author_last_name
       FROM books b JOIN author a ON b.author_id = a.author_id;

-- 2. Find all books currently on loan along with member details:
SELECT b.book_id, b.title, m.member_id, m.first_name AS member_first_name, m.last_name AS member_last_name, l.loan_date, l.return_date
       FROM loans l JOIN books b ON l.book_id = b.book_id JOIN members m ON l.member_id = m.member_id WHERE l.actual_return_date IS NULL;


-- 3. List all books borrowed by a specific member:
SELECT b.book_id, b.title, b.publication_year, b.genre, l.loan_date, l.return_date, l.actual_return_date FROM loans l 
	 JOIN  books b ON l.book_id = b.book_id 
     JOIN members m ON l.member_id = m.member_id
     WHERE m.member_id = 1; 

-- 4. Get the total number of books and the total available copies for each genre:
SELECT genre, COUNT(book_id) AS total_books, SUM(available_copies) AS total_available_copies
       FROM books GROUP BY GENRE;
       
-- 5. Find all staff members who are librarians and their hire dates:
SELECT staff_id, first_name, last_name, hire_date FROM  staff WHERE POSITION = 'Librarian';
