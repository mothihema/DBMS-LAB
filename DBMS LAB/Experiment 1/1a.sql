CREATE TABLE STUDENT( 
Name VARCHAR2(20), 
Student_number NUMBER(5), 
Class NUMBER(2), 
Major VARCHAR2(10) 
); 

CREATE TABLE COURSE(
    COURSE_NAME VARCHAR2(30),
    COURSE_NUMBER VARCHAR2(10),
    CREDIT_HOURS INT,
    DEPARTMENT VARCHAR2(5)
);

CREATE TABLE SECTION ( 
Section_identifier NUMBER(5), 
Course_number VARCHAR2(10), 
Semester VARCHAR2(10), 
Year NUMBER(2), 
Instructor VARCHAR2(20) 
 );

CREATE TABLE GRADE_REPORT ( 
Student_number NUMBER(5), 
Section_identifier NUMBER(5), 
Grade CHAR(1) 
); 


INSERT ALL 
INTO STUDENT VALUES ('Smith', 17, 1, 'CS') 
INTO STUDENT VALUES ('Brown', 8, 2, 'CS') 
SELECT * FROM DUAL; 

 INSERT ALL 
 INTO COURSE VALUES ('Intro to Computer Science', 'CS1310', 4, 'CS')
 INTO COURSE VALUES ('Data Structures', 'CS3320', 4, 'CS')
 INTO COURSE VALUES ('Discrete Mathematics', 'MATH2410', 3, 'MATH')
 INTO COURSE VALUES ('Database', 'CS3380', 3, 'CS')
 SELECT * FROM DUAL; 

INSERT ALL 
INTO SECTION VALUES (85, 'MATH2410', 'Fall', 7, 'King')
INTO SECTION VALUES (92, 'CS1310', 'Fall', 7, 'Anderson')
INTO SECTION VALUES (102, 'CS3320', 'Spring', 8, 'Knuth')
INTO SECTION VALUES (112, 'MATH2410', 'Fall', 8, 'Chang')
INTO SECTION VALUES (119, 'CS1310', 'Fall', 8, 'Anderson')
INTO SECTION VALUES (135, 'CS3380', 'Fall', 8, 'Stone')
SELECT * FROM DUAL; 

INSERT ALL 
INTO GRADE_REPORT VALUES (17, 112, 'B')
INTO GRADE_REPORT VALUES (17, 119, 'C')
INTO GRADE_REPORT VALUES (8, 85, 'A')
INTO GRADE_REPORT VALUES (8, 92, 'A')
INTO GRADE_REPORT VALUES (8, 102, 'B')
INTO GRADE_REPORT VALUES (8, 135, 'A')
SELECT * FROM DUAL; 

desc student; 

 desc course; 

desc section;

desc grade_report; 

 select * from student; 

select * from course; 

select * from section; 

select * from grade_report; 

drop table student; 

drop table course; 

drop table section; 

drop table grade_report; 



