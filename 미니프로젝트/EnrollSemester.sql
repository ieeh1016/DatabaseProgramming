CREATE OR REPLACE FUNCTION Date2EnrollSemester(dDate IN DATE)
RETURN NUMBER
IS
  nSemester			NUMBER;
  sMonth			CHAR(2);

BEGIN

  
/* 10�� ~ 12�� : �Ű������� ���� ��¥�� ���� �⵵, 10��~12�� �� : �Ű������� ���� ��¥�� �⵵ */ 
  sMonth := TO_CHAR(dDate, 'MM'); 

  IF (sMonth = 10 or sMonth = 11 or sMonth = 12)  THEN
     nSemester := nSemester + 1;
  ELSE
    nSemester := nSemester;
    END IF;
    RETURN nSemester;
END;
