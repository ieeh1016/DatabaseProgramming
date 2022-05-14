/*
교수 : 교수번호, 교수이름, 단과대학, 전공,패스워드
학생 : 학번, 이름, 주소,학년,단과대학, 전공, 패스워드
과목 : 과목번호, 과목명, 학점
등록 : 학번, 과목번호, 등록년도, 등록 학기
강의 : 교수번호, 과목번호, 강의년도, 강의 학기, 교시(수업시간), 강의실, 최대학생수
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
('20191234', '신경화','경기도 화성군 송산면 고정1리 540-2', 4, '소프트웨어경영대학', '컴퓨터과학과','1234');
INSERT INTO student (s_id, s_name, s_addr, s_year, s_college, s_major, s_pwd) VALUES
('20181235', '서용만','경기도 용인시 기흥읍 농서리 산24', 4, '소프트웨어경영대학', '컴퓨터과학과','1235');
INSERT INTO student (s_id, s_name, s_addr, s_year, s_college, s_major, s_pwd) VALUES
('20181236', '정주영','경기도 성남시 분당구 구미동 79번지 까치마을', 4, '소프트웨어경영대학', '컴퓨터과학과','1236');
INSERT INTO student (s_id, s_name, s_addr, s_year, s_college, s_major, s_pwd) VALUES
('20181237', '고정환','경기도 수원시 팔달구 매탄3동 416번지', 4, '소프트웨어경영대학', '컴퓨터과학과','1237');
INSERT INTO student (s_id, s_name, s_addr, s_year, s_college, s_major, s_pwd) VALUES
('20181245', '전용호','경북 안동시 용상동 1234-5번지', 3, '소프트웨어경영대학', '컴퓨터과학과','3123');
INSERT INTO student (s_id, s_name, s_addr, s_year, s_college, s_major, s_pwd) VALUES
('20181246', '한신동','서울 종로구 수송동 81', 3, '소프트웨어경영대학', '컴퓨터과학과','3124');
INSERT INTO student (s_id, s_name, s_addr, s_year, s_college, s_major, s_pwd) VALUES
('20181247', '노호현','서울 동작구 사당3동 183-2', 3, '소프트웨어경영대학', '컴퓨터과학과','3125');
INSERT INTO student (s_id, s_name, s_addr, s_year, s_college, s_major, s_pwd) VALUES
('20183451', '김영철','서울 동대문구 회기동 101-6', 3, '소프트웨어경영대학', 'AI학과','3451');
INSERT INTO student (s_id, s_name, s_addr, s_year, s_college, s_major, s_pwd) VALUES
('20182454', '정태웅','서울 송파구 가락동 80-3', 4, '소프트웨어경영대학', 'AI학과','3454');
INSERT INTO student (s_id, s_name, s_addr, s_year, s_college, s_major, s_pwd) VALUES
('20182456', '정진영','인천시 부평구 갈산2동 400-5', 4, '소프트웨어경영대학', 'AI학과','3456');



CREATE TABLE course
(
    c_id	   CHAR(4),
    c_name  VARCHAR2(50),
    c_unit     NUMBER(1),
    CONSTRAINT c_pk PRIMARY KEY (c_id)
);

INSERT INTO course VALUES ('C110', '컴퓨터 프로그래밍', 3) ;
INSERT INTO course VALUES ('C120', '컴퓨터 프로그래밍', 3) ;
INSERT INTO course VALUES ('C210', '자료구조', 3) ;
INSERT INTO course VALUES ('C220', '자료구조', 3) ;
INSERT INTO course VALUES ('C300', '알고리즘', 3) ;
INSERT INTO course VALUES ('C410', '데이터베이스', 3) ;
INSERT INTO course VALUES ('C420', '데이터베이스', 3) ;
INSERT INTO course VALUES ('C500', '운영체제', 3) ;
INSERT INTO course VALUES ('C610', '소프트웨어 공학', 3) ;
INSERT INTO course VALUES ('C620', '소프트웨어 공학', 3) ;
INSERT INTO course VALUES ('C700', '네트워크', 3) ;
INSERT INTO course VALUES ('C800', '데이터베이스 프로그래밍', 3) ;
INSERT INTO course VALUES ('C910', '자바 프로그래밍', 3) ;
INSERT INTO course VALUES ('C920', '자바 프로그래밍', 3) ;

INSERT INTO course VALUES ('M100','멀티미디어 개론', 3) ;
INSERT INTO course VALUES ('M200', '수치계산', 3) ;
INSERT INTO course VALUES ('M300', '그래픽 활용', 3) ;
INSERT INTO course VALUES ('M410', '객체지향 프로그래밍', 3) ;
INSERT INTO course VALUES ('M420', '객체지향 프로그래밍', 3) ;
INSERT INTO course VALUES ('M510', '컴퓨터 그래픽스', 3) ;
INSERT INTO course VALUES ('M520', '컴퓨터 그래픽스', 3) ;
INSERT INTO course VALUES ('M600', '멀티미디어 처리', 3) ;
INSERT INTO course VALUES ('M700', '게임 프로그래밍', 3) ;



CREATE TABLE professor
(
    p_id	       CHAR(6),
    p_name      VARCHAR2(50)   not null,
    p_college    VARCHAR2(50)   not null,
    p_major      VARCHAR2(50)   not null,
    p_pwd         VARCHAR2(10)   not null,
    CONSTRAINT p_pk PRIMARY KEY (p_id)
);

INSERT INTO professor VALUES ('CS4580', '박구곤', '소프트웨어경영대학', '컴퓨터과학과','4580');
INSERT INTO professor VALUES ('CS4581', '손명성', '소프트웨어경영대학', '컴퓨터과학과','4581');
INSERT INTO professor VALUES ('CS4582', '이은선', '소프트웨어경영대학', '컴퓨터과학과','4582');
INSERT INTO professor VALUES ('CS4583', '서의홍', '소프트웨어경영대학', '컴퓨터과학과','4583');
INSERT INTO professor VALUES ('CS4584', '김심선', '소프트웨어경영대학', '컴퓨터과학과','4584');
INSERT INTO professor VALUES ('CS4585', '전지영', '소프트웨어경영대학', '컴퓨터과학과','4585');
INSERT INTO professor VALUES ('CS4588', '김태선', '소프트웨어경영대학', '컴퓨터과학과','4587');
INSERT INTO professor VALUES ('MM4570', '김정미', '소프트웨어경영대학', 'AI학과','4570');
INSERT INTO professor VALUES ('MM4571', '신기웅', '소프트웨어경영대학', 'AI학과','4571');
INSERT INTO professor VALUES ('MM4572', '이상헌', '소프트웨어경영대학', 'AI학과','4572');


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

INSERT INTO teach VALUES ( 'CS4580', 'C110', 2021, 1, 4, '8001 컴퓨터과학전산실습실', 5);
INSERT INTO teach VALUES ( 'CS4580', 'C110', 2020, 1, 4, '8001 컴퓨터과학전산실습실', 5);
INSERT INTO teach VALUES ( 'CS4581', 'C210', 2021, 2, 5, '8001 컴퓨터과학전산실습실', 5);
INSERT INTO teach VALUES ( 'CS4581', 'C210', 2022, 2, 5, '8001 컴퓨터과학전산실습실', 5);
INSERT INTO teach VALUES ( 'CS4581', 'C300', 2022, 2, 2, '8308 컴퓨터과학전공실습실', 5);
INSERT INTO teach VALUES ( 'CS4582', 'C410', 2022, 2, 6, '8001 컴퓨터과학전산실습실', 5);
INSERT INTO teach VALUES ( 'CS4588', 'C420', 2022, 2, 6, '종합202 멀티미디어실', 5);
INSERT INTO teach VALUES ( 'CS4583', 'C500', 2022, 2, 3, '8001 컴퓨터과학전산실습실', 5);
INSERT INTO teach VALUES ( 'CS4583', 'C700', 2022, 2, 4, '8510 9PC실', 5);
INSERT INTO teach VALUES ( 'CS4584', 'C610', 2022, 2, 1, '8510 9PC실', 5);

INSERT INTO teach VALUES ( 'CS4584', 'C800', 2022, 2, 7, '8510 9PC실', 5);

INSERT INTO teach VALUES ( 'MM4570', 'M100', 2021, 1, 4, '종합302 멀티미디어실', 5);  
INSERT INTO teach VALUES ( 'MM4570', 'M100', 2022, 2, 4, '종합302 멀티미디어실', 5);  
INSERT INTO teach VALUES ( 'MM4570', 'M410', 2022, 2, 5, '종합302 멀티미디어실', 5);
INSERT INTO teach VALUES ( 'MM4571', 'M200', 2021, 2, 3, '6005 멀티미디어실', 5);
INSERT INTO teach VALUES ( 'MM4571', 'M200', 2022, 2, 3, '6005 멀티미디어실', 5);
INSERT INTO teach VALUES ( 'MM4571', 'M510', 2022, 2, 6, '종합302 멀티미디어실', 5);
INSERT INTO teach VALUES ( 'MM4572', 'M300', 2021, 2, 3, '종합302 멀티미디어실', 5);
INSERT INTO teach VALUES ( 'MM4572', 'M300', 2022, 2, 3, '종합302 멀티미디어실', 5);
INSERT INTO teach VALUES ( 'MM4572', 'C910', 2022, 2, 7, '종합302 멀티미디어실', 5);

commit;

set linesize 100