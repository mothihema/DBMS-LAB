 SET SERVEROUTPUT ON;

DECLARE
    v_name       VARCHAR2(30) := 'Ravi';
    v_marks      NUMBER := 78;
    v_result     VARCHAR2(30);
    v_grade      VARCHAR2(20);

    v_value1     NUMBER := 10;
    v_value2     NUMBER := 10;
    v_nullif     NUMBER;

    v_coalesce   VARCHAR2(30);

BEGIN
    -- Nested IF
    IF v_marks >= 35 THEN
        IF v_marks >= 75 THEN
            v_result := 'Passed with Distinction';
        ELSIF v_marks >= 60 THEN
            v_result := 'Passed with First Class';
        ELSE
            v_result := 'Passed';
        END IF;
    ELSE
        v_result := 'Failed';
    END IF;

    DBMS_OUTPUT.PUT_LINE('Student Name : ' || v_name);
    DBMS_OUTPUT.PUT_LINE('Marks        : ' || v_marks);
    DBMS_OUTPUT.PUT_LINE('Nested IF Result : ' || v_result);

    -- CASE Statement
    CASE
        WHEN v_marks >= 75 THEN
            DBMS_OUTPUT.PUT_LINE('CASE Statement : Distinction');
        WHEN v_marks >= 60 THEN
            DBMS_OUTPUT.PUT_LINE('CASE Statement : First Class');
        WHEN v_marks >= 50 THEN
            DBMS_OUTPUT.PUT_LINE('CASE Statement : Second Class');
        WHEN v_marks >= 35 THEN
            DBMS_OUTPUT.PUT_LINE('CASE Statement : Pass');
        ELSE
            DBMS_OUTPUT.PUT_LINE('CASE Statement : Fail');
    END CASE;

    -- CASE Expression
    v_grade := CASE
                    WHEN v_marks >= 75 THEN 'Distinction'
                    WHEN v_marks >= 60 THEN 'First Class'
                    WHEN v_marks >= 50 THEN 'Second Class'
                    WHEN v_marks >= 35 THEN 'Pass'
                    ELSE 'Fail'
                END;

    DBMS_OUTPUT.PUT_LINE('CASE Expression Grade : ' || v_grade);

    -- NULLIF Function
    v_nullif := NULLIF(v_value1, v_value2);

    IF v_nullif IS NULL THEN
        DBMS_OUTPUT.PUT_LINE('NULLIF Result : NULL');
    ELSE
        DBMS_OUTPUT.PUT_LINE('NULLIF Result : ' || v_nullif);
    END IF;

    -- COALESCE Function
    v_coalesce := COALESCE(NULL, NULL, 'No Grade', 'Default');

    DBMS_OUTPUT.PUT_LINE('COALESCE Result : ' || v_coalesce);

EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error : ' || SQLERRM);
END;
/