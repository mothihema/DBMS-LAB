SET SERVEROUTPUT ON;

CREATE TABLE DOCTOR (
    DOCTOR_ID NUMBER,
    DOCTOR_NAME VARCHAR2(30),
    SPECIALIZATION VARCHAR2(30),
    EXPERIENCE NUMBER
);

INSERT INTO DOCTOR VALUES (101, 'Ravi', 'Cardiology', 10);
INSERT INTO DOCTOR VALUES (102, 'Anu', 'Neurology', 8);
INSERT INTO DOCTOR VALUES (103, 'Kiran', 'Orthopedic', 6);

DECLARE
    TYPE doctor_cursor IS REF CURSOR;
    c_doctor doctor_cursor;

    v_id DOCTOR.DOCTOR_ID%TYPE;
    v_name DOCTOR.DOCTOR_NAME%TYPE;
    v_spec DOCTOR.SPECIALIZATION%TYPE;
    v_exp DOCTOR.EXPERIENCE%TYPE;

BEGIN
    OPEN c_doctor FOR
        SELECT DOCTOR_ID, DOCTOR_NAME, SPECIALIZATION, EXPERIENCE
        FROM DOCTOR;

    LOOP
        FETCH c_doctor INTO v_id, v_name, v_spec, v_exp;

        EXIT WHEN c_doctor%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            v_id || ' ' || v_name || ' ' || v_spec || ' ' || v_exp
        );
    END LOOP;

    CLOSE c_doctor;
END;
/