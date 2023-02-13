CREATE TABLE books (
 book_id int PRIMARY KEY,  
 title varchar(20),  
 author_last_name varchar(20),  
 author_first_name varchar(20), 
 rating char(1),
 CHECK (rating IN ('1', '2', '3'))
);

CREATE TABLE patrons (
 patron_id int,  
 last_name varchar(20),  
 first_name varchar(20), 
 street_address varchar(30), 
 city varchar(10), 
 zip char(7),
 PRIMARY KEY (patron_id)
);

CREATE TABLE transactions (
 transaction_id int, 
 patron_id int, 
 book_id int, 
 transaction_date date, 
 transaction_type char(1),
 PRIMARY KEY (transaction_id),
 FOREIGN KEY (patron_id) REFERENCES patrons (patron_id),
 FOREIGN KEY (book_id) REFERENCES books (book_id)
);




CREATE SEQUENCE customers_seq
  START WITH 1
  INCREMENT BY 1
  NOCACHE;



INSERT INTO books (book_id, title, author_last_name, author_first_name, rating)
VALUES (customers_seq.NEXTVAL, 'Eat The Frog', 'Tony', 'Robbins', '1');

INSERT INTO books (book_id, title, author_last_name, author_first_name, rating)
VALUES (customers_seq.NEXTVAL, 'Databases principles', 'Oracle', 'coop', '2');

INSERT INTO transactions (transaction_id, patron_id, book_id, transaction_date, transaction_type)
VALUES (customers_seq.NEXTVAL, customers_seq.NEXTVAL, customers_seq.NEXTVAL, SYSDATE, '1');


ALTER TABLE patrons ADD (
 DOB DATE,
 LAST_MODIFIED DATE DEFAULT SYSDATE,
 MODIFIED_BY VARCHAR2(20) DEFAULT USER
);

INSERT INTO patrons (patron_id, last_name, first_name, street_address, city, zip, DOB, LAST_MODIFIED, MODIFIED_BY)
VALUES (customers_seq.NEXTVAL, 'Ford', 'Tom', 'Hollywood boulvard', 'LA', '987 ASD', TO_DATE('01-MAY-1985', 'DD-MON-YYYY'), SYSDATE, USER);

INSERT INTO patrons (patron_id, last_name, first_name, street_address, city, zip, DOB, LAST_MODIFIED, MODIFIED_BY)
VALUES (customers_seq.NEXTVAL, 'Jimmy', 'Buttler', '897 Alburtus street', 'Kamloops', 'V2C 6N2', TO_DATE('02-JAN-1995', 'DD-MON-YYYY'), SYSDATE, USER);



INSERT INTO patrons (patron_id, last_name, first_name, street_address, city, zip, DOB, LAST_MODIFIED, MODIFIED_BY)
VALUES (customers_seq.NEXTVAL, 'Tony', 'Robbins', 'New Jersey Avenue', 'Portland', '987 ABN', TO_DATE('13-FEB-1990', 'DD-MON-YYYY'), SYSDATE, USER);



INSERT INTO patrons (patron_id, last_name, first_name, street_address, city, zip, DOB, LAST_MODIFIED, MODIFIED_BY)
VALUES (customers_seq.NEXTVAL, 'BOB', 'First PROCTOR', '974 ONTARIO STREET', 'Brampton', 'QRT 698', TO_DATE('19-OCT-2005', 'DD-MON-YYYY'), SYSDATE, USER);




SELECT * FROM BOOKS;
SELECT * FROM Patrons;
SELECT * FROM Transactions;

SELECT patron_id,  UPPER(SUBSTR(last_name, 1, 2)) || LOWER(SUBSTR(last_name, 2)) as last_name, UPPER(SUBSTR(first_name, 1, 1)) || '. ' || LOWER(SUBSTR(first_name, 2)) as first_name, DOB
FROM patrons
WHERE LAST_MODIFIED = SYSDATE
ORDER BY last_name;

SELECT patron_id, ROUND((SYSDATE - DOB) / 365) as age
FROM patrons
ORDER BY CEIL(age);

SELECT DISTINCT p.patron_id, p.last_name, p.first_name
FROM patrons p
JOIN transactions t ON p.patron_id = t.patron_id;

SELECT UPPER(SUBSTR(b.author_last_name, 1, 2)) || LOWER(SUBSTR(b.author_last_name, 2)) as last_name , b.title
FROM books b
WHERE LOWER(b.title) LIKE '%database%' OR LOWER(b.title) LIKE '%data base%' OR LOWER(b.title) LIKE '%databases%'
ORDER BY b.rating;

SELECT DISTINCT p.patron_id, p.last_name, p.first_name
FROM patrons p
JOIN books b ON p.last_name = b.author_last_name;


SELECT b.book_id, SUBSTR(b.title, 1, 10) as title, COUNT(t.transaction_id) as total_transactions
FROM books b
LEFT JOIN transactions t ON b.book_id = t.book_id AND to_char(t.transaction_date, 'YYYY') = '2020'
GROUP BY b.book_id, title
ORDER BY total_transactions DESC;



TRUNCATE TABLE BOOKS;
TRUNCATE TABLE Patrons;
