CREATE OR REPLACE PROCEDURE InsertEnroll(sStudentId IN CHAR, -- �й�
				sCourseId IN CHAR,  -- �����ȣ
				result	OUT VARCHAR2) -- �Է� ��� �޽���
IS
  too_many_sumCourseUnit	EXCEPTION;
  too_many_courses		EXCEPTION;
  too_many_students		EXCEPTION;
  duplicate_time		EXCEPTION;
  nYear				NUMBER;  -- ������û �⵵
  nSemester			NUMBER;  -- ������û �б�
  nSumCourseUnit		NUMBER;  -- ������û�Ϸ�� ������� ������
  nCourseUnit			NUMBER;  -- ���� 
  nCnt				NUMBER;  
  nTeachMax			NUMBER;  -- (������û �⵵,�б�,���� ����) �ִ� �л���(�ִ� ����)

BEGIN
  result := '';

DBMS_OUTPUT.put_line('#');
DBMS_OUTPUT.put_line(sStudentId || '���� �����ȣ ' || sCourseId || '�� ���� ����� ��û�Ͽ����ϴ�.');

  /* (������û�ϴ� ���� ��¥�� ��������) ������û �⵵, �б� �˾Ƴ��� : �Լ� ��� */   
  nYear := Date2EnrollYear(SYSDATE);   -- ������û �⵵
  nSemester := Date2EnrollSemester(SYSDATE);   -- ������û �б�


  /* ���� ó�� 1 : �ִ�����(18����) �ʰ� ���� �˻� */
  -- (������û �⵵, �б⿡ �ش� �л���) ������û �Ϸ�(enroll ���̺� ���� �Ϸ�)�� ������� ������
  SELECT SUM(c.c_unit) 
  INTO	 nSumCourseUnit
  FROM   course c, enroll e
  WHERE  e.s_id = sStudentId and e.e_year = nYear and e.e_semester = nSemester
	and  e.c_id = c.c_id;

  -- ���� ������û�� �Ϸ��� �ϴ� ������ ������ �˻��Ͽ� nCourseUnit ������ ����
  /* --------------------------------  

          ����

   -------------------------------- */
   
   SELECT c_unit
   INTO nCourseUnit
   FROM course
   WHERE c_id=sCourseId;

  -- ������û �Ϸ�� ������� ������ + ���� ������û�� �Ϸ��� �ϴ� ������ ���� > 18���� �˻�
  /* --------------------------------  

           ����

   -------------------------------- */
   IF(nSumCourseUnit + nCourseUnit > 18)
   THEN
    RAISE too_many_sumCourseUnit;
    END IF;



  /* ���� ó�� 2 : ������ ���� ��û ���� �˻� */
  -- �ش� �л��� ������û �Ϸ�(enroll ���̺� ���� �Ϸ�)�� ���� ��, ���� ������û�� �Ϸ��� �ϴ� ������ �ִ��� �˻�
  SELECT COUNT(*)
  INTO	 nCnt
  FROM   enroll
  WHERE  s_id = sStudentId and c_id = sCourseId;

  IF (nCnt > 0) 
  THEN
     RAISE too_many_courses;
  END IF;


  /* ���� ó�� 3 : ������û �ο� �ʰ� ���� �˻� */
  -- (������û �⵵,�б�,���� ����) �ִ� �л���(�ִ� ����) �˻�
  SELECT t_max
  INTO	 nTeachMax
  FROM   teach
  WHERE  t_year= nYear and t_semester = nSemester and c_id = sCourseId;


  -- (������û �⵵,�б�,��������) �̹� ������û �Ϸ�(enroll ���̺� ���� �Ϸ�)�� �л��� �˻��Ͽ� nCnt ������ ����
  /* --------------------------------  

          ����

   -------------------------------- */
    SELECT COUNT(*)
    INTO   nCnt
    FROM   enroll
    WHERE  e_year = nYear and e_semester = nSemester and c_id = sCourseId;
  -- (������û �⵵,�б�,���� ����) ������û �Ϸ� �л��� >= (������û �⵵,�б�,���� ����)�ִ� �л��� ���� �˻�
  
  IF (nCnt >= nTeachMax)
  THEN
     RAISE too_many_students;
  END IF;


  /* ���� ó�� 4 : ��û�� ����� �ð� �ߺ� ����  */  
  -- (������û �⵵,�б⿡) ������û�Ϸ��� �ϴ� ������ ����(�����ð�)��
  -- (������û �л�,�⵵,�б��) �̹� ������û �Ϸ�� ������� ����(�����ð�)
  -- �� �ߺ��Ǵ� ����(�����ð�)�� �ִ��� �˻�
  SELECT COUNT(*) 
  INTO   nCnt
  FROM
  (
	  SELECT t_time
	  FROM teach
	  WHERE t_year=nYear and t_semester = nSemester and c_id = sCourseId 
	  INTERSECT
	  SELECT t.t_time
	  FROM	teach t, enroll e
	  WHERE	e.s_id=sStudentId and e.e_year=nYear and e.e_semester = nSemester and
		t.t_year=nYear and t.t_semester = nSemester and	
        e.c_id=t.c_id
  );
  
  IF (nCnt > 0)
  THEN
     RAISE duplicate_time;
  END IF;


  /* ���� ��û : Enroll ���̺� �й�,�����ȣ,�����⵵, �����б� �Է� */
  /* --------------------------------  

        ����

   -------------------------------- */
    INSERT INTO enroll(s_id,c_id,e_year,e_semester)
    VALUES(sStudentId, sCourseId, nYear, nSemester);
  
  COMMIT;
  result := '������û ����� �Ϸ�Ǿ����ϴ�.';

EXCEPTION
  /* --------------------------------  

     ����

   -------------------------------- */
  
  WHEN too_many_sumCourseUnit	THEN    
	result := '�ִ������� �ʰ��Ͽ����ϴ�.';	
  WHEN too_many_courses		THEN
	result := '�̹� ��ϵ� ������ ��û�Ͽ����ϴ�.';
  WHEN too_many_students	THEN
	result := '������û �ο��� �ʰ��Ǿ� ����� �Ұ����մϴ�';
  WHEN duplicate_time		THEN
	result := '�̹� ��ϵ� ���� �� �ߺ��Ǵ� �ð��� �����մϴ�.';
  WHEN OTHERS THEN        
        result := SQLCODE;
/* --------------------------------  

     ����

   -------------------------------- */
END;