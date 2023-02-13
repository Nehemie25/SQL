                                      

CREATE TABLE books ( 
 book_id int,   
 title varchar(20),   
 author_last_name varchar(20),   
 author_first_name varchar(20),  
 rating char(1), 
 PRIMARY KEY (book_id) 
);

CREATE TABLE patrons ( 
 patron_id int,   
 last_name varchar(20),   
 first_name varchar(20),  
 street_address varchar(30),  
 city varchar(10),  
 zip char(7), 
 DOB DATE, 
 LAST_MODIFIED DATE DEFAULT SYSDATE, 
 MODIFIED_BY VARCHAR2(20) DEFAULT USER, 
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

CREATE SEQUENCE book_id_seq 
  START WITH 1 
  INCREMENT BY 1 
  NOCACHE;


ALTER TABLE Transactions ADD (Fine number);


INSERT INTO Patrons (patron_id, last_name, first_name, street_address, city, zip, DOB, LAST_MODIFIED, MODIFIED_BY) 
VALUES (book_id_seq.NEXTVAL ,'PROCTOR', 'BOB', 'Ontario Street', 'Brampton', 'V2C 4N2', TO_DATE('01-FEB-1995', 'DD-MON-YYYY'), SYSDATE, USER);

INSERT INTO Patrons (patron_id, last_name, first_name, street_address, city, zip, DOB, LAST_MODIFIED, MODIFIED_BY) 
VALUES (book_id_seq.NEXTVAL, 'Robbins', 'Tony', 'LA Street', 'MALIBU', 'V2C 9N2', TO_DATE('25-APR-1997', 'DD-MON-YYYY'), SYSDATE, USER);

INSERT INTO Books (book_id, title, author_last_name, author_first_name, rating) 
VALUES (book_id_seq.NEXTVAL, 'HARRY POTTER', 'Rowlings', 'JK', '1');

INSERT INTO Books (book_id, title, author_last_name, author_first_name, rating) 
VALUES (book_id_seq.NEXTVAL, 'EAT THE FROG', 'PROCTOR', 'BOB', '1');

INSERT INTO Books (book_id, title, author_last_name, author_first_name, rating) 
VALUES (book_id_seq.NEXTVAL, 'MIND', 'Robbins', 'Tony', '1');



INSERT INTO Transactions (transaction_id, patron_id, book_id, transaction_date, transaction_type, Fine) 
VALUES (book_id_seq.NEXTVAL,  
    (SELECT patron_id FROM Patrons WHERE last_name = 'Robbins') 
    , (SELECT book_id FROM Books WHERE author_last_name = 'Robbins') 
     
    ,  TO_DATE('01-FEB-2022', 'DD-MON-YYYY'), '1', 200);

INSERT INTO Transactions (transaction_id, patron_id, book_id, transaction_date, transaction_type, Fine) 
VALUES (book_id_seq.NEXTVAL,  
    (SELECT patron_id FROM Patrons WHERE last_name = 'Chessy') 
    , (SELECT book_id FROM Books WHERE author_last_name = 'Chessy') 
     
    ,  TO_DATE('01-FEB-2022', 'DD-MON-YYYY'), '1', 400);

INSERT INTO Transactions (transaction_id, patron_id, book_id, transaction_date, transaction_type, Fine) 
VALUES (book_id_seq.NEXTVAL,  
    (SELECT patron_id FROM Patrons WHERE last_name = 'PROCTOR') 
    , (SELECT book_id FROM Books WHERE author_last_name = 'PROCTOR') 
     
    ,  TO_DATE('01-AUG-2018', 'DD-MON-YYYY'), '1', 100);


                                        



 
ALTER TABLE Transactions ADD (Fine number DEFAULT 10);

SELECT p.patron_id 
    FROM Patrons p 
    JOIN Transactions t ON p.patron_id = t.patron_id AND t.transaction_date = to_date('01-SEPT-2014', 'DD-MON-YYYY') ;


 SELECT p.patron_id 
    FROM Patrons p 
    JOIN Transactions t ON p.patron_id = t.patron_id and t.transaction_type = '3';


SELECT b.book_id, b.title, b.author_last_name, b.author_first_name, b.rating FROM books b
   JOIN Transactions t ON b.book_id = t.book_id AND t.transaction_type = '1';



SELECT b.title
FROM books b
JOIN transactions t ON b.book_id = t.book_id
WHERE t.transaction_date BETWEEN to_date('01-SEPT-2014', 'DD-MON-YYYY') 
AND to_date('30-SEPT-2014', 'DD-MON-YYYY')
AND t.transaction_type = '1';



SELECT  patron_id,  UPPER(SUBSTR(last_name, 1, 1))  || LOWER(SUBSTR(last_name, 2)) as last_name, UPPER(SUBSTR(first_name, 1, 1)) ||  LOWER(SUBSTR(first_name, 2))  as first_name, UPPER(SUBSTR(street_address, 1)) as street_address, UPPER(SUBSTR(city, 1)) as city, zip, DOB, Last_Modified, Modified_By
FROM patrons;



SELECT 
  p.patron_id, 
  p.last_name, 
  p.first_name, 
  SUM(fine) AS total_fine_paid 
FROM 
  patrons p 
  JOIN transactions t 
    ON p.patron_id = t.patron_id 
GROUP BY 
  p.patron_id, p.last_name, p.first_name;


SELECT 
  p.patron_id, 
  p.last_name, 
  p.first_name, 
  p.DOB,
  SUM(fine) AS total_fine_paid 
FROM 
  patrons p 
  JOIN transactions t 
    ON p.patron_id = t.patron_id 
GROUP BY 
  p.patron_id, p.last_name, p.first_name, p.DOB 
ORDER BY 
  p.DOB ASC
  LIMIT 1; 


SELECT 
  b.book_id,
  b.title,
  b.author_last_name,
  b.author_first_name,
  b.rating,
  COUNT(t.book_id) AS number_of_transactions
FROM 
  books b 
  JOIN transactions t 
    ON b.book_id = t.book_id 
GROUP BY 
  b.book_id,
  b.title,
  b.author_last_name,
  b.author_first_name,
  b.rating
ORDER BY 
  number_of_transactions DESC
LIMIT 1;  



 CREATE VIEW book_transactions AS
SELECT transaction_date, transaction_type, COUNT(*) AS transaction_count
FROM transactions
GROUP BY transaction_date, transaction_type;

SELECT * FROM book_transactions;



 SELECT *
 FROM staff001
 WHERE branchCode LIKE 'A%s';

SELECT *
FROM staff001
WHERE desig LIKE 'M%r' OR desig LIKE 'M%s';

SELECT last_name, first_name
   FROM patrons
   WHERE zip LIKE 'V2%';

SELECT *
   FROM staff001
   WHERE regexp_like(fname, '(.)\1.*');
