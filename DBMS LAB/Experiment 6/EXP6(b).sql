 CREATE TABLE STUDENT (
    V_SID   NUMBER(5) PRIMARY KEY,
    V_NAME  VARCHAR2(30),
    V_MARKS NUMBER(5),
    V_AGE   NUMBER(3)
);

INSERT ALL
    INTO STUDENT VALUES (101, 'Ravi', 85, 20)
    INTO STUDENT VALUES (102, 'Sita', 92, 21)
    INTO STUDENT VALUES (103, 'Rahul', 78, 19)
SELECT * FROM DUAL;

COMMIT;

SET SERVEROUTPUT ON;
SET VERIFY OFF;

DECLARE
    -- Loop variable
    v_num NUMBER := 1;

    -- Student variables
    v_student_id STUDENT.V_SID%TYPE := 101;
    v_name       STUDENT.V_NAME%TYPE;
    v_marks      STUDENT.V_MARKS%TYPE;
    v_age        STUDENT.V_AGE%TYPE;

    -- User-defined exception
    e_invalid_marks EXCEPTION;

BEGIN

    -- 1. WHILE LOOP
    DBMS_OUTPUT.PUT_LINE('Numbers using WHILE LOOP:');

    WHILE v_num <= 5 LOOP
        DBMS_OUTPUT.PUT_LINE(v_num);
        v_num := v_num + 1;
    END LOOP;


    -- 2. NUMERIC FOR LOOP
    DBMS_OUTPUT.PUT_LINE('Numbers using FOR LOOP:');

    FOR i IN 1..5 LOOP
        DBMS_OUTPUT.PUT_LINE(i);
    END LOOP;


    -- 3. NESTED FOR LOOPS
    DBMS_OUTPUT.PUT_LINE('Multiplication Tables from 1 to 3:');

    FOR i IN 1..3 LOOP

        DBMS_OUTPUT.PUT_LINE('Table of ' || i);

        FOR j IN 1..10 LOOP
            DBMS_OUTPUT.PUT_LINE(
                i || ' x ' || j || ' = ' || (i * j)
            );
        END LOOP;

    END LOOP;


    -- 4. Retrieve student details
    SELECT V_NAME, V_MARKS, V_AGE
    INTO v_name, v_marks, v_age
    FROM STUDENT
    WHERE V_SID = v_student_id;

    DBMS_OUTPUT.PUT_LINE('Student Details:');
    DBMS_OUTPUT.PUT_LINE('Student ID   : ' || v_student_id);
    DBMS_OUTPUT.PUT_LINE('Student Name : ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Marks        : ' || v_marks);
    DBMS_OUTPUT.PUT_LINE('Age          : ' || v_age);


    -- 5. Validate marks
    IF v_marks > 100 THEN
        RAISE e_invalid_marks;
    END IF;


    -- 6. Validate age
    IF v_age < 18 THEN
        RAISE_APPLICATION_ERROR(
            -20001,
            'Student age must be 18 or above'
        );
    END IF;


    DBMS_OUTPUT.PUT_LINE('Student age is valid.');
    DBMS_OUTPUT.PUT_LINE('Student details processed successfully.');


EXCEPTION

    -- Built-in exception
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE(
            'Error: Student record not found.'
        );

    -- User-defined exception
    WHEN e_invalid_marks THEN
        DBMS_OUTPUT.PUT_LINE(
            'Error: Student marks cannot be greater than 100.'
        );

    -- Other exceptions
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE(
            'Error: ' || SQLERRM
        );

END;
/