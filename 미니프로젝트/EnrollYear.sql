CREATE OR REPLACE FUNCTION Date2EnrollYear(dDate IN DATE)

/* --------------------------------

     공란

   -------------------------------- */
IS
  nYear				NUMBER;
  sMonth			CHAR(2);

BEGIN

/* 10월 ~ 12월 : 매개변수로 받은 날짜의 다음 년도, 10월~12월 외 : 매개변수로 받은 날짜의 년도 */
  nYear  := /*       공란            */ -- 매개변수로 받은 날짜 중 '년도' 추출
  sMonth := /*       공란            */  -- 매개변수로 받은 날짜 중 '월' 추출  

  IF (sMonth='10' or sMonth='11' or sMonth='12')  THEN
     nYear := nYear + 1;
  END IF; 
  
  /* --------------------------------  

        공란

   -------------------------------- */
END;