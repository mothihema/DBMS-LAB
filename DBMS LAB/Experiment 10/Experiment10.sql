-- Enable execution plan display
SET AUTOTRACE ON EXPLAIN;

-- 1. Create EMPLOYEE table 
CREATE TABLE EMPLOYEE (
    EMP_ID NUMBER PRIMARY KEY,
    EMP_NAME VARCHAR2(30),
    DEPARTMENT VARCHAR2(20),
    SALARY NUMBER
);

-- 2. Insert sample employee records
INSERT ALL
    INTO EMPLOYEE VALUES (101, 'Ravi',  'IT',      65000)
    INTO EMPLOYEE VALUES (102, 'Sita',  'HR',      52000)
    INTO EMPLOYEE VALUES (103, 'Rahul', 'IT',      70000)
    INTO EMPLOYEE VALUES (104, 'Priya', 'Sales',   48000)
    INTO EMPLOYEE VALUES (105, 'Arun',  'IT',      75000)
    INTO EMPLOYEE VALUES (106, 'Anita', 'HR',      55000)
    INTO EMPLOYEE VALUES (107, 'Kiran', 'Finance', 60000)
    INTO EMPLOYEE VALUES (108, 'Meena', 'IT',      68000)
SELECT * FROM DUAL;

COMMIT;

-- 3. Search operation WITHOUT index
SELECT *
FROM EMPLOYEE
WHERE DEPARTMENT = 'IT';

-- 4. Create index on the search column
CREATE INDEX IDX_EMP_DEPT
ON EMPLOYEE(DEPARTMENT);

-- 5. Search operation WITH index
SELECT *
FROM EMPLOYEE
WHERE DEPARTMENT = 'IT';

-- 6. Drop the index
DROP INDEX IDX_EMP_DEPT;

-- Stop displaying execution plan
SET AUTOTRACE OFF;