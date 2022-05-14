CREATE OR REPLACE FUNCTION Date2EnrollSemester(dDate IN DATE)
RETURN NUMBER
IS
  nSemester			NUMBER;
  sMonth			CHAR(2);

BEGIN

  
/* 10월 ~ 12월 : 매개변수로 받은 날짜의 다음 년도, 10월~12월 외 : 매개변수로 받은 날짜의 년도 */ 
  sMonth := TO_CHAR(dDate, 'MM'); 

  IF (sMonth = 10 or sMonth = 11 or sMonth = 12)  THEN
     nSemester := nSemester + 1;
  ELSE
    nSemester := nSemester;
    END IF;
    RETURN nSemester;
END;
