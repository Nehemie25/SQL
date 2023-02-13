CREATE TABLE  branch001 (  
    branchCode char(5) PRIMARY KEY,   
    address varchar(255),   
    city varchar(255),   
    phone number,   
    yearOfOpening number(4)  
    );

CREATE TABLE staff001 (  
    staffNo char(5),   
    lname varchar(255),   
    fname varchar(255),   
    dept varchar(255),   
    desig varchar(255),   
    joiningDate number(4),   
    salary number,   
    rating char(1),  
    DOB DATE,
    commissions number,
    grossSalary number,
    branchCode char(5),
    CONSTRAINT fk_staff001 FOREIGN KEY (branchCode)  REFERENCES branch001(branchCode)
    );



INSERT INTO branch001 (branchCode, address, city, phone, yearOfOpening)
VALUES ('A2671', '1051 Campus Drive','Calgary', 2505783873, 2006);

INSERT INTO branch001 (branchCode, address, city, phone, yearOfOpening)
VALUES ('A2673', '1050 Arbutua Street','Edmonton', 258574973, 2007);

INSERT INTO branch001 (branchCode, address, city, phone, yearOfOpening)
VALUES ('A2674', '1055 McGill Drive','Montreal', 2589743873, 2008);

INSERT INTO branch001 (branchCode, address, city, phone, yearOfOpening)
VALUES ('A2675', '1055 BestWick','Vancouver', 2505779873, 2009);

INSERT INTO branch001 (branchCode, address, city, phone, yearOfOpening)
VALUES ('A2678', '1055 BestWick','Vancouver', 2505779873, 2009);


INSERT INTO staff001 (StaffNo, lName, fName, DEPT, Desig, joiningDate, Salary, Rating, branchCode,DOB )
VALUES ('T0060', 'NEHEMIE', 'NGUIMBOUS','Kamloops', 'engineer',2000, 65000, '1', 'A2674',DATE'1990-11-11');

INSERT INTO staff001 (StaffNo, lName, fName, DEPT, Desig, joiningDate, Salary, Rating, branchCode,DOB)
VALUES ('T0061','JOHN', 'SPARROW','DALHOUSIE', 'designer',2001,  64000, '2', 'A2678',DATE'1998-11-11');


INSERT INTO staff001 (StaffNo, lName, fName, DEPT, Desig, joiningDate, Salary, Rating, branchCode, DOB)
VALUES ('T0062','Jack', 'Baueur','Virginia', 'engineer',2002,  78000, '3', 'A2673',DATE'1994-10-11');


INSERT INTO staff001 (StaffNo, lName, fName, DEPT, Desig, joiningDate, Salary, Rating, branchCode, DOB)
VALUES ('T0063','Nick', 'Larson','quebec', 'architect',2003, 85000, '1', 'A2671',DATE'2003-01-11');

INSERT INTO staff001 (StaffNo, lName, fName, DEPT, Desig, joiningDate, Salary, Rating, branchCode, DOB)
VALUES ('T0064','David', 'Goggins','sherbrook', 'manager',2004, 100000, '1', 'A2678',DATE'1994-05-08');

INSERT INTO staff001 (StaffNo, lName, fName, DEPT, Desig, joiningDate, Salary, Rating, branchCode, DOB)
VALUES ('T0065','Edward', 'Snowden','laval', 'manager',2005, 980000, '1', 'A2671',DATE'2022-01-11');

INSERT INTO staff001 (StaffNo, lName, fName, DEPT, Desig, joiningDate, Salary, Rating, branchCode, DOB)
VALUES ('T0066','Boby', 'Deen','Kamloops', 'engineer',2006, 65000, '1', 'A2673',DATE'2022-11-11');

INSERT INTO staff001 (StaffNo,lName, fName, DEPT, Desig, joiningDate, Salary, Rating, branchCode, DOB)
VALUES ('T0067','Tony', 'Robbins','calgary', 'designer',2022, 75000, '1', 'A2673',DATE'2006-11-11');

INSERT INTO staff001 (StaffNo, lName, fName, DEPT, Desig, joiningDate, Salary, Rating, branchCode, DOB)
VALUES ('T0068','Bob', 'Proctor','Brampton', 'manager',2008, 85000, '1', 'A2675',DATE'2008-11-11');

INSERT INTO staff001 (StaffNo, lName, fName, DEPT, Desig, joiningDate, Salary, Rating, branchCode, DOB)
VALUES ('T0069','Eduardo', 'Saverin','Toronto', 'engineer',2022, 95000, '2', 'A2674',DATE'2022-11-11');


ALTER TABLE staff001
ADD (
    DOB DATE,
    
    grossSalary number,
    comissions VARCHAR(255)
);



UPDATE staff001
SET commissions = 
                (salary * 0.05)
WHERE Desig = 'manager';

UPDATE staff001
SET commissions = 
                (salary * 0.04)
WHERE Desig != 'manager';

UPDATE staff001
SET grossSalary = 
                (salary + commissions);




SELECT * FROM staff001;
SELECT * FROM branch001;

SELECT * FROM staff001 WHERE rating = 1;
SELECT fName, lName  FROM staff001 WHERE Desig = 'manager';
SELECT * FROM staff001 ORDER BY SALARY DESC;
SELECT * FROM staff001 ORDER BY DOB DESC;
SELECT * FROM branch001 ORDER BY YEAROFOPENING DESC;



