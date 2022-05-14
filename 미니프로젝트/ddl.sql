/*
���� : ������ȣ, �����̸�, �ܰ�����, ����,�н�����
�л� : �й�, �̸�, �ּ�,�г�,�ܰ�����, ����, �н�����
���� : �����ȣ, �����, ����
��� : �й�, �����ȣ, ��ϳ⵵, ��� �б�
���� : ������ȣ, �����ȣ, ���ǳ⵵, ���� �б�, ����(�����ð�), ���ǽ�, �ִ��л���
*/

DROP TABLE student CASCADE CONSTRAINTS;  
DROP TABLE course CASCADE CONSTRAINTS;  
DROP TABLE professor CASCADE CONSTRAINTS;  
DROP TABLE enroll CASCADE CONSTRAINTS;  
DROP TABLE teach CASCADE CONSTRAINTS;  

CREATE TABLE student
(
    s_id	    CHAR(8),
    s_name  VARCHAR2(20)   not null,
    s_addr    VARCHAR2(200),
    s_year     NUMBER(1)   not null,
    s_college    VARCHAR2(50)   not null,
    s_major   VARCHAR2(50)   not null,
    s_pwd       VARCHAR2(10)   not null,
    CONSTRAINT s_pk PRIMARY KEY (s_id),
    CONSTRAINT CHK_year CHECK (s_year >=1 and s_year <=4)
);


INSERT INTO student (s_id, s_name, s_addr, s_year, s_college, s_major, s_pwd) VALUES
('20191234', '�Ű�ȭ','��⵵ ȭ���� �ۻ�� ����1�� 540-2', 4, '����Ʈ����濵����', '��ǻ�Ͱ��а�','1234');
INSERT INTO student (s_id, s_name, s_addr, s_year, s_college, s_major, s_pwd) VALUES
('20181235', '���븸','��⵵ ���ν� ������ �󼭸� ��24', 4, '����Ʈ����濵����', '��ǻ�Ͱ��а�','1235');
INSERT INTO student (s_id, s_name, s_addr, s_year, s_college, s_major, s_pwd) VALUES
('20181236', '���ֿ�','��⵵ ������ �д籸 ���̵� 79���� ��ġ����', 4, '����Ʈ����濵����', '��ǻ�Ͱ��а�','1236');
INSERT INTO student (s_id, s_name, s_addr, s_year, s_college, s_major, s_pwd) VALUES
('20181237', '����ȯ','��⵵ ������ �ȴޱ� ��ź3�� 416����', 4, '����Ʈ����濵����', '��ǻ�Ͱ��а�','1237');
INSERT INTO student (s_id, s_name, s_addr, s_year, s_college, s_major, s_pwd) VALUES
('20181245', '����ȣ','��� �ȵ��� ��� 1234-5����', 3, '����Ʈ����濵����', '��ǻ�Ͱ��а�','3123');
INSERT INTO student (s_id, s_name, s_addr, s_year, s_college, s_major, s_pwd) VALUES
('20181246', '�ѽŵ�','���� ���α� ���۵� 81', 3, '����Ʈ����濵����', '��ǻ�Ͱ��а�','3124');
INSERT INTO student (s_id, s_name, s_addr, s_year, s_college, s_major, s_pwd) VALUES
('20181247', '��ȣ��','���� ���۱� ���3�� 183-2', 3, '����Ʈ����濵����', '��ǻ�Ͱ��а�','3125');
INSERT INTO student (s_id, s_name, s_addr, s_year, s_college, s_major, s_pwd) VALUES
('20183451', '�迵ö','���� ���빮�� ȸ�⵿ 101-6', 3, '����Ʈ����濵����', 'AI�а�','3451');
INSERT INTO student (s_id, s_name, s_addr, s_year, s_college, s_major, s_pwd) VALUES
('20182454', '���¿�','���� ���ı� ������ 80-3', 4, '����Ʈ����濵����', 'AI�а�','3454');
INSERT INTO student (s_id, s_name, s_addr, s_year, s_college, s_major, s_pwd) VALUES
('20182456', '������','��õ�� ���� ����2�� 400-5', 4, '����Ʈ����濵����', 'AI�а�','3456');



CREATE TABLE course
(
    c_id	   CHAR(4),
    c_name  VARCHAR2(50),
    c_unit     NUMBER(1),
    CONSTRAINT c_pk PRIMARY KEY (c_id)
);

INSERT INTO course VALUES ('C110', '��ǻ�� ���α׷���', 3) ;
INSERT INTO course VALUES ('C120', '��ǻ�� ���α׷���', 3) ;
INSERT INTO course VALUES ('C210', '�ڷᱸ��', 3) ;
INSERT INTO course VALUES ('C220', '�ڷᱸ��', 3) ;
INSERT INTO course VALUES ('C300', '�˰���', 3) ;
INSERT INTO course VALUES ('C410', '�����ͺ��̽�', 3) ;
INSERT INTO course VALUES ('C420', '�����ͺ��̽�', 3) ;
INSERT INTO course VALUES ('C500', '�ü��', 3) ;
INSERT INTO course VALUES ('C610', '����Ʈ���� ����', 3) ;
INSERT INTO course VALUES ('C620', '����Ʈ���� ����', 3) ;
INSERT INTO course VALUES ('C700', '��Ʈ��ũ', 3) ;
INSERT INTO course VALUES ('C800', '�����ͺ��̽� ���α׷���', 3) ;
INSERT INTO course VALUES ('C910', '�ڹ� ���α׷���', 3) ;
INSERT INTO course VALUES ('C920', '�ڹ� ���α׷���', 3) ;

INSERT INTO course VALUES ('M100','��Ƽ�̵�� ����', 3) ;
INSERT INTO course VALUES ('M200', '��ġ���', 3) ;
INSERT INTO course VALUES ('M300', '�׷��� Ȱ��', 3) ;
INSERT INTO course VALUES ('M410', '��ü���� ���α׷���', 3) ;
INSERT INTO course VALUES ('M420', '��ü���� ���α׷���', 3) ;
INSERT INTO course VALUES ('M510', '��ǻ�� �׷��Ƚ�', 3) ;
INSERT INTO course VALUES ('M520', '��ǻ�� �׷��Ƚ�', 3) ;
INSERT INTO course VALUES ('M600', '��Ƽ�̵�� ó��', 3) ;
INSERT INTO course VALUES ('M700', '���� ���α׷���', 3) ;



CREATE TABLE professor
(
    p_id	       CHAR(6),
    p_name      VARCHAR2(50)   not null,
    p_college    VARCHAR2(50)   not null,
    p_major      VARCHAR2(50)   not null,
    p_pwd         VARCHAR2(10)   not null,
    CONSTRAINT p_pk PRIMARY KEY (p_id)
);

INSERT INTO professor VALUES ('CS4580', '�ڱ���', '����Ʈ����濵����', '��ǻ�Ͱ��а�','4580');
INSERT INTO professor VALUES ('CS4581', '�ո�', '����Ʈ����濵����', '��ǻ�Ͱ��а�','4581');
INSERT INTO professor VALUES ('CS4582', '������', '����Ʈ����濵����', '��ǻ�Ͱ��а�','4582');
INSERT INTO professor VALUES ('CS4583', '����ȫ', '����Ʈ����濵����', '��ǻ�Ͱ��а�','4583');
INSERT INTO professor VALUES ('CS4584', '��ɼ�', '����Ʈ����濵����', '��ǻ�Ͱ��а�','4584');
INSERT INTO professor VALUES ('CS4585', '������', '����Ʈ����濵����', '��ǻ�Ͱ��а�','4585');
INSERT INTO professor VALUES ('CS4588', '���¼�', '����Ʈ����濵����', '��ǻ�Ͱ��а�','4587');
INSERT INTO professor VALUES ('MM4570', '������', '����Ʈ����濵����', 'AI�а�','4570');
INSERT INTO professor VALUES ('MM4571', '�ű��', '����Ʈ����濵����', 'AI�а�','4571');
INSERT INTO professor VALUES ('MM4572', '�̻���', '����Ʈ����濵����', 'AI�а�','4572');


CREATE TABLE enroll
(
    s_id	     CHAR(8),
    c_id	     CHAR(4),
    e_year      NUMBER(4),
    e_semester    NUMBER(1), 
    CONSTRAINT e_pk PRIMARY KEY (s_id, c_id),
    CONSTRAINT e_s_id_fk FOREIGN KEY (s_id) REFERENCES  student (s_id), 
    CONSTRAINT e_c_id_fk FOREIGN KEY (c_id) REFERENCES  course (c_id)
);

INSERT INTO enroll VALUES ( '20191234', 'C110', 2020, 1);
INSERT INTO enroll VALUES ( '20191234', 'C210', 2021, 2);
INSERT INTO enroll VALUES ( '20191234', 'C300', 2022, 2);
INSERT INTO enroll VALUES ( '20191234', 'C420', 2022, 2);
INSERT INTO enroll VALUES ( '20191234', 'C500', 2022, 2);
INSERT INTO enroll VALUES ( '20191234', 'C610', 2022, 2);
INSERT INTO enroll VALUES ( '20191234', 'C700', 2022, 2);

INSERT INTO enroll VALUES ( '20181235', 'C110', 2020, 1);
INSERT INTO enroll VALUES ( '20181235', 'C210', 2021, 2);
INSERT INTO enroll VALUES ( '20181235', 'C300', 2022, 2);
INSERT INTO enroll VALUES ( '20181235', 'C420', 2022, 2);
INSERT INTO enroll VALUES ( '20181235', 'C500', 2022, 2);
INSERT INTO enroll VALUES ( '20181235', 'C610', 2022, 2);
INSERT INTO enroll VALUES ( '20181235', 'C700', 2022, 2);

INSERT INTO enroll VALUES ( '20181235', 'C910', 2022, 2);

INSERT INTO enroll VALUES ( '20181236', 'C110', 2020, 1);
INSERT INTO enroll VALUES ( '20181236', 'C210', 2021, 2);
INSERT INTO enroll VALUES ( '20181236', 'C300', 2022, 2);
INSERT INTO enroll VALUES ( '20181236', 'C410', 2022, 2);
INSERT INTO enroll VALUES ( '20181236', 'C500', 2022, 2);
INSERT INTO enroll VALUES ( '20181236', 'C610', 2022, 2);
INSERT INTO enroll VALUES ( '20181236', 'C700', 2022, 2);

INSERT INTO enroll VALUES ( '20181236', 'C910', 2022, 2);

INSERT INTO enroll VALUES ( '20181237', 'C110', 2020, 1);
INSERT INTO enroll VALUES ( '20181237', 'C210', 2021, 2);
INSERT INTO enroll VALUES ( '20181237', 'C300', 2022, 2);
INSERT INTO enroll VALUES ( '20181237', 'C410', 2022, 2);
INSERT INTO enroll VALUES ( '20181237', 'C500', 2022, 2);
INSERT INTO enroll VALUES ( '20181237', 'C610', 2022, 2);
INSERT INTO enroll VALUES ( '20181237', 'C700', 2022, 2);

INSERT INTO enroll VALUES ( '20181237', 'C910', 2022, 2);

INSERT INTO enroll VALUES ( '20181245', 'C110', 2021, 1);
INSERT INTO enroll VALUES ( '20181245', 'C210', 2022, 2);

INSERT INTO enroll VALUES ( '20181245', 'C910', 2022, 2);

INSERT INTO enroll VALUES ( '20181246', 'C110', 2021, 1);
INSERT INTO enroll VALUES ( '20181246', 'C210', 2022, 2);

INSERT INTO enroll VALUES ( '20181246', 'C910', 2022, 2);

INSERT INTO enroll VALUES ( '20181247', 'C110', 2021, 1);
INSERT INTO enroll VALUES ( '20181247', 'C210', 2022, 2);

INSERT INTO enroll VALUES ( '20182454', 'C110', 2020, 1);
INSERT INTO enroll VALUES ( '20182454', 'C210', 2021, 2);
INSERT INTO enroll VALUES ( '20182454', 'M100', 2021, 1);
INSERT INTO enroll VALUES ( '20182454', 'M200', 2021, 2);
INSERT INTO enroll VALUES ( '20182454', 'M300', 2021, 2);
INSERT INTO enroll VALUES ( '20182454', 'M410', 2022, 2);
INSERT INTO enroll VALUES ( '20182454', 'M510', 2022, 2);

INSERT INTO enroll VALUES ( '20182456', 'C110', 2020, 1);
INSERT INTO enroll VALUES ( '20182456', 'C210', 2021, 2);
INSERT INTO enroll VALUES ( '20182456', 'M100', 2021, 1);
INSERT INTO enroll VALUES ( '20182456', 'M200', 2021, 2);
INSERT INTO enroll VALUES ( '20182456', 'M300', 2021, 2);
INSERT INTO enroll VALUES ( '20182456', 'M410', 2022, 2);
INSERT INTO enroll VALUES ( '20182456', 'M510', 2022, 2);


CREATE TABLE teach
(
    p_id	   CHAR(6),
    c_id	   CHAR(4),
    t_year    NUMBER(4),
    t_semester    NUMBER(1),
    t_time    NUMBER(1),
    t_where  VARCHAR2(50),
    t_max    NUMBER(2),
    CONSTRAINT t_pk PRIMARY KEY (p_id, c_id, t_year,t_semester ),
    CONSTRAINT t_p_id_fk FOREIGN KEY (p_id) REFERENCES  professor (p_id),
    CONSTRAINT t_c_id_fk FOREIGN KEY (c_id) REFERENCES  course (c_id)
 );

INSERT INTO teach VALUES ( 'CS4580', 'C110', 2021, 1, 4, '8001 ��ǻ�Ͱ�������ǽ���', 5);
INSERT INTO teach VALUES ( 'CS4580', 'C110', 2020, 1, 4, '8001 ��ǻ�Ͱ�������ǽ���', 5);
INSERT INTO teach VALUES ( 'CS4581', 'C210', 2021, 2, 5, '8001 ��ǻ�Ͱ�������ǽ���', 5);
INSERT INTO teach VALUES ( 'CS4581', 'C210', 2022, 2, 5, '8001 ��ǻ�Ͱ�������ǽ���', 5);
INSERT INTO teach VALUES ( 'CS4581', 'C300', 2022, 2, 2, '8308 ��ǻ�Ͱ��������ǽ���', 5);
INSERT INTO teach VALUES ( 'CS4582', 'C410', 2022, 2, 6, '8001 ��ǻ�Ͱ�������ǽ���', 5);
INSERT INTO teach VALUES ( 'CS4588', 'C420', 2022, 2, 6, '����202 ��Ƽ�̵���', 5);
INSERT INTO teach VALUES ( 'CS4583', 'C500', 2022, 2, 3, '8001 ��ǻ�Ͱ�������ǽ���', 5);
INSERT INTO teach VALUES ( 'CS4583', 'C700', 2022, 2, 4, '8510 9PC��', 5);
INSERT INTO teach VALUES ( 'CS4584', 'C610', 2022, 2, 1, '8510 9PC��', 5);

INSERT INTO teach VALUES ( 'CS4584', 'C800', 2022, 2, 7, '8510 9PC��', 5);

INSERT INTO teach VALUES ( 'MM4570', 'M100', 2021, 1, 4, '����302 ��Ƽ�̵���', 5);  
INSERT INTO teach VALUES ( 'MM4570', 'M100', 2022, 2, 4, '����302 ��Ƽ�̵���', 5);  
INSERT INTO teach VALUES ( 'MM4570', 'M410', 2022, 2, 5, '����302 ��Ƽ�̵���', 5);
INSERT INTO teach VALUES ( 'MM4571', 'M200', 2021, 2, 3, '6005 ��Ƽ�̵���', 5);
INSERT INTO teach VALUES ( 'MM4571', 'M200', 2022, 2, 3, '6005 ��Ƽ�̵���', 5);
INSERT INTO teach VALUES ( 'MM4571', 'M510', 2022, 2, 6, '����302 ��Ƽ�̵���', 5);
INSERT INTO teach VALUES ( 'MM4572', 'M300', 2021, 2, 3, '����302 ��Ƽ�̵���', 5);
INSERT INTO teach VALUES ( 'MM4572', 'M300', 2022, 2, 3, '����302 ��Ƽ�̵���', 5);
INSERT INTO teach VALUES ( 'MM4572', 'C910', 2022, 2, 7, '����302 ��Ƽ�̵���', 5);

commit;

set linesize 100