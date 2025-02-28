-- FŸr deutsche Oracle-Installation
DROP TABLE EMPLOYEE CASCADE CONSTRAINTS;
DROP TABLE DEPARTMENT CASCADE CONSTRAINTS;
DROP TABLE DEPT_LOCATIONS CASCADE CONSTRAINTS;
DROP TABLE PROJECT CASCADE CONSTRAINTS;
DROP TABLE WORKS_ON CASCADE CONSTRAINTS;
DROP TABLE DEPENDENT CASCADE CONSTRAINTS;

CREATE TABLE EMPLOYEE
(FNAME VARCHAR(15) NOT NULL,
MINIT CHAR,
LNAME VARCHAR(15) NOT NULL,
SSN CHAR(9) NOT NULL,
BDATE DATE,
ADDRESS VARCHAR(30),
SEX CHAR,
SALARY DECIMAL(10,2),
SUPERSSN CHAR(9),
DNO INT NOT NULL,
PRIMARY KEY (SSN)
);

CREATE TABLE DEPARTMENT(
DNAME VARCHAR(20),
DNUMBER INT,
MGRSSN CHAR(9),
MGRSTARTDATE DATE,
PRIMARY KEY (DNUMBER)
);

CREATE TABLE DEPT_LOCATIONS(
DNUMBER INT,
DLOCATION VARCHAR(20),
PRIMARY KEY (DNUMBER, DLOCATION)
);

CREATE TABLE PROJECT(
PNAME VARCHAR(20),
PNUMBER INT,
PLOCATION VARCHAR(20),
DNUM INT,
PRIMARY KEY (PNUMBER)
);

CREATE TABLE WORKS_ON(
ESSN CHAR(9),
PNO INT,
HOURS DECIMAL(3,1),
PRIMARY KEY (ESSN, PNO)
);

CREATE TABLE DEPENDENT(
ESSN CHAR(9),
DEPENDENT_NAME VARCHAR(20),
SEX CHAR,
BDATE DATE,
RELATIONSHIP VARCHAR(20),
PRIMARY KEY (ESSN,DEPENDENT_NAME)
);

---------------------------------------------------------------------------------------

insert into EMPLOYEE values ('John','B','Smith','123456789','09.01.1965','731 Fondren, Houston, TM','M','30000','333445555',5);
insert into EMPLOYEE values ('Franklin','T','Wong','333445555','12.08.1955','638 Voss,Houston,TX','M','40000','888665555',5);
insert into EMPLOYEE values ('Alicia','J','Zelaya','999887777','19.07.1968','3321 Castel, Spring, TX','F','25000','987654321',4);
insert into EMPLOYEE values ('Jennifer','S','Wallace','987654321','20.06.1941','291 Berry, Bellaire, TX','F','43000','888665555',4);
insert into EMPLOYEE values ('Ramesh','K','Narayan','666884444','15.09.1962','975 Fire, Oak, Humble, TX','M','38000','333445555',5);
insert into EMPLOYEE values ('Joye','A','English','453453453','31.07.1972','563 Rice, Houston, TX','F','25000','333445555',5);
insert into EMPLOYEE values ('Ahmad','V','Jabbar','987987987','29.03.1969','980 Dallas, Houston, TX','M','25000','987654321',4);
insert into EMPLOYEE values ('James','E','Borg','888665555','10.11.1937','450 Stone, Houston, TX','M','55000',null,1);

insert into DEPARTMENT values ('Research',5,'333445555','22.05.1988'); 
insert into DEPARTMENT values ('Administration',4,'987654321','01.01.1995');
insert into DEPARTMENT values ('Headquarters',1,'888665555','19.06.1981');

insert into DEPT_LOCATIONS values (1,'Houston');
insert into DEPT_LOCATIONS values (4,'Stafford');
insert into DEPT_LOCATIONS values (5,'Bellaire');
insert into DEPT_LOCATIONS values (5,'Sugarland');
insert into DEPT_LOCATIONS values (5,'Houston');

insert into PROJECT values ('Product X',1,'Bellaire',5);
insert into PROJECT values ('Product Y',2,'Sugarland',5);
insert into PROJECT values ('Product Z',3,'Houston',5);
insert into PROJECT values ('Computerization',10,'Stafford',4);
insert into PROJECT values ('Reorganization',20,'Houston',1);
insert into PROJECT values ('Newbenefits',30,'Stafford',4);

insert into WORKS_ON values ('123456789',1,35.5);
insert into WORKS_ON values ('123456789',2,7.5);
insert into WORKS_ON values ('666884444',3,40.0);
insert into WORKS_ON values ('453453453',1,20.0);
insert into WORKS_ON values ('453453453',2,20.0);
insert into WORKS_ON values ('333445555',2,10.0);
insert into WORKS_ON values ('333445555',3,10.0);
insert into WORKS_ON values ('333445555',10,10.0);
insert into WORKS_ON values ('333445555',20,10.0);
insert into WORKS_ON values ('999887777',30,30.0);
insert into WORKS_ON values ('999887777',10,10.0);
insert into WORKS_ON values ('987987987',10,35.0);
insert into WORKS_ON values ('987987987',30,5.0);
insert into WORKS_ON values ('987654321',30,20.0);
insert into WORKS_ON values ('987654321',20,15.0);
insert into WORKS_ON values ('888665555',20,null);

insert into DEPENDENT values ('333445555','Alice','F','05.04.1986','Daughter');
insert into DEPENDENT values ('333445555','Theodore','M','25.10.1983','Son');
insert into DEPENDENT values ('333445555','Joy','F','03.05.1958','Spouse');
insert into DEPENDENT values ('987654321','Abner','M','28.02.1942','Spouse');
insert into DEPENDENT values ('123456789','Michael','M','04.01.1988','Son');
insert into DEPENDENT values ('123456789','Alice','F','30.12.1988','Daughter');
insert into DEPENDENT values ('123456789','Elizabeth','F','05.05.1967','Spouse');

---------------------------------------------------------------------------------------


ALTER TABLE EMPLOYEE
ADD FOREIGN KEY (SUPERSSN)
REFERENCES EMPLOYEE(SSN);
ALTER TABLE EMPLOYEE
ADD FOREIGN KEY (DNO)
REFERENCES DEPARTMENT(DNUMBER);

ALTER TABLE DEPARTMENT
ADD FOREIGN KEY (MGRSSN)
REFERENCES EMPLOYEE(SSN);

ALTER TABLE DEPT_LOCATIONS
ADD FOREIGN KEY (DNUMBER)
REFERENCES DEPARTMENT(DNUMBER);

ALTER TABLE PROJECT
ADD FOREIGN KEY (DNUM)
REFERENCES DEPARTMENT(DNUMBER);

ALTER TABLE WORKS_ON
ADD FOREIGN KEY (ESSN)
REFERENCES EMPLOYEE(SSN);
ALTER TABLE WORKS_ON
ADD FOREIGN KEY (PNO)
REFERENCES PROJECT(PNUMBER);

ALTER TABLE DEPENDENT
ADD FOREIGN KEY (ESSN)
REFERENCES EMPLOYEE(SSN);

---------------------------------------------------------------------------------------



