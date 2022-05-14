Set ServerOutput On
DECLARE
    CURSOR deptinfo IS
        SELECT deptno, dname
        FROM dept;
    v_deptno dept.deptno%TYPE;
    v_dname dept.dname%TYPE;
    nSum NUMBER :=0;
BEGIN
    OPEN deptinfo;
    LOOP
        FETCH deptinfo INTO v_deptno, v_dname;
        EXIT WHEN deptinfo%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('부서번호:'||v_deptno||'부서이름:'||v_dname);
        IF(MOD(v_deptno,4)=0)THEN
            nSum := nSum +v_deptno;
        END IF;
    END LOOP;
    CLOSE deptinfo;
    DBMS_OUTPUT.PUT_LINE('4의 배수인 부서번호의 합계 : '||TO_CHAR(nSum));
END;
/*
    완성 201611868 현영우
*/