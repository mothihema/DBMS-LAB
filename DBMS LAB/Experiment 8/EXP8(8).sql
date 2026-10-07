SET SERVEROUTPUT ON;

CREATE TABLE ORDERS (
    ORDER_ID NUMBER,
    CUSTOMER_NAME VARCHAR2(30),
    PRODUCT_NAME VARCHAR2(30),
    QUANTITY NUMBER,
    TOTAL_AMOUNT NUMBER
);

INSERT INTO ORDERS VALUES (101, 'Ravi', 'Laptop', 1, 50000);
INSERT INTO ORDERS VALUES (102, 'Anu', 'Mobile', 2, 30000);
INSERT INTO ORDERS VALUES (103, 'Kiran', 'Headphones', 3, 6000);

DECLARE
    TYPE order_cursor IS REF CURSOR;
    c_order order_cursor;

    v_id ORDERS.ORDER_ID%TYPE;
    v_customer ORDERS.CUSTOMER_NAME%TYPE;
    v_product ORDERS.PRODUCT_NAME%TYPE;
    v_qty ORDERS.QUANTITY%TYPE;
    v_amount ORDERS.TOTAL_AMOUNT%TYPE;

BEGIN
    OPEN c_order FOR
        SELECT ORDER_ID, CUSTOMER_NAME, PRODUCT_NAME,
               QUANTITY, TOTAL_AMOUNT
        FROM ORDERS;

    LOOP
        FETCH c_order INTO v_id, v_customer, v_product, v_qty, v_amount;

        EXIT WHEN c_order%NOTFOUND;

        DBMS_OUTPUT.PUT_LINE(
            v_id || ' ' || v_customer || ' ' ||
            v_product || ' ' || v_qty || ' ' || v_amount
        );
    END LOOP;

    CLOSE c_order;
END;
/