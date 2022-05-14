CREATE OR REPLACE PROCEDURE register_emp(empno IN NUMBER, ename IN VARCHAR2, deptno IN number)
IS
    deptname dept.dname%type;
BEGIN
    INSERT INTO emp(empno, ename, deptno)
    VALUES(empno, ename, deptno);
EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('중복 데이터로 등록 불가');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('기타 에러 발생');
END;

/*
      완성 201611868 현영우
*/
