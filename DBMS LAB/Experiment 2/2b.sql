CREATE TABLE Student(
RollNo NUMBER PRIMARY KEY,
Name VARCHAR2(30),
Branch VARCHAR2(20),
Marks NUMBER CHECK(Marks BETWEEN 0 AND 100)
);

INSERT INTO Student VALUES(101,'Akhil','CSE',95);
INSERT INTO Student VALUES(102,'Bhavana','ECE',88);
INSERT INTO Student VALUES(103,'Charan','CSE',91);
INSERT INTO Student VALUES(104,'Divya','EEE',85);
INSERT INTO Student VALUES(105,'Eswar','CSE',97);
INSERT INTO Student VALUES(106,'Farah','ECE',80);
INSERT INTO Student VALUES(107,'Ganesh','CSE',89);
INSERT INTO Student VALUES(108,'Harika','IT',93);

SELECT * FROM Stud;

SELECT COUNT(*) AS Total_Students
FROM Student;

SELECT AVG(Marks) AS Average_Marks
FROM Student;

SELECT SUM(Marks) AS Total_Marks
FROM Student;

SELECT MAX(Marks) AS Highest_Marks
FROM Student;

SELECT MIN(Marks) AS Lowest_Marks
FROM Student;

SELECT Branch,
AVG(Marks) AS Average_Marks
FROM Student
GROUP BY Branch;

SELECT Branch,
COUNT(*) AS Total_Students
FROM Student
GROUP BY Branch;

SELECT Branch,
AVG(Marks) AS Average_Marks
FROM Student
GROUP BY Branch
HAVING AVG(Marks) > 90;

CREATE VIEW High_Scorers AS
SELECT RollNo, Name, Branch, Marks
FROM Student
WHERE Marks > 90;

SELECT * FROM High_Scorers;

DROP VIEW High_Scorers;