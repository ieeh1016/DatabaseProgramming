Set ServerOutput On

DECLARE
result  VARCHAR2(100) := '';
BEGIN


DBMS_OUTPUT.put_line('**************** Insert 및 에러 처리 테스트 ********************');

/* 에러 처리 2 : 동일한 과목 신청 여부 :데이터베이스 과목 신청 */
InsertEnroll('20191234', 'C420', result);
DBMS_OUTPUT.put_line('결과 : ' || result);


/* 에러 처리 3 : 수강신청 인원 초과 여부 : 자바 프로그래밍 신청*/
InsertEnroll('20191234', 'C910', result);
DBMS_OUTPUT.put_line('결과 : ' || result);


/* 에러 처리 4 : 신청한 과목들 시간 중복 여부  : 멀티미디어 개론 신청 */
InsertEnroll('20191234', 'M100', result);
DBMS_OUTPUT.put_line('결과 : ' || result);


/*  에러가 없는 경우  */
InsertEnroll('20191234', 'C800', result);
DBMS_OUTPUT.put_line('결과 : ' || result);


/*  에러 처리 1 : 최대 학점 초과 여부 검사 : 게임 프로그래밍 신청 */
InsertEnroll('20191234', 'M700', result);
DBMS_OUTPUT.put_line('결과  : ' || result);


DBMS_OUTPUT.put_line('***** 수강신청 후 현재 수강 내역 조회  *****');

/* 최종 결과 확인 */
SelectTimeTable('20191234', 2022, 2);

delete from enroll where s_id='20191234' and c_id='C800';
commit;

END;