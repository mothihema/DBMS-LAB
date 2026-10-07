SET SERVEROUTPUT ON;

CREATE TABLE STUDENT(
    STUDENT_ID NUMBER,
    STUDENT_NAME VARCHAR2(30),
    COURSE VARCHAR2(20),
    MARKS NUMBER
);

INSERT INTO STUDENT VALUES(101,'Ravi','CSE',85);
INSERT INTO STUDENT VALUES(102,'Anu','ECE',90);
INSERT INTO STUDENT VALUES(103,'Kiran','CSE',78);

DECLARE
    TYPE ref_cur IS REF CURSOR;
    c_student ref_cur;
    v_id STUDENT.STUDENT_ID%TYPE;
    v_name STUDENT.STUDENT_NAME%TYPE;
    v_course STUDENT.COURSE%TYPE;
    v_marks STUDENT.MARKS%TYPE;
BEGIN
    OPEN c_student FOR SELECT * FROM STUDENT;

    LOOP
        FETCH c_student INTO v_id,v_name,v_course,v_marks;
        EXIT WHEN c_student%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            v_id || '  ' || v_name || '  ' || v_course || '  ' || v_marks
        );
    END LOOP;

    CLOSE c_student;
END;
/