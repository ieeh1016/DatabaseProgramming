Set ServerOutput On

DECLARE
result  VARCHAR2(100) := '';
BEGIN


DBMS_OUTPUT.put_line('**************** Insert �� ���� ó�� �׽�Ʈ ********************');

/* ���� ó�� 2 : ������ ���� ��û ���� :�����ͺ��̽� ���� ��û */
InsertEnroll('20191234', 'C420', result);
DBMS_OUTPUT.put_line('��� : ' || result);


/* ���� ó�� 3 : ������û �ο� �ʰ� ���� : �ڹ� ���α׷��� ��û*/
InsertEnroll('20191234', 'C910', result);
DBMS_OUTPUT.put_line('��� : ' || result);


/* ���� ó�� 4 : ��û�� ����� �ð� �ߺ� ����  : ��Ƽ�̵�� ���� ��û */
InsertEnroll('20191234', 'M100', result);
DBMS_OUTPUT.put_line('��� : ' || result);


/*  ������ ���� ���  */
InsertEnroll('20191234', 'C800', result);
DBMS_OUTPUT.put_line('��� : ' || result);


/*  ���� ó�� 1 : �ִ� ���� �ʰ� ���� �˻� : ���� ���α׷��� ��û */
InsertEnroll('20191234', 'M700', result);
DBMS_OUTPUT.put_line('���  : ' || result);


DBMS_OUTPUT.put_line('***** ������û �� ���� ���� ���� ��ȸ  *****');

/* ���� ��� Ȯ�� */
SelectTimeTable('20191234', 2022, 2);

delete from enroll where s_id='20191234' and c_id='C800';
commit;

END;