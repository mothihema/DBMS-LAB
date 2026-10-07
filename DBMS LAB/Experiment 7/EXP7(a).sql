SET SERVEROUTPUT ON;

CREATE TABLE STUDENT (
    STUDENT_ID NUMBER(5),
    STUDENT_NAME VARCHAR2(30),
    MARKS NUMBER(5)
);

INSERT INTO STUDENT VALUES (101, 'Ravi', 85);
INSERT INTO STUDENT VALUES (102, 'Sita', 92);
INSERT INTO STUDENT VALUES (103, 'Arun', 78);

COMMIT;

CREATE OR REPLACE PROCEDURE GET_STUDENT_DETAILS (
    p_student_id   IN STUDENT.STUDENT_ID%TYPE,
    p_student_name OUT STUDENT.STUDENT_NAME%TYPE,
    p_marks        OUT STUDENT.MARKS%TYPE
)
IS
BEGIN
    SELECT STUDENT_NAME, MARKS
    INTO p_student_name, p_marks
    FROM STUDENT
    WHERE STUDENT_ID = p_student_id;

EXCEPTION
    WHEN NO_DATA_FOUND THEN
        p_student_name := NULL;
        p_marks := NULL;

        DBMS_OUTPUT.PUT_LINE(
            'No student found with ID: ' || p_student_id
        );
END;
/

DECLARE
    v_student_name STUDENT.STUDENT_NAME%TYPE;
    v_marks        STUDENT.MARKS%TYPE;
BEGIN
    GET_STUDENT_DETAILS(101, v_student_name, v_marks);

    IF v_student_name IS NOT NULL THEN
        DBMS_OUTPUT.PUT_LINE('Student Name: ' || v_student_name);
        DBMS_OUTPUT.PUT_LINE('Marks: ' || v_marks);
    END IF;
END;
/
