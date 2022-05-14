CREATE OR REPLACE trigger sal_trigger
BEFORE
INSERT OR UPDATE
ON emp FOR EACH ROW

DECLARE
    lack_salary EXCEPTION;
BEGIN
    IF(:new.sal<10)THEN RAISE lack_salary;
END IF;
EXCEPTION
    WHEN lack_salary THEN
        RAISE_APPLICATION_ERROR(-20005,'급여 부족');
END;

/*
      완성 201611868 현영우
*/
