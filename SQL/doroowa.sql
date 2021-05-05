DROP USER c##team4 CASCADE;
CREATE USER c##team4 IDENTIFIED BY team4 DEFAULT TABLESPACE users TEMPORARY
TABLESPACE temp PROFILE DEFAULT;
GRANT CONNECT, RESOURCE TO c##team4;
GRANT CREATE VIEW, CREATE SYNONYM TO c##team4;
GRANT UNLIMITED TABLESPACE TO c##team4;
ALTER USER c##team4 ACCOUNT UNLOCK;


--------------------------------------------------------
--  파일이 생성됨 - 일요일-4월-04-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Sequence CHAPTER_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "C##TEAM4"."CHAPTER_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 1 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence NOTICE_NNUM_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "C##TEAM4"."NOTICE_NNUM_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence ORDERS_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "C##TEAM4"."ORDERS_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 81 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence REVIEW_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "C##TEAM4"."REVIEW_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 21 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Sequence VIDEO_ID_SEQ
--------------------------------------------------------

   CREATE SEQUENCE  "C##TEAM4"."VIDEO_ID_SEQ"  MINVALUE 1 MAXVALUE 9999999999999999999999999999 INCREMENT BY 1 START WITH 61 CACHE 20 NOORDER  NOCYCLE  NOKEEP  NOSCALE  GLOBAL ;
--------------------------------------------------------
--  DDL for Table AUCODE
--------------------------------------------------------

  CREATE TABLE "C##TEAM4"."AUCODE" 
   (	"CODE" VARCHAR2(20)
   ) ;
--------------------------------------------------------
--  DDL for Table BASKET
--------------------------------------------------------

  CREATE TABLE "C##TEAM4"."BASKET" 
   (	"LECTURE_TITLE" VARCHAR2(90), 
	"MEMBER_ID" VARCHAR2(90), 
	"CDATE" TIMESTAMP (6)
   ) ;
--------------------------------------------------------
--  DDL for Table CHAPTER
--------------------------------------------------------

  CREATE TABLE "C##TEAM4"."CHAPTER" 
   (	"CHAPTER_TITLE" VARCHAR2(100), 
	"LECTURE_TITLE" VARCHAR2(90), 
	"CHAPTER_ID" NUMBER(*,0)
   ) ;
--------------------------------------------------------
--  DDL for Table LECTURE
--------------------------------------------------------

  CREATE TABLE "C##TEAM4"."LECTURE" 
   (	"KINDS" VARCHAR2(10), 
	"LECTURE_TITLE" VARCHAR2(90), 
	"PRICE" NUMBER, 
	"OPENDATE" DATE, 
	"TEACHER_INTRO" VARCHAR2(300), 
	"LECTURE_INTRO" VARCHAR2(300), 
	"RATING" NUMBER DEFAULT 0, 
	"TYPE" VARCHAR2(20), 
	"MEMBER_ID" VARCHAR2(90), 
	"CLOSEDATE" DATE, 
	"HOURS" VARCHAR2(20), 
	"COUNT" VARCHAR2(20) DEFAULT 0, 
	"LOCATION" VARCHAR2(90), 
	"INTRO" CLOB, 
	"AMOUNT" NUMBER DEFAULT 999999999, 
	"THUMBNAIL" VARCHAR2(100), 
	"TEACHER_NICKNAME" VARCHAR2(20), 
	"STARTDATE" DATE, 
	"ENDDATE" DATE
   ) ;
--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE "C##TEAM4"."MEMBER" 
   (	"MEMBER_ID" VARCHAR2(90), 
	"NAME" VARCHAR2(30), 
	"PW" VARCHAR2(10), 
	"TEL" VARCHAR2(13), 
	"NICKNAME" VARCHAR2(30), 
	"GENDER" CHAR(3), 
	"JOB" VARCHAR2(30), 
	"REGION" VARCHAR2(150), 
	"BIRTH" DATE, 
	"CDATE" TIMESTAMP (6), 
	"UDATE" TIMESTAMP (6), 
	"TYPE" VARCHAR2(9)
   ) ;
--------------------------------------------------------
--  DDL for Table NOTICE
--------------------------------------------------------

  CREATE TABLE "C##TEAM4"."NOTICE" 
   (	"NNUM" NUMBER(10,0), 
	"NTITLE" VARCHAR2(150), 
	"NID" VARCHAR2(40), 
	"NNICKNAME" VARCHAR2(30), 
	"NCDATE" TIMESTAMP (6) DEFAULT systimestamp, 
	"NUDATE" TIMESTAMP (6) DEFAULT systimestamp, 
	"NHIT" NUMBER(5,0) DEFAULT 0, 
	"NCONTENT" CLOB, 
	"NCATEGORY" NUMBER(10,0)
   ) ;

   COMMENT ON COLUMN "C##TEAM4"."NOTICE"."NNUM" IS '공지사항번호';
   COMMENT ON COLUMN "C##TEAM4"."NOTICE"."NTITLE" IS '제목';
   COMMENT ON COLUMN "C##TEAM4"."NOTICE"."NID" IS '작성자ID';
   COMMENT ON COLUMN "C##TEAM4"."NOTICE"."NNICKNAME" IS '별칭';
   COMMENT ON COLUMN "C##TEAM4"."NOTICE"."NCDATE" IS '작성일';
   COMMENT ON COLUMN "C##TEAM4"."NOTICE"."NUDATE" IS '수정일';
   COMMENT ON COLUMN "C##TEAM4"."NOTICE"."NHIT" IS '조회수';
   COMMENT ON COLUMN "C##TEAM4"."NOTICE"."NCONTENT" IS '본문내용';
   COMMENT ON COLUMN "C##TEAM4"."NOTICE"."NCATEGORY" IS '분류카테고리';
--------------------------------------------------------
--  DDL for Table NOTICE_CATEGORY
--------------------------------------------------------

  CREATE TABLE "C##TEAM4"."NOTICE_CATEGORY" 
   (	"CID" NUMBER(4,0), 
	"CNAME" VARCHAR2(60), 
	"USE_YN" CHAR(1)
   ) ;

   COMMENT ON COLUMN "C##TEAM4"."NOTICE_CATEGORY"."CID" IS '분류코드';
   COMMENT ON COLUMN "C##TEAM4"."NOTICE_CATEGORY"."CNAME" IS '분류명';
   COMMENT ON COLUMN "C##TEAM4"."NOTICE_CATEGORY"."USE_YN" IS '사용유무(y,n)';
--------------------------------------------------------
--  DDL for Table NOTICE_UPLOAD_FILE
--------------------------------------------------------

  CREATE TABLE "C##TEAM4"."NOTICE_UPLOAD_FILE" 
   (	"FID" NUMBER(10,0), 
	"NNUM" NUMBER(10,0), 
	"FNAME" VARCHAR2(150), 
	"FSIZE" VARCHAR2(45), 
	"FTYPE" VARCHAR2(100), 
	"CDATE" TIMESTAMP (6) DEFAULT systimestamp, 
	"UDATE" TIMESTAMP (6) DEFAULT systimestamp, 
	"FDATA" BLOB
   ) ;

   COMMENT ON COLUMN "C##TEAM4"."NOTICE_UPLOAD_FILE"."FID" IS '파일아이디';
   COMMENT ON COLUMN "C##TEAM4"."NOTICE_UPLOAD_FILE"."NNUM" IS '공지사항 게시글 번호';
   COMMENT ON COLUMN "C##TEAM4"."NOTICE_UPLOAD_FILE"."FNAME" IS '파일명';
   COMMENT ON COLUMN "C##TEAM4"."NOTICE_UPLOAD_FILE"."FSIZE" IS '파일크기';
   COMMENT ON COLUMN "C##TEAM4"."NOTICE_UPLOAD_FILE"."FTYPE" IS '파일유형';
   COMMENT ON COLUMN "C##TEAM4"."NOTICE_UPLOAD_FILE"."CDATE" IS '작성일';
   COMMENT ON COLUMN "C##TEAM4"."NOTICE_UPLOAD_FILE"."UDATE" IS '수정일';
   COMMENT ON COLUMN "C##TEAM4"."NOTICE_UPLOAD_FILE"."FDATA" IS '첨부파일';
--------------------------------------------------------
--  DDL for Table ORDERS
--------------------------------------------------------

  CREATE TABLE "C##TEAM4"."ORDERS" 
   (	"ORDER_ID" NUMBER, 
	"STATUS" VARCHAR2(20), 
	"UDATE" TIMESTAMP (6), 
	"MEMBER_ID" VARCHAR2(40), 
	"LECTURE_TITLE" VARCHAR2(90), 
	"PROGRESSBAR" NUMBER DEFAULT 0, 
	"STUDYDATE" TIMESTAMP (6), 
	"ORDERDATE" TIMESTAMP (6), 
	"CANCELDATE" TIMESTAMP (6)
   ) ;
--------------------------------------------------------
--  DDL for Table PROGRESS
--------------------------------------------------------

  CREATE TABLE "C##TEAM4"."PROGRESS" 
   (	"LECTURE_TITLE" VARCHAR2(90), 
	"MEMBER_ID" VARCHAR2(90), 
	"VIDEO_ID" NUMBER, 
	"PROGRESS" NUMBER DEFAULT 0, 
	"STUDYDATE" TIMESTAMP (6)
   ) ;
--------------------------------------------------------
--  DDL for Table QNA
--------------------------------------------------------

  CREATE TABLE "C##TEAM4"."QNA" 
   (	"QNA_NUM" NUMBER(10,0), 
	"TITLE" VARCHAR2(150), 
	"CONTENT" CLOB, 
	"QGROUP" NUMBER(5,0), 
	"QSTEP" NUMBER(5,0), 
	"QINDENT" NUMBER(5,0), 
	"LECTURE_TITLE" VARCHAR2(90), 
	"NICKNAME" VARCHAR2(40), 
	"CDATE" TIMESTAMP (6), 
	"UDATE" TIMESTAMP (6)
   ) ;
--------------------------------------------------------
--  DDL for Table REVIEW
--------------------------------------------------------

  CREATE TABLE "C##TEAM4"."REVIEW" 
   (	"REVIEW_ID" NUMBER, 
	"RCONTENT" VARCHAR2(500), 
	"RATING" NUMBER, 
	"CDATE" TIMESTAMP (6), 
	"UDATE" TIMESTAMP (6), 
	"MEMBER_ID" VARCHAR2(40), 
	"LECTURE_TITLE" VARCHAR2(90)
   ) ;
--------------------------------------------------------
--  DDL for Table VIDEO
--------------------------------------------------------

  CREATE TABLE "C##TEAM4"."VIDEO" 
   (	"VIDEO_ID" NUMBER, 
	"TITLE" VARCHAR2(90), 
	"CONTENT" VARCHAR2(500), 
	"CDATE" TIMESTAMP (6), 
	"UDATE" TIMESTAMP (6), 
	"LECTURE_TITLE" VARCHAR2(90), 
	"FILENAME" VARCHAR2(100), 
	"SECRET" CHAR(1), 
	"CHAPTER_ID" NUMBER(*,0)
   ) 
  NO INMEMORY ("CHAPTER_ID") ;
--------------------------------------------------------
--  DDL for Table WISH
--------------------------------------------------------

  CREATE TABLE "C##TEAM4"."WISH" 
   (	"MEMBER_ID" VARCHAR2(90), 
	"LECTURE_TITLE" VARCHAR2(90), 
	"UDATE" TIMESTAMP (6)
   ) ;
REM INSERTING into C##TEAM4.AUCODE
SET DEFINE OFF;
REM INSERTING into C##TEAM4.BASKET
SET DEFINE OFF;
REM INSERTING into C##TEAM4.CHAPTER
SET DEFINE OFF;
Insert into C##TEAM4.CHAPTER (CHAPTER_TITLE,LECTURE_TITLE,CHAPTER_ID) values ('챕터1','자바',1);
Insert into C##TEAM4.CHAPTER (CHAPTER_TITLE,LECTURE_TITLE,CHAPTER_ID) values ('챕터2','자바',2);
Insert into C##TEAM4.CHAPTER (CHAPTER_TITLE,LECTURE_TITLE,CHAPTER_ID) values ('챕터3','자바',3);
Insert into C##TEAM4.CHAPTER (CHAPTER_TITLE,LECTURE_TITLE,CHAPTER_ID) values ('강의 소개(수정)','자바 입문자를 위한 강의',1);
Insert into C##TEAM4.CHAPTER (CHAPTER_TITLE,LECTURE_TITLE,CHAPTER_ID) values ('기본','자바 입문자를 위한 강의',2);
Insert into C##TEAM4.CHAPTER (CHAPTER_TITLE,LECTURE_TITLE,CHAPTER_ID) values ('조건문','자바 입문자를 위한 강의',3);
Insert into C##TEAM4.CHAPTER (CHAPTER_TITLE,LECTURE_TITLE,CHAPTER_ID) values ('반복문','자바 입문자를 위한 강의',4);
Insert into C##TEAM4.CHAPTER (CHAPTER_TITLE,LECTURE_TITLE,CHAPTER_ID) values ('if문','자바 기본을 위한 강의 1부',1);
Insert into C##TEAM4.CHAPTER (CHAPTER_TITLE,LECTURE_TITLE,CHAPTER_ID) values ('switch문','자바 기본을 위한 강의 1부',2);
REM INSERTING into C##TEAM4.LECTURE
SET DEFINE OFF;
Insert into C##TEAM4.LECTURE (KINDS,LECTURE_TITLE,PRICE,OPENDATE,TEACHER_INTRO,LECTURE_INTRO,RATING,TYPE,MEMBER_ID,CLOSEDATE,HOURS,COUNT,LOCATION,AMOUNT,THUMBNAIL,TEACHER_NICKNAME,STARTDATE,ENDDATE) values ('fitness','샤크코치의 근력 운동',99000,to_date('21/03/28','RR/MM/DD'),'크로스핏 선수 겸 코치로 8년 간 활동해 왔습니다. 여성 운동 전문가인 제가 누구보다 가장 확실하게 여성의 근력 운동을 알려드리겠습니다. ','왜 항상 얇고 가는 몸을 선호하시나요? 여자에게도 탄탄한 근육은 필수입니다. 생존을 위해 그리고 신체를 단련하기 위해 근력 운동은 해야 하는 필수 운동 중 하나입니다.',2,'on','teacher11@test.com',null,null,'0',null,999999999,'313sdasd.jpg',null,null,null);
Insert into C##TEAM4.LECTURE (KINDS,LECTURE_TITLE,PRICE,OPENDATE,TEACHER_INTRO,LECTURE_INTRO,RATING,TYPE,MEMBER_ID,CLOSEDATE,HOURS,COUNT,LOCATION,AMOUNT,THUMBNAIL,TEACHER_NICKNAME,STARTDATE,ENDDATE) values ('fitness','집에서 하는 홈트레이닝',99999,to_date('21/03/30','RR/MM/DD'),'강사소개 테스트','강의소개 테스트',0,'on','teacher2@test.com',null,null,'0',null,999999999,'321412.jpg',null,null,null);
Insert into C##TEAM4.LECTURE (KINDS,LECTURE_TITLE,PRICE,OPENDATE,TEACHER_INTRO,LECTURE_INTRO,RATING,TYPE,MEMBER_ID,CLOSEDATE,HOURS,COUNT,LOCATION,AMOUNT,THUMBNAIL,TEACHER_NICKNAME,STARTDATE,ENDDATE) values ('fitness','PT 도움 없이 집에서 운동하기',99000,to_date('21/03/26','RR/MM/DD'),'안녕하세요. 운동 크리에이터 윤성bro입니다. 2016년에 생활체육지도자 2급 보디빌딩 자격증을 딴 이후부터 지금까지 운동 트레이너로 활동하고 있습니다. 10대부터 40대까지 약 200분 넘는 분들의 운동을 코칭 해드렸어요.','퇴근하고 집에 오면 헬스장 가는게 너무 귀찮고 힘드셨던 분들, 다른 사람이 신경쓰여 제대로 운동하지 못하셨던 분들, PT 비용이 부담되셨던 분들에게 강력 추천합니다. ',0,'on',null,null,null,'0',null,999999999,null,null,null,null);
Insert into C##TEAM4.LECTURE (KINDS,LECTURE_TITLE,PRICE,OPENDATE,TEACHER_INTRO,LECTURE_INTRO,RATING,TYPE,MEMBER_ID,CLOSEDATE,HOURS,COUNT,LOCATION,AMOUNT,THUMBNAIL,TEACHER_NICKNAME,STARTDATE,ENDDATE) values ('it','파이썬 입문 오리지널',60000,to_date('21/02/17','RR/MM/DD'),'테스트2','파이썬파이썬파이썬파이썬파이썬파이썬파이썬파이썬파이썬',3,'on','teacher3@test.com',null,null,'0',null,9999999,'파이썬 입문 오리지널.jpg',null,null,null);
Insert into C##TEAM4.LECTURE (KINDS,LECTURE_TITLE,PRICE,OPENDATE,TEACHER_INTRO,LECTURE_INTRO,RATING,TYPE,MEMBER_ID,CLOSEDATE,HOURS,COUNT,LOCATION,AMOUNT,THUMBNAIL,TEACHER_NICKNAME,STARTDATE,ENDDATE) values ('it','자바 입문자를 위한 강의',20000,to_date('21/01/03','RR/MM/DD'),'안녕하세요, 자바 웹 개발자 정태현입니다. <br>여러 서비스를 만들며 경력을 이어가고 있고, <br>앞으로도 꾸준히 서비스를 만들며 좋은 개발자가 되려고 노력하고 있습니다.','입문자를 위한 자바 강의입니다. 처음 자바를 접하시는 분이 쉽게 이해하실 수 있도록 만들었습니다.',4,'on','teacher2@test.com',null,null,'0',null,9999999,'자바입문.png','JeongTaeHyun',null,null);
Insert into C##TEAM4.LECTURE (KINDS,LECTURE_TITLE,PRICE,OPENDATE,TEACHER_INTRO,LECTURE_INTRO,RATING,TYPE,MEMBER_ID,CLOSEDATE,HOURS,COUNT,LOCATION,AMOUNT,THUMBNAIL,TEACHER_NICKNAME,STARTDATE,ENDDATE) values ('it','자바 기본을 위한 강의 1부',20000,to_date('21/02/03','RR/MM/DD'),'안녕2','자바를 배우셔야만 하는 분들에게 도움이 되는 강의입니다. 자바 이론을 기본부터 차근차근 자세히 배우실 수 있습니다.',4.5,'on','teacher2@test.com',null,null,'0',null,null,'자바기본.png',null,null,null);
Insert into C##TEAM4.LECTURE (KINDS,LECTURE_TITLE,PRICE,OPENDATE,TEACHER_INTRO,LECTURE_INTRO,RATING,TYPE,MEMBER_ID,CLOSEDATE,HOURS,COUNT,LOCATION,AMOUNT,THUMBNAIL,TEACHER_NICKNAME,STARTDATE,ENDDATE) values ('it','실전 자바스크립트',20000,to_date('21/02/18','RR/MM/DD'),'sad','실무에서 자주 쓰이는 실전 자바 강의입니다.',4.3,'on','teacher3@test.com',null,null,'0',null,9999999,'실전.jpg',null,null,null);
Insert into C##TEAM4.LECTURE (KINDS,LECTURE_TITLE,PRICE,OPENDATE,TEACHER_INTRO,LECTURE_INTRO,RATING,TYPE,MEMBER_ID,CLOSEDATE,HOURS,COUNT,LOCATION,AMOUNT,THUMBNAIL,TEACHER_NICKNAME,STARTDATE,ENDDATE) values ('it','데이터베이스 입문',10000,to_date('21/02/11','RR/MM/DD'),'asd','asd',5,'off','hoondong@test.com',null,null,'0','인천광역시 남동구 백범로227번길 89-10',10,'데베1.jpg',null,to_date('21/06/20','RR/MM/DD'),to_date('21/07/20','RR/MM/DD'));
Insert into C##TEAM4.LECTURE (KINDS,LECTURE_TITLE,PRICE,OPENDATE,TEACHER_INTRO,LECTURE_INTRO,RATING,TYPE,MEMBER_ID,CLOSEDATE,HOURS,COUNT,LOCATION,AMOUNT,THUMBNAIL,TEACHER_NICKNAME,STARTDATE,ENDDATE) values ('it','실전 자바 스터디',20000,to_date('21/02/18','RR/MM/DD'),'KH정보교육원 출신 스타강사','실무에서 자주 쓰이는 실전 자바 강의입니다.',4,'off','hoondong@test.com',null,null,'10','울산 남구 삼산로35번길 19',12,'스터디.png',null,to_date('21/03/20','RR/MM/DD'),to_date('21/04/20','RR/MM/DD'));
Insert into C##TEAM4.LECTURE (KINDS,LECTURE_TITLE,PRICE,OPENDATE,TEACHER_INTRO,LECTURE_INTRO,RATING,TYPE,MEMBER_ID,CLOSEDATE,HOURS,COUNT,LOCATION,AMOUNT,THUMBNAIL,TEACHER_NICKNAME,STARTDATE,ENDDATE) values ('etc','림쑤홍의 커피철학',50000,to_date('21/03/15','RR/MM/DD'),'부경대 바리스타학과','그대의 커피향기 속으로 ...',5,'off','limsuhong@test.com',null,null,'0','울산광역시 옥동',15,'커피.jpg',null,to_date('21/04/20','RR/MM/DD'),to_date('21/05/20','RR/MM/DD'));
Insert into C##TEAM4.LECTURE (KINDS,LECTURE_TITLE,PRICE,OPENDATE,TEACHER_INTRO,LECTURE_INTRO,RATING,TYPE,MEMBER_ID,CLOSEDATE,HOURS,COUNT,LOCATION,AMOUNT,THUMBNAIL,TEACHER_NICKNAME,STARTDATE,ENDDATE) values ('create','팽수의 그림교실',350000,to_date('21/03/01','RR/MM/DD'),'안녕하세요 팽수입니다.','팽수가 한국에서 그림을 그립니다 참 쉽죠 ?',5,'off','pangpang@test.com',null,null,'5','서울특별시 강서구 화곡로 179',5,'펭수 그림.jpg',null,to_date('21/03/25','RR/MM/DD'),to_date('21/04/20','RR/MM/DD'));
Insert into C##TEAM4.LECTURE (KINDS,LECTURE_TITLE,PRICE,OPENDATE,TEACHER_INTRO,LECTURE_INTRO,RATING,TYPE,MEMBER_ID,CLOSEDATE,HOURS,COUNT,LOCATION,AMOUNT,THUMBNAIL,TEACHER_NICKNAME,STARTDATE,ENDDATE) values ('etc','팽수의 노래교실',150000,to_date('21/03/08','RR/MM/DD'),'안녕하세요 팽수입니다.','팽수가 남극의 추위에서 소리 지르며 터득한 고음 발라드 !',2,'off','pangpang@test.com',null,null,'15','서울특별시 강서구 화곡로 179',15,'펭하.jpg','팽수',to_date('21/03/20','RR/MM/DD'),to_date('21/04/20','RR/MM/DD'));
Insert into C##TEAM4.LECTURE (KINDS,LECTURE_TITLE,PRICE,OPENDATE,TEACHER_INTRO,LECTURE_INTRO,RATING,TYPE,MEMBER_ID,CLOSEDATE,HOURS,COUNT,LOCATION,AMOUNT,THUMBNAIL,TEACHER_NICKNAME,STARTDATE,ENDDATE) values ('it','데이터베이스 기초',20000,to_date('21/02/18','RR/MM/DD'),'KH정보교육원 출신 스타강사','데이터 베이스의 기초',5,'off','hoondong@test.com',null,null,'15','울산 남구 삼산로35번길 19',15,'데베2.jpg',null,to_date('21/05/20','RR/MM/DD'),to_date('21/06/10','RR/MM/DD'));
Insert into C##TEAM4.LECTURE (KINDS,LECTURE_TITLE,PRICE,OPENDATE,TEACHER_INTRO,LECTURE_INTRO,RATING,TYPE,MEMBER_ID,CLOSEDATE,HOURS,COUNT,LOCATION,AMOUNT,THUMBNAIL,TEACHER_NICKNAME,STARTDATE,ENDDATE) values ('etc','글로벌 주식 투자',99000,to_date('21/03/08','RR/MM/DD'),'EBS 사장','주식 투자의 기초에 대하여 ~',3,'off','pangpang@test.com',null,null,'8','서울특별시 강서구 화곡로 179',10,'글로벌주식.png',null,to_date('21/03/20','RR/MM/DD'),to_date('21/04/20','RR/MM/DD'));
Insert into C##TEAM4.LECTURE (KINDS,LECTURE_TITLE,PRICE,OPENDATE,TEACHER_INTRO,LECTURE_INTRO,RATING,TYPE,MEMBER_ID,CLOSEDATE,HOURS,COUNT,LOCATION,AMOUNT,THUMBNAIL,TEACHER_NICKNAME,STARTDATE,ENDDATE) values ('it','자바 마스터 과정',20000,to_date('21/02/18','RR/MM/DD'),'KH정보교육원 출신 스타강사','자바 기초부터 취업까지 ~ ',5,'off','hoondong@test.com',null,null,'20','울산 남구 삼산로35번길 19',20,'자바마스터.jpg',null,to_date('21/03/20','RR/MM/DD'),to_date('21/07/20','RR/MM/DD'));
Insert into C##TEAM4.LECTURE (KINDS,LECTURE_TITLE,PRICE,OPENDATE,TEACHER_INTRO,LECTURE_INTRO,RATING,TYPE,MEMBER_ID,CLOSEDATE,HOURS,COUNT,LOCATION,AMOUNT,THUMBNAIL,TEACHER_NICKNAME,STARTDATE,ENDDATE) values ('it','웹개발 입문자 과정',500000,to_date('21/03/01','RR/MM/DD'),'서울대학교 컴퓨터공학부 졸업 마이크로소프트 개발자입니다.','자바로 개발된 웹서비스가 많습니다 스프링으로 모두 같이 웹 개발합시다.',4,'on','gangsa@test.com',null,null,'0',null,999999999,null,null,null,null);
Insert into C##TEAM4.LECTURE (KINDS,LECTURE_TITLE,PRICE,OPENDATE,TEACHER_INTRO,LECTURE_INTRO,RATING,TYPE,MEMBER_ID,CLOSEDATE,HOURS,COUNT,LOCATION,AMOUNT,THUMBNAIL,TEACHER_NICKNAME,STARTDATE,ENDDATE) values ('it','안드로이드 앱 개발',1200000,to_date('21/03/01','RR/MM/DD'),'서울대학교 컴퓨터공학부 졸업 마이크로소프트 개발자입니다.','코틀린으로 안드로이드 어플 개발',5,'on','gangsa@test.com',null,null,'0',null,999999999,null,null,null,null);
Insert into C##TEAM4.LECTURE (KINDS,LECTURE_TITLE,PRICE,OPENDATE,TEACHER_INTRO,LECTURE_INTRO,RATING,TYPE,MEMBER_ID,CLOSEDATE,HOURS,COUNT,LOCATION,AMOUNT,THUMBNAIL,TEACHER_NICKNAME,STARTDATE,ENDDATE) values ('it','자바 머신러닝 weka 초급',20000,to_date('21/03/22','RR/MM/DD'),null,'설계/코딩 모두 구현가능 하도록 UI와 API 를 제공하는 Weka(웨카)를 소개합니다. 실무에 적용해도 전혀 손색이 없는 사례를 강의로 녹여냈습니다.',3,'on','teacher5@test.com',null,null,'0',null,999999999,'자바라.jpg',null,null,null);
Insert into C##TEAM4.LECTURE (KINDS,LECTURE_TITLE,PRICE,OPENDATE,TEACHER_INTRO,LECTURE_INTRO,RATING,TYPE,MEMBER_ID,CLOSEDATE,HOURS,COUNT,LOCATION,AMOUNT,THUMBNAIL,TEACHER_NICKNAME,STARTDATE,ENDDATE) values ('create','펭구연의 캐릭터 드로잉',49000,to_date('21/03/30','RR/MM/DD'),'찰나의 감정과 상황의 순간을 사랑하는 펭구연입니다.','어딘가 항상 부족했던 내 그림. 하지만 어느 부분이 잘못되었는지는 찾을 수 없어 답답하셨던 적이 있을 거예요. 저 또한 같은 과정을 거쳤고, 거치고 있습니다.',5,'on','panggu@test.com',null,null,'0',null,999999999,'펭구연.png','펭구연',null,null);
Insert into C##TEAM4.LECTURE (KINDS,LECTURE_TITLE,PRICE,OPENDATE,TEACHER_INTRO,LECTURE_INTRO,RATING,TYPE,MEMBER_ID,CLOSEDATE,HOURS,COUNT,LOCATION,AMOUNT,THUMBNAIL,TEACHER_NICKNAME,STARTDATE,ENDDATE) values ('create','로파이 힙합 클래스',99000,to_date('21/03/30','RR/MM/DD'),'저는 한국과 영국에서 작곡가로 활동하고 있으며, 한국에서는 미디시티 실용음악학원 이라는 미디 전문 교육기관에서 학생들을 교육하고 있습니다. ','여러분의 일상에 음악을 듣는것이, 그리고 그 음악을 만드는 일이 좋은 바이브를 가진 에너지가 되기를 진심으로 바랍니다.',3.4,'on','teacher10@test.com',null,null,'0',null,999999999,'로파이.jpg','디알비',null,null);
Insert into C##TEAM4.LECTURE (KINDS,LECTURE_TITLE,PRICE,OPENDATE,TEACHER_INTRO,LECTURE_INTRO,RATING,TYPE,MEMBER_ID,CLOSEDATE,HOURS,COUNT,LOCATION,AMOUNT,THUMBNAIL,TEACHER_NICKNAME,STARTDATE,ENDDATE) values ('etc','소수몽키와 함께하는 미국주식 입문',50000,to_date('21/03/30','RR/MM/DD'),null,null,4,'off','gangsa@test.com',null,null,'0','부산광역시 수영구 광서로10번길 21',10,'미국주식.jpg',null,to_date('21/03/20','RR/MM/DD'),to_date('21/04/01','RR/MM/DD'));
Insert into C##TEAM4.LECTURE (KINDS,LECTURE_TITLE,PRICE,OPENDATE,TEACHER_INTRO,LECTURE_INTRO,RATING,TYPE,MEMBER_ID,CLOSEDATE,HOURS,COUNT,LOCATION,AMOUNT,THUMBNAIL,TEACHER_NICKNAME,STARTDATE,ENDDATE) values ('it','자바 기본을 위한 강의 2부',20000,to_date('21/03/03','RR/MM/DD'),null,'자바 기본을 탄탄히 다지고 한 단계 업그레이드 하도록 도와주는 강의입니다.',4,'on','teacher2@test.com',null,null,'0',null,999999999,'자바기본2.png',null,null,null);
Insert into C##TEAM4.LECTURE (KINDS,LECTURE_TITLE,PRICE,OPENDATE,TEACHER_INTRO,LECTURE_INTRO,RATING,TYPE,MEMBER_ID,CLOSEDATE,HOURS,COUNT,LOCATION,AMOUNT,THUMBNAIL,TEACHER_NICKNAME,STARTDATE,ENDDATE) values ('it','코로나맵 개발자와 함께하는 지도서비스 만들기',26500,to_date('21/03/30','RR/MM/DD'),'안녕하세요, 개발자 이동훈입니다. <br>저는 이번에 1600만명이 이용하고, 4400만 조회수를 넘긴 코로나맵과 <br>마스크 실시간 재고현황을 보여주는 마스크맵을 기획하고 개발하였습니다.','코로나 맵 개발자가 알려주는 지도서비스 만들기입니다.',5,'on','test22@test.com',null,null,'0',null,999999999,'코로나맵.jpg',null,null,null);
REM INSERTING into C##TEAM4.MEMBER
SET DEFINE OFF;
Insert into C##TEAM4.MEMBER (MEMBER_ID,NAME,PW,TEL,NICKNAME,GENDER,JOB,REGION,BIRTH,CDATE,UDATE,TYPE) values ('test2@test.com','홍길동','1234','010-1111-1444','테스트용 학생',null,null,null,null,null,null,'수강생');
Insert into C##TEAM4.MEMBER (MEMBER_ID,NAME,PW,TEL,NICKNAME,GENDER,JOB,REGION,BIRTH,CDATE,UDATE,TYPE) values ('test11@test.com','테스트용','1234','010-1111-1446','테스트용',null,null,null,null,null,null,'수강생');
Insert into C##TEAM4.MEMBER (MEMBER_ID,NAME,PW,TEL,NICKNAME,GENDER,JOB,REGION,BIRTH,CDATE,UDATE,TYPE) values ('test3@test.com','테스트용 학생1','1234','010-1111-1445','테스트용 학생1',null,null,null,null,null,null,'수강생');
Insert into C##TEAM4.MEMBER (MEMBER_ID,NAME,PW,TEL,NICKNAME,GENDER,JOB,REGION,BIRTH,CDATE,UDATE,TYPE) values ('test23@test.com','선생쓰','1234','010-1111-1111','선생쓰',null,null,null,null,null,null,'강사');
Insert into C##TEAM4.MEMBER (MEMBER_ID,NAME,PW,TEL,NICKNAME,GENDER,JOB,REGION,BIRTH,CDATE,UDATE,TYPE) values ('teacher2@test.com','정태현','1234','010-2222-2223','JeongTaeHyun',null,null,'울산광역시',null,null,null,'강사');
Insert into C##TEAM4.MEMBER (MEMBER_ID,NAME,PW,TEL,NICKNAME,GENDER,JOB,REGION,BIRTH,CDATE,UDATE,TYPE) values ('student1@test.com','정가희','1234','010-1111-1111','학생1',null,null,'부산광역시',null,null,to_timestamp('21/03/31 10:04:18.570000000','RR/MM/DD HH24:MI:SSXFF'),'수강생');
Insert into C##TEAM4.MEMBER (MEMBER_ID,NAME,PW,TEL,NICKNAME,GENDER,JOB,REGION,BIRTH,CDATE,UDATE,TYPE) values ('teacher1@test.com','김민수','1234','010-1111-1112','강사1',null,null,'울산광역시',null,null,null,'강사');
Insert into C##TEAM4.MEMBER (MEMBER_ID,NAME,PW,TEL,NICKNAME,GENDER,JOB,REGION,BIRTH,CDATE,UDATE,TYPE) values ('test@test.com','정가희','1234','010-1111-1119','가희',null,null,'울산광역시',null,null,null,'수강생');
Insert into C##TEAM4.MEMBER (MEMBER_ID,NAME,PW,TEL,NICKNAME,GENDER,JOB,REGION,BIRTH,CDATE,UDATE,TYPE) values ('admin1@test.com','안재길','admin1234','010-1111-1113','관리자1','남',null,'인천광역시',null,null,null,'관리자');
Insert into C##TEAM4.MEMBER (MEMBER_ID,NAME,PW,TEL,NICKNAME,GENDER,JOB,REGION,BIRTH,CDATE,UDATE,TYPE) values ('teacher3@test.com','Jin Seo','1234','010-2222-2222','Jin Seo',null,null,'울산광역시',null,null,null,'강사');
Insert into C##TEAM4.MEMBER (MEMBER_ID,NAME,PW,TEL,NICKNAME,GENDER,JOB,REGION,BIRTH,CDATE,UDATE,TYPE) values ('teacher11@test.com','샤크코치','1234','010-1111-1466','샤크코치',null,null,'서울특별시 강남구 광평로34길 35, 123 (수서동, 강남 더샵 포레스트)',null,null,null,'강사');
Insert into C##TEAM4.MEMBER (MEMBER_ID,NAME,PW,TEL,NICKNAME,GENDER,JOB,REGION,BIRTH,CDATE,UDATE,TYPE) values ('test22@test.com','이동훈','1234','010-1111-1444','이동훈',null,null,'서울특별시 강남구 광평로34길 35, 123 (수서동, 강남 더샵 포레스트)',null,null,null,'강사');
Insert into C##TEAM4.MEMBER (MEMBER_ID,NAME,PW,TEL,NICKNAME,GENDER,JOB,REGION,BIRTH,CDATE,UDATE,TYPE) values ('teacher5@test.com','자바라머신러닝','1234','010-1111-2444','자바라머신러닝',null,null,'인천광역시',null,null,null,'강사');
Insert into C##TEAM4.MEMBER (MEMBER_ID,NAME,PW,TEL,NICKNAME,GENDER,JOB,REGION,BIRTH,CDATE,UDATE,TYPE) values ('panggu@test.com','펭구연','1234','010-1111-2344','펭구연',null,null,'서울특별시 강남구 광평로34길 35, 123 (수서동, 강남 더샵 포레스트)',null,null,null,'강사');
Insert into C##TEAM4.MEMBER (MEMBER_ID,NAME,PW,TEL,NICKNAME,GENDER,JOB,REGION,BIRTH,CDATE,UDATE,TYPE) values ('teacher10@test.com','디알비','1234','010-1211-2344','디알비',null,null,'서울특별시 강남구 광평로34길 35, 123 (수서동, 강남 더샵 포레스트)',null,null,null,'강사');
Insert into C##TEAM4.MEMBER (MEMBER_ID,NAME,PW,TEL,NICKNAME,GENDER,JOB,REGION,BIRTH,CDATE,UDATE,TYPE) values ('student2@test.com',null,null,'010-1131-1111','학생2',null,null,'부산광역시',null,null,null,'수강생');
Insert into C##TEAM4.MEMBER (MEMBER_ID,NAME,PW,TEL,NICKNAME,GENDER,JOB,REGION,BIRTH,CDATE,UDATE,TYPE) values ('student3@test.com','학생3',null,'010-1131-1111','학생3',null,null,'부산광역시',null,null,null,'수강생');
Insert into C##TEAM4.MEMBER (MEMBER_ID,NAME,PW,TEL,NICKNAME,GENDER,JOB,REGION,BIRTH,CDATE,UDATE,TYPE) values ('student4@test.com','학생4',null,'010-1131-1111','학생4',null,null,'서울특별시 강남구 광평로34길 35, 123 (수서동, 강남 더샵 포레스트)',null,null,null,'수강생');
Insert into C##TEAM4.MEMBER (MEMBER_ID,NAME,PW,TEL,NICKNAME,GENDER,JOB,REGION,BIRTH,CDATE,UDATE,TYPE) values ('student5@test.com','학생5',null,'010-1131-1111','학생5',null,null,'서울특별시 강남구 광평로34길 35, 123 (수서동, 강남 더샵 포레스트)',null,null,null,'수강생');
Insert into C##TEAM4.MEMBER (MEMBER_ID,NAME,PW,TEL,NICKNAME,GENDER,JOB,REGION,BIRTH,CDATE,UDATE,TYPE) values ('student6@test.com','학생6',null,'010-1131-1111','학생6',null,null,'서울특별시 강남구 광평로34길 35, 123 (수서동, 강남 더샵 포레스트)',null,null,null,'수강생');
Insert into C##TEAM4.MEMBER (MEMBER_ID,NAME,PW,TEL,NICKNAME,GENDER,JOB,REGION,BIRTH,CDATE,UDATE,TYPE) values ('student7@test.com','학생7',null,'010-1131-1111','학생7',null,null,'서울특별시 강남구 광평로34길 35, 123 (수서동, 강남 더샵 포레스트)',null,null,null,'수강생');
Insert into C##TEAM4.MEMBER (MEMBER_ID,NAME,PW,TEL,NICKNAME,GENDER,JOB,REGION,BIRTH,CDATE,UDATE,TYPE) values ('student8@test.com','학생8',null,'010-1131-1111','학생8',null,null,'서울특별시 강남구 광평로34길 35, 123 (수서동, 강남 더샵 포레스트)',null,null,null,'수강생');
Insert into C##TEAM4.MEMBER (MEMBER_ID,NAME,PW,TEL,NICKNAME,GENDER,JOB,REGION,BIRTH,CDATE,UDATE,TYPE) values ('student9@test.com','학생9',null,'010-1131-1111','학생9',null,null,'부산광역시',null,null,null,'수강생');
Insert into C##TEAM4.MEMBER (MEMBER_ID,NAME,PW,TEL,NICKNAME,GENDER,JOB,REGION,BIRTH,CDATE,UDATE,TYPE) values ('teacher100@test.com','선생님','1234','010-2222-2222','선생님',null,null,'울산광역시 울주군 범서읍 장검길 88, 203호 (울산 문수산 더샵)',null,null,null,'강사');
Insert into C##TEAM4.MEMBER (MEMBER_ID,NAME,PW,TEL,NICKNAME,GENDER,JOB,REGION,BIRTH,CDATE,UDATE,TYPE) values ('student100@test.com','학생100','1234','010-1111-1111','학생100',null,null,'울산광역시 울주군 삼남읍 강당로 63-74, 204호',null,null,to_timestamp('21/03/31 10:42:45.496000000','RR/MM/DD HH24:MI:SSXFF'),'수강생');
REM INSERTING into C##TEAM4.NOTICE
SET DEFINE OFF;
Insert into C##TEAM4.NOTICE (NNUM,NTITLE,NID,NNICKNAME,NCDATE,NUDATE,NHIT,NCATEGORY) values (81,'[공지사항] 디코방 삭제','test5@test.com','관리자',to_timestamp('21/03/29 10:20:20.097000000','RR/MM/DD HH24:MI:SSXFF'),to_timestamp('21/03/29 10:20:20.097000000','RR/MM/DD HH24:MI:SSXFF'),11,1010);
Insert into C##TEAM4.NOTICE (NNUM,NTITLE,NID,NNICKNAME,NCDATE,NUDATE,NHIT,NCATEGORY) values (42,'창세기게시글ju생성테스트3','test5@test.com','관리자2',to_timestamp('21/03/17 18:55:09.657000000','RR/MM/DD HH24:MI:SSXFF'),to_timestamp('21/03/17 18:55:09.657000000','RR/MM/DD HH24:MI:SSXFF'),9,1010);
Insert into C##TEAM4.NOTICE (NNUM,NTITLE,NID,NNICKNAME,NCDATE,NUDATE,NHIT,NCATEGORY) values (1,'임수홍 강사 은퇴','test5@test.com','관리자',to_timestamp('21/03/11 16:17:20.261591000','RR/MM/DD HH24:MI:SSXFF'),to_timestamp('21/03/11 16:17:44.137000000','RR/MM/DD HH24:MI:SSXFF'),8,1010);
Insert into C##TEAM4.NOTICE (NNUM,NTITLE,NID,NNICKNAME,NCDATE,NUDATE,NHIT,NCATEGORY) values (34,'ㅇㅇ',null,null,to_timestamp('21/03/17 15:30:08.691000000','RR/MM/DD HH24:MI:SSXFF'),to_timestamp('21/03/17 15:30:08.691000000','RR/MM/DD HH24:MI:SSXFF'),12,1020);
Insert into C##TEAM4.NOTICE (NNUM,NTITLE,NID,NNICKNAME,NCDATE,NUDATE,NHIT,NCATEGORY) values (45,'ddddd','test5@test.com','관리자',to_timestamp('21/03/18 10:49:52.125000000','RR/MM/DD HH24:MI:SSXFF'),to_timestamp('21/03/18 10:49:52.125000000','RR/MM/DD HH24:MI:SSXFF'),6,1010);
Insert into C##TEAM4.NOTICE (NNUM,NTITLE,NID,NNICKNAME,NCDATE,NUDATE,NHIT,NCATEGORY) values (46,'ck에디터로 작성한글11','test5@test.com','관리자',to_timestamp('21/03/18 11:09:10.665000000','RR/MM/DD HH24:MI:SSXFF'),to_timestamp('21/03/18 11:09:10.665000000','RR/MM/DD HH24:MI:SSXFF'),14,1010);
Insert into C##TEAM4.NOTICE (NNUM,NTITLE,NID,NNICKNAME,NCDATE,NUDATE,NHIT,NCATEGORY) values (48,'ㅗ솟','test5@test.com','관리자',to_timestamp('21/03/18 11:23:03.075000000','RR/MM/DD HH24:MI:SSXFF'),to_timestamp('21/03/18 11:23:03.075000000','RR/MM/DD HH24:MI:SSXFF'),3,1010);
Insert into C##TEAM4.NOTICE (NNUM,NTITLE,NID,NNICKNAME,NCDATE,NUDATE,NHIT,NCATEGORY) values (49,'ck에디터로 쓴글 21','test5@test.com','관리자',to_timestamp('21/03/18 12:15:23.521000000','RR/MM/DD HH24:MI:SSXFF'),to_timestamp('21/03/18 12:15:23.521000000','RR/MM/DD HH24:MI:SSXFF'),6,1010);
Insert into C##TEAM4.NOTICE (NNUM,NTITLE,NID,NNICKNAME,NCDATE,NUDATE,NHIT,NCATEGORY) values (50,'ddd','test5@test.com','관리자',to_timestamp('21/03/18 12:16:17.118000000','RR/MM/DD HH24:MI:SSXFF'),to_timestamp('21/03/18 12:16:17.118000000','RR/MM/DD HH24:MI:SSXFF'),1,1020);
Insert into C##TEAM4.NOTICE (NNUM,NTITLE,NID,NNICKNAME,NCDATE,NUDATE,NHIT,NCATEGORY) values (61,'수정테스트용 글1','test5@test.com','관리자',to_timestamp('21/03/18 15:06:53.408000000','RR/MM/DD HH24:MI:SSXFF'),to_timestamp('21/03/18 15:06:53.408000000','RR/MM/DD HH24:MI:SSXFF'),5,1010);
Insert into C##TEAM4.NOTICE (NNUM,NTITLE,NID,NNICKNAME,NCDATE,NUDATE,NHIT,NCATEGORY) values (41,'게시글ju생성테스트2','test5@test.com','관리자2',to_timestamp('21/03/17 18:06:35.162000000','RR/MM/DD HH24:MI:SSXFF'),to_timestamp('21/03/17 18:06:35.162000000','RR/MM/DD HH24:MI:SSXFF'),0,1010);
Insert into C##TEAM4.NOTICE (NNUM,NTITLE,NID,NNICKNAME,NCDATE,NUDATE,NHIT,NCATEGORY) values (31,'ㄹㄹㄹ','test5@test.com','관리자',to_timestamp('21/03/17 15:01:54.261000000','RR/MM/DD HH24:MI:SSXFF'),to_timestamp('21/03/17 15:01:54.261000000','RR/MM/DD HH24:MI:SSXFF'),15,1020);
Insert into C##TEAM4.NOTICE (NNUM,NTITLE,NID,NNICKNAME,NCDATE,NUDATE,NHIT,NCATEGORY) values (32,'스마트에디터로 쓴글','test5@test.com','관리자',to_timestamp('21/03/17 15:07:46.012000000','RR/MM/DD HH24:MI:SSXFF'),to_timestamp('21/03/17 15:07:46.012000000','RR/MM/DD HH24:MI:SSXFF'),4,1010);
Insert into C##TEAM4.NOTICE (NNUM,NTITLE,NID,NNICKNAME,NCDATE,NUDATE,NHIT,NCATEGORY) values (33,'ㄱㅎㄱㄷㅎㄱㅎ','test5@test.com','관리자',to_timestamp('21/03/17 15:22:49.017000000','RR/MM/DD HH24:MI:SSXFF'),to_timestamp('21/03/17 15:22:49.017000000','RR/MM/DD HH24:MI:SSXFF'),2,1010);
Insert into C##TEAM4.NOTICE (NNUM,NTITLE,NID,NNICKNAME,NCDATE,NUDATE,NHIT,NCATEGORY) values (35,'ddd','test5@test.com','관리자',to_timestamp('21/03/17 15:30:48.367000000','RR/MM/DD HH24:MI:SSXFF'),to_timestamp('21/03/17 15:30:48.367000000','RR/MM/DD HH24:MI:SSXFF'),0,1010);
Insert into C##TEAM4.NOTICE (NNUM,NTITLE,NID,NNICKNAME,NCDATE,NUDATE,NHIT,NCATEGORY) values (36,'1111111111111','test5@test.com','관리자',to_timestamp('21/03/17 15:31:08.917000000','RR/MM/DD HH24:MI:SSXFF'),to_timestamp('21/03/17 15:31:08.917000000','RR/MM/DD HH24:MI:SSXFF'),2,1020);
Insert into C##TEAM4.NOTICE (NNUM,NTITLE,NID,NNICKNAME,NCDATE,NUDATE,NHIT,NCATEGORY) values (37,'sadsafawefasf','test5@test.com','관리자',to_timestamp('21/03/17 16:06:54.846000000','RR/MM/DD HH24:MI:SSXFF'),to_timestamp('21/03/17 16:06:54.846000000','RR/MM/DD HH24:MI:SSXFF'),1,1010);
Insert into C##TEAM4.NOTICE (NNUM,NTITLE,NID,NNICKNAME,NCDATE,NUDATE,NHIT,NCATEGORY) values (29,'ㅇㅇㅇㅇ','test5@test.com','관리자',to_timestamp('21/03/17 14:29:00.429000000','RR/MM/DD HH24:MI:SSXFF'),to_timestamp('21/03/17 14:29:00.429000000','RR/MM/DD HH24:MI:SSXFF'),0,1010);
Insert into C##TEAM4.NOTICE (NNUM,NTITLE,NID,NNICKNAME,NCDATE,NUDATE,NHIT,NCATEGORY) values (30,'ㅇㅇㅇㅇ','test5@test.com','관리자',to_timestamp('21/03/17 14:30:31.871000000','RR/MM/DD HH24:MI:SSXFF'),to_timestamp('21/03/17 14:30:31.871000000','RR/MM/DD HH24:MI:SSXFF'),2,1010);
Insert into C##TEAM4.NOTICE (NNUM,NTITLE,NID,NNICKNAME,NCDATE,NUDATE,NHIT,NCATEGORY) values (44,'juit생성테스트3','test5@test.com','관리자2',to_timestamp('21/03/18 10:36:12.383000000','RR/MM/DD HH24:MI:SSXFF'),to_timestamp('21/03/18 10:36:12.383000000','RR/MM/DD HH24:MI:SSXFF'),0,1010);
Insert into C##TEAM4.NOTICE (NNUM,NTITLE,NID,NNICKNAME,NCDATE,NUDATE,NHIT,NCATEGORY) values (43,'창세기게시글ju생성테스트3','test5@test.com','관리자2',to_timestamp('21/03/18 10:35:58.853000000','RR/MM/DD HH24:MI:SSXFF'),to_timestamp('21/03/18 10:35:58.853000000','RR/MM/DD HH24:MI:SSXFF'),2,1010);
REM INSERTING into C##TEAM4.NOTICE_CATEGORY
SET DEFINE OFF;
Insert into C##TEAM4.NOTICE_CATEGORY (CID,CNAME,USE_YN) values (1010,'공지사항','y');
Insert into C##TEAM4.NOTICE_CATEGORY (CID,CNAME,USE_YN) values (1020,'이벤트','y');
REM INSERTING into C##TEAM4.NOTICE_UPLOAD_FILE
SET DEFINE OFF;
REM INSERTING into C##TEAM4.ORDERS
SET DEFINE OFF;
Insert into C##TEAM4.ORDERS (ORDER_ID,STATUS,UDATE,MEMBER_ID,LECTURE_TITLE,PROGRESSBAR,STUDYDATE,ORDERDATE,CANCELDATE) values (181,'구매완료',to_timestamp('21/03/24 15:16:13.963000000','RR/MM/DD HH24:MI:SSXFF'),'student1@test.com','자바 입문자를 위한 강의',0,null,to_timestamp('21/03/24 15:16:13.963000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into C##TEAM4.ORDERS (ORDER_ID,STATUS,UDATE,MEMBER_ID,LECTURE_TITLE,PROGRESSBAR,STUDYDATE,ORDERDATE,CANCELDATE) values (182,'구매완료',to_timestamp('21/03/24 15:16:13.963000000','RR/MM/DD HH24:MI:SSXFF'),'student1@test.com','파이썬 입문 오리지널',0,null,to_timestamp('21/03/24 15:16:13.963000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into C##TEAM4.ORDERS (ORDER_ID,STATUS,UDATE,MEMBER_ID,LECTURE_TITLE,PROGRESSBAR,STUDYDATE,ORDERDATE,CANCELDATE) values (181,'구매완료',to_timestamp('21/03/24 15:16:13.963000000','RR/MM/DD HH24:MI:SSXFF'),'student2@test.com','자바 입문자를 위한 강의',0,null,to_timestamp('21/03/24 15:16:13.963000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into C##TEAM4.ORDERS (ORDER_ID,STATUS,UDATE,MEMBER_ID,LECTURE_TITLE,PROGRESSBAR,STUDYDATE,ORDERDATE,CANCELDATE) values (181,'구매완료',to_timestamp('21/03/24 15:16:13.963000000','RR/MM/DD HH24:MI:SSXFF'),'student3@test.com','자바 입문자를 위한 강의',0,null,to_timestamp('21/03/24 15:16:13.963000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into C##TEAM4.ORDERS (ORDER_ID,STATUS,UDATE,MEMBER_ID,LECTURE_TITLE,PROGRESSBAR,STUDYDATE,ORDERDATE,CANCELDATE) values (181,'구매완료',to_timestamp('21/03/24 15:16:13.963000000','RR/MM/DD HH24:MI:SSXFF'),'student4@test.com','자바 입문자를 위한 강의',0,null,to_timestamp('21/03/24 15:16:13.963000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into C##TEAM4.ORDERS (ORDER_ID,STATUS,UDATE,MEMBER_ID,LECTURE_TITLE,PROGRESSBAR,STUDYDATE,ORDERDATE,CANCELDATE) values (181,'구매완료',to_timestamp('21/03/24 15:16:13.963000000','RR/MM/DD HH24:MI:SSXFF'),'student5@test.com','자바 입문자를 위한 강의',0,null,to_timestamp('21/03/24 15:16:13.963000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into C##TEAM4.ORDERS (ORDER_ID,STATUS,UDATE,MEMBER_ID,LECTURE_TITLE,PROGRESSBAR,STUDYDATE,ORDERDATE,CANCELDATE) values (182,'구매완료',to_timestamp('21/03/24 15:16:13.963000000','RR/MM/DD HH24:MI:SSXFF'),'student3@test.com','파이썬 입문 오리지널',0,null,to_timestamp('21/03/24 15:16:13.963000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into C##TEAM4.ORDERS (ORDER_ID,STATUS,UDATE,MEMBER_ID,LECTURE_TITLE,PROGRESSBAR,STUDYDATE,ORDERDATE,CANCELDATE) values (182,'구매완료',to_timestamp('21/03/24 15:16:13.963000000','RR/MM/DD HH24:MI:SSXFF'),'student3@test.com','샤크코치의 근력 운동',0,null,to_timestamp('21/03/24 15:16:13.963000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into C##TEAM4.ORDERS (ORDER_ID,STATUS,UDATE,MEMBER_ID,LECTURE_TITLE,PROGRESSBAR,STUDYDATE,ORDERDATE,CANCELDATE) values (182,'구매완료',to_timestamp('21/03/24 15:16:13.963000000','RR/MM/DD HH24:MI:SSXFF'),'student1@test.com','샤크코치의 근력 운동',0,null,to_timestamp('21/03/24 15:16:13.963000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into C##TEAM4.ORDERS (ORDER_ID,STATUS,UDATE,MEMBER_ID,LECTURE_TITLE,PROGRESSBAR,STUDYDATE,ORDERDATE,CANCELDATE) values (182,'구매완료',to_timestamp('21/03/24 15:16:13.963000000','RR/MM/DD HH24:MI:SSXFF'),'student2@test.com','샤크코치의 근력 운동',0,null,to_timestamp('21/03/24 15:16:13.963000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into C##TEAM4.ORDERS (ORDER_ID,STATUS,UDATE,MEMBER_ID,LECTURE_TITLE,PROGRESSBAR,STUDYDATE,ORDERDATE,CANCELDATE) values (182,'구매완료',to_timestamp('21/03/24 15:16:13.963000000','RR/MM/DD HH24:MI:SSXFF'),'student11@test.com','샤크코치의 근력 운동',0,null,to_timestamp('21/03/24 15:16:13.963000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into C##TEAM4.ORDERS (ORDER_ID,STATUS,UDATE,MEMBER_ID,LECTURE_TITLE,PROGRESSBAR,STUDYDATE,ORDERDATE,CANCELDATE) values (182,'구매완료',to_timestamp('21/03/24 15:16:13.963000000','RR/MM/DD HH24:MI:SSXFF'),'student12@test.com','샤크코치의 근력 운동',0,null,to_timestamp('21/03/24 15:16:13.963000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into C##TEAM4.ORDERS (ORDER_ID,STATUS,UDATE,MEMBER_ID,LECTURE_TITLE,PROGRESSBAR,STUDYDATE,ORDERDATE,CANCELDATE) values (182,'구매완료',to_timestamp('21/03/24 15:16:13.963000000','RR/MM/DD HH24:MI:SSXFF'),'student13@test.com','샤크코치의 근력 운동',0,null,to_timestamp('21/03/24 15:16:13.963000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into C##TEAM4.ORDERS (ORDER_ID,STATUS,UDATE,MEMBER_ID,LECTURE_TITLE,PROGRESSBAR,STUDYDATE,ORDERDATE,CANCELDATE) values (182,'구매완료',to_timestamp('21/03/24 15:16:13.963000000','RR/MM/DD HH24:MI:SSXFF'),'student15@test.com','샤크코치의 근력 운동',0,null,to_timestamp('21/03/24 15:16:13.963000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into C##TEAM4.ORDERS (ORDER_ID,STATUS,UDATE,MEMBER_ID,LECTURE_TITLE,PROGRESSBAR,STUDYDATE,ORDERDATE,CANCELDATE) values (181,'구매완료',to_timestamp('21/03/24 15:16:13.963000000','RR/MM/DD HH24:MI:SSXFF'),'student1@test.com','자바2',0,null,to_timestamp('21/03/24 15:16:13.963000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into C##TEAM4.ORDERS (ORDER_ID,STATUS,UDATE,MEMBER_ID,LECTURE_TITLE,PROGRESSBAR,STUDYDATE,ORDERDATE,CANCELDATE) values (181,'구매완료',to_timestamp('21/03/24 15:16:13.963000000','RR/MM/DD HH24:MI:SSXFF'),'student2@test.com','자바2',0,null,to_timestamp('21/03/24 15:16:13.963000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into C##TEAM4.ORDERS (ORDER_ID,STATUS,UDATE,MEMBER_ID,LECTURE_TITLE,PROGRESSBAR,STUDYDATE,ORDERDATE,CANCELDATE) values (181,'구매완료',to_timestamp('21/03/24 15:16:13.963000000','RR/MM/DD HH24:MI:SSXFF'),'student2@test.com','실전 자바스크립트',0,null,to_timestamp('21/03/24 15:16:13.963000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into C##TEAM4.ORDERS (ORDER_ID,STATUS,UDATE,MEMBER_ID,LECTURE_TITLE,PROGRESSBAR,STUDYDATE,ORDERDATE,CANCELDATE) values (181,'구매완료',to_timestamp('21/03/24 15:16:13.963000000','RR/MM/DD HH24:MI:SSXFF'),'student2@test.com','코로나맵 개발자와 함께하는 지도서비스 만들기',0,null,to_timestamp('21/03/24 15:16:13.963000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into C##TEAM4.ORDERS (ORDER_ID,STATUS,UDATE,MEMBER_ID,LECTURE_TITLE,PROGRESSBAR,STUDYDATE,ORDERDATE,CANCELDATE) values (181,'구매완료',to_timestamp('21/03/24 15:16:13.963000000','RR/MM/DD HH24:MI:SSXFF'),'student3@test.com','코로나맵 개발자와 함께하는 지도서비스 만들기',0,null,to_timestamp('21/03/24 15:16:13.963000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into C##TEAM4.ORDERS (ORDER_ID,STATUS,UDATE,MEMBER_ID,LECTURE_TITLE,PROGRESSBAR,STUDYDATE,ORDERDATE,CANCELDATE) values (181,'구매완료',to_timestamp('21/03/24 15:16:13.963000000','RR/MM/DD HH24:MI:SSXFF'),'student1@test.com','코로나맵 개발자와 함께하는 지도서비스 만들기',0,null,to_timestamp('21/03/24 15:16:13.963000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into C##TEAM4.ORDERS (ORDER_ID,STATUS,UDATE,MEMBER_ID,LECTURE_TITLE,PROGRESSBAR,STUDYDATE,ORDERDATE,CANCELDATE) values (41,'구매완료',to_timestamp('21/03/31 09:21:25.618000000','RR/MM/DD HH24:MI:SSXFF'),'test@test.com','코로나맵 개발자와 함께하는 지도서비스 만들기',0,null,to_timestamp('21/03/31 09:21:25.618000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into C##TEAM4.ORDERS (ORDER_ID,STATUS,UDATE,MEMBER_ID,LECTURE_TITLE,PROGRESSBAR,STUDYDATE,ORDERDATE,CANCELDATE) values (42,'구매완료',to_timestamp('21/03/31 09:21:25.618000000','RR/MM/DD HH24:MI:SSXFF'),'test@test.com','로파이 힙합 클래스',0,null,to_timestamp('21/03/31 09:21:25.618000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into C##TEAM4.ORDERS (ORDER_ID,STATUS,UDATE,MEMBER_ID,LECTURE_TITLE,PROGRESSBAR,STUDYDATE,ORDERDATE,CANCELDATE) values (43,'구매완료',to_timestamp('21/03/31 09:21:25.618000000','RR/MM/DD HH24:MI:SSXFF'),'test@test.com','펭구연의 캐릭터 드로잉',0,null,to_timestamp('21/03/31 09:21:25.618000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into C##TEAM4.ORDERS (ORDER_ID,STATUS,UDATE,MEMBER_ID,LECTURE_TITLE,PROGRESSBAR,STUDYDATE,ORDERDATE,CANCELDATE) values (66,'구매완료',to_timestamp('21/03/31 04:44:38.522000000','RR/MM/DD HH24:MI:SSXFF'),'student1@test.com','팽수의 노래교실',0,null,to_timestamp('21/03/31 04:44:38.522000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into C##TEAM4.ORDERS (ORDER_ID,STATUS,UDATE,MEMBER_ID,LECTURE_TITLE,PROGRESSBAR,STUDYDATE,ORDERDATE,CANCELDATE) values (23,'구매취소',to_timestamp('21/03/31 05:06:44.000000000','RR/MM/DD HH24:MI:SSXFF'),'test@test.com','펭구연의 캐릭터 드로잉',0,null,to_timestamp('21/03/31 05:06:21.956000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into C##TEAM4.ORDERS (ORDER_ID,STATUS,UDATE,MEMBER_ID,LECTURE_TITLE,PROGRESSBAR,STUDYDATE,ORDERDATE,CANCELDATE) values (21,'구매완료',to_timestamp('21/03/31 04:44:38.522000000','RR/MM/DD HH24:MI:SSXFF'),'student2@test.com','펭구연의 캐릭터 드로잉',0,null,to_timestamp('21/03/31 04:44:38.522000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into C##TEAM4.ORDERS (ORDER_ID,STATUS,UDATE,MEMBER_ID,LECTURE_TITLE,PROGRESSBAR,STUDYDATE,ORDERDATE,CANCELDATE) values (33,'구매완료',to_timestamp('21/03/31 04:44:38.522000000','RR/MM/DD HH24:MI:SSXFF'),'student1@test.com','펭구연의 캐릭터 드로잉',0,null,to_timestamp('21/03/31 04:44:38.522000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into C##TEAM4.ORDERS (ORDER_ID,STATUS,UDATE,MEMBER_ID,LECTURE_TITLE,PROGRESSBAR,STUDYDATE,ORDERDATE,CANCELDATE) values (44,'구매완료',to_timestamp('21/03/31 04:44:38.522000000','RR/MM/DD HH24:MI:SSXFF'),'student3@test.com','펭구연의 캐릭터 드로잉',0,null,to_timestamp('21/03/31 04:44:38.522000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into C##TEAM4.ORDERS (ORDER_ID,STATUS,UDATE,MEMBER_ID,LECTURE_TITLE,PROGRESSBAR,STUDYDATE,ORDERDATE,CANCELDATE) values (100,'구매완료',to_timestamp('21/03/31 04:44:38.522000000','RR/MM/DD HH24:MI:SSXFF'),'student6@test.com','자바 입문자를 위한 강의',0,null,to_timestamp('21/03/31 04:44:38.522000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into C##TEAM4.ORDERS (ORDER_ID,STATUS,UDATE,MEMBER_ID,LECTURE_TITLE,PROGRESSBAR,STUDYDATE,ORDERDATE,CANCELDATE) values (1,'구매완료',to_timestamp('21/03/31 04:44:38.522000000','RR/MM/DD HH24:MI:SSXFF'),'test@test.com','자바 입문자를 위한 강의',100,to_timestamp('21/03/31 09:33:09.000000000','RR/MM/DD HH24:MI:SSXFF'),to_timestamp('21/03/31 04:44:38.522000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into C##TEAM4.ORDERS (ORDER_ID,STATUS,UDATE,MEMBER_ID,LECTURE_TITLE,PROGRESSBAR,STUDYDATE,ORDERDATE,CANCELDATE) values (101,'구매완료',to_timestamp('21/03/31 04:44:38.522000000','RR/MM/DD HH24:MI:SSXFF'),'student7@test.com','자바 입문자를 위한 강의',0,null,to_timestamp('21/03/31 04:44:38.522000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into C##TEAM4.ORDERS (ORDER_ID,STATUS,UDATE,MEMBER_ID,LECTURE_TITLE,PROGRESSBAR,STUDYDATE,ORDERDATE,CANCELDATE) values (61,'구매완료',to_timestamp('21/03/31 09:47:51.865000000','RR/MM/DD HH24:MI:SSXFF'),'test@test.com','팽수의 노래교실',0,null,to_timestamp('21/03/31 09:47:51.865000000','RR/MM/DD HH24:MI:SSXFF'),null);
REM INSERTING into C##TEAM4.PROGRESS
SET DEFINE OFF;
Insert into C##TEAM4.PROGRESS (LECTURE_TITLE,MEMBER_ID,VIDEO_ID,PROGRESS,STUDYDATE) values ('자바 입문자를 위한 강의','test@test.com',1,1,to_timestamp('21/03/31 09:33:09.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into C##TEAM4.PROGRESS (LECTURE_TITLE,MEMBER_ID,VIDEO_ID,PROGRESS,STUDYDATE) values ('자바 입문자를 위한 강의','test@test.com',2,1,to_timestamp('21/03/31 09:06:03.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into C##TEAM4.PROGRESS (LECTURE_TITLE,MEMBER_ID,VIDEO_ID,PROGRESS,STUDYDATE) values ('자바 입문자를 위한 강의','test@test.com',21,1,to_timestamp('21/03/31 09:32:56.000000000','RR/MM/DD HH24:MI:SSXFF'));
Insert into C##TEAM4.PROGRESS (LECTURE_TITLE,MEMBER_ID,VIDEO_ID,PROGRESS,STUDYDATE) values ('자바 입문자를 위한 강의','test@test.com',22,1,null);
REM INSERTING into C##TEAM4.QNA
SET DEFINE OFF;
Insert into C##TEAM4.QNA (QNA_NUM,TITLE,QGROUP,QSTEP,QINDENT,LECTURE_TITLE,NICKNAME,CDATE,UDATE) values (1,'테스트1',1,1,null,'자바 입문자를 위한 강의','투슬리스',to_timestamp('21/02/18 15:06:14.000000000','RR/MM/DD HH24:MI:SSXFF'),null);
Insert into C##TEAM4.QNA (QNA_NUM,TITLE,QGROUP,QSTEP,QINDENT,LECTURE_TITLE,NICKNAME,CDATE,UDATE) values (2,'커리큘럼 관련1',1,1,null,'자바 입문자를 위한 강의','투슬리스',to_timestamp('21/02/18 15:07:04.000000000','RR/MM/DD HH24:MI:SSXFF'),null);
REM INSERTING into C##TEAM4.REVIEW
SET DEFINE OFF;
Insert into C##TEAM4.REVIEW (REVIEW_ID,RCONTENT,RATING,CDATE,UDATE,MEMBER_ID,LECTURE_TITLE) values (350,'입문 하는 사람들이기 때문에 따라치기는 하지만 정확한 구조나 함수들이 무슨 역할을 하는지에 대해서 부연설명을 더 해주시면 입문하시는 분들에게 훨씬 도움이 되고 재미가 있는 강의가 될 것 같아요 감사했습니다 !',4,to_timestamp('21/03/18 13:21:53.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'student1@test.com','자바 기본을 위한 강의 1부');
Insert into C##TEAM4.REVIEW (REVIEW_ID,RCONTENT,RATING,CDATE,UDATE,MEMBER_ID,LECTURE_TITLE) values (362,'제가 정말 원했던 강의였습니다!! 이런 강의가 있으면 좋겠다라고 생각했었는데 강의 내용도 좋고, 저에게는 많은 도움이 되었습니다',5,to_timestamp('21/03/18 13:21:53.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'test@test.com','소수몽키와 함께하는 미국주식 입문');
Insert into C##TEAM4.REVIEW (REVIEW_ID,RCONTENT,RATING,CDATE,UDATE,MEMBER_ID,LECTURE_TITLE) values (500,'펭수 노래 잘 부르네요. 다음 기수에도 또 강의 듣고 싶어요. 펭수 화이팅',2,to_timestamp('21/03/30 13:21:53.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'student1@test.com','팽수의 노래교실');
Insert into C##TEAM4.REVIEW (REVIEW_ID,RCONTENT,RATING,CDATE,UDATE,MEMBER_ID,LECTURE_TITLE) values (327,'좋은 강의 감사합니다. 현업이야기랑 곁가지 이야기들이 너무 재밌었어요 ㅎㅎㅎㅎ 실습강의라서 그런지 이론부분의 설명이 조금 부족한게 아쉬웠어요 어서 이론강의도 내주세요 ㅎㅎㅎㅎ',4,to_timestamp('21/03/16 16:30:04.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'student1@test.com','자바 입문자를 위한 강의');
Insert into C##TEAM4.REVIEW (REVIEW_ID,RCONTENT,RATING,CDATE,UDATE,MEMBER_ID,LECTURE_TITLE) values (328,'전체적으로 입문하는 사람들에게 나쁜 강의는 아니었습니다 !!!! 선생님의 호쾌한 웃음 소리나 가끔 들려주시는 실무 이야기들로 인해 강의가 한층 더 재밌었던 것 같아요 다만 아쉬웠던 점은 실습을 하실 때 코드들에 대해서 좀만 더 자세하게 설명해주셨으면 어땠을까 하는 생각은 들었습니다. ',4,to_timestamp('21/03/16 16:37:51.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'student1@test.com','파이썬 입문 오리지널');
Insert into C##TEAM4.REVIEW (REVIEW_ID,RCONTENT,RATING,CDATE,UDATE,MEMBER_ID,LECTURE_TITLE) values (361,'강의 초반인데 잘 듣고 있습니다. 오늘도 if 문 에 대해서 잘 공부하고 갑니다.',3,to_timestamp('21/03/18 13:21:53.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'test@test.com','자바 입문자를 위한 강의');
Insert into C##TEAM4.REVIEW (REVIEW_ID,RCONTENT,RATING,CDATE,UDATE,MEMBER_ID,LECTURE_TITLE) values (363,' 제가 이해력이 많이 부족한데 이수업들을때는 불편한 부분 없이 듣고 있습니다.
선생님께서 한줄한줄 계속 반복해서 설명해주십니다.',5,to_timestamp('21/03/18 13:21:53.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'student2@test.com','자바 입문자를 위한 강의');
Insert into C##TEAM4.REVIEW (REVIEW_ID,RCONTENT,RATING,CDATE,UDATE,MEMBER_ID,LECTURE_TITLE) values (364,'운동이 이렇게 재밌는 줄 몰랐습니다. 직장인인데도 꾸준히 하게되네요 ㅎㅎ 감사합니다',5,to_timestamp('21/03/18 13:21:53.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'student2@test.com','샤크코치의 근력 운동');
Insert into C##TEAM4.REVIEW (REVIEW_ID,RCONTENT,RATING,CDATE,UDATE,MEMBER_ID,LECTURE_TITLE) values (366,'현업 이야기를 섞어서 설명해주시니 현장에 있는것 처럼 잘듣고 있습니다. 어서 스프링과 실전프로젝트를 해볼수 있는 강의 + 다양한 주제로 만나고 싶습니다. 강의 내주셔서 감사합니다.',4,to_timestamp('21/03/19 13:21:53.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'student3@test.com','자바 입문자를 위한 강의');
Insert into C##TEAM4.REVIEW (REVIEW_ID,RCONTENT,RATING,CDATE,UDATE,MEMBER_ID,LECTURE_TITLE) values (367,'기초강의라고 했는데 너무 생략 된 부분도 많고 강의 중 강사님께서도 방향을 못 잡는 부분이 있는게 느껴졌어요. 그냥 이미 아는 수강생들이 정리하는 느낌으로 살짝 듣기에는 좋은 강의입니다. ',2,to_timestamp('21/03/21 13:21:53.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'student4@test.com','자바 입문자를 위한 강의');
Insert into C##TEAM4.REVIEW (REVIEW_ID,RCONTENT,RATING,CDATE,UDATE,MEMBER_ID,LECTURE_TITLE) values (368,'자바 - JSP - MVC 건너면서 자바 자체에 소홀히 한것 같아 리뷰하듯 보고 있습니다. 저처럼 가볍게 리뷰 하실 분이나, 자바를 처음 하시는 분들에게는 정말 좋은 강의 입니다.',4,to_timestamp('21/03/23 13:21:53.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'student5@test.com','자바 입문자를 위한 강의');
Insert into C##TEAM4.REVIEW (REVIEW_ID,RCONTENT,RATING,CDATE,UDATE,MEMBER_ID,LECTURE_TITLE) values (369,'Java를 정말 쉽고 유익하게 배울 수 있었습니다! 강의를 너무 깔끔하게 해주셔서 Java 입문하시는 분들한테 정말정말 꼭 추천해드리고 싶어요! ',5,to_timestamp('21/03/22 13:21:53.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'student6@test.com','자바 입문자를 위한 강의');
Insert into C##TEAM4.REVIEW (REVIEW_ID,RCONTENT,RATING,CDATE,UDATE,MEMBER_ID,LECTURE_TITLE) values (370,'파이썬으로 프로그래밍에 입문했기 때문에 다른 언어로 프로그래밍적 사고 역량을 높일필요가있었는데 본 강의가 많이 도움되었습니다.',4,to_timestamp('21/03/25 13:21:53.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'student7@test.com','자바 입문자를 위한 강의');
Insert into C##TEAM4.REVIEW (REVIEW_ID,RCONTENT,RATING,CDATE,UDATE,MEMBER_ID,LECTURE_TITLE) values (2,'강의자료도 괜찮고, 설명도 잘해주십니다. 다이어그램이 너무 깔끔해서 개인적으로 만족스러웠네요. 다만, 간혹 ''거짓''을 ''거짖''이라고 하거나, ''반드시''를 반듯이''라고 표기하는 것은 문과생으로써 보기 힘들었습니다. 다음에 다시 리뉴얼 해주실 때는 신경써주시길 바랄께요.',5,to_timestamp('21/03/31 09:33:42.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'test@test.com','자바 입문자를 위한 강의');
Insert into C##TEAM4.REVIEW (REVIEW_ID,RCONTENT,RATING,CDATE,UDATE,MEMBER_ID,LECTURE_TITLE) values (388,'그림에 관심이있어서 시작하게되었어요. 이해하기 쉽고 편하게 듣고있습니다. 저도 언젠가 그림을 잘 그리는 날이 오겠죠?? 좋은 강의 감사합니다.',5,to_timestamp('21/03/30 13:21:53.000000000','RR/MM/DD HH24:MI:SSXFF'),null,'student1@test.com','펭구연의 캐릭터 드로잉');
REM INSERTING into C##TEAM4.VIDEO
SET DEFINE OFF;
Insert into C##TEAM4.VIDEO (VIDEO_ID,TITLE,CONTENT,CDATE,UDATE,LECTURE_TITLE,FILENAME,SECRET,CHAPTER_ID) values (41,'제목테스트(수정)','본문테스트(수정)',to_timestamp('21/03/31 10:58:41.000000000','RR/MM/DD HH24:MI:SSXFF'),to_timestamp('21/03/31 11:01:23.000000000','RR/MM/DD HH24:MI:SSXFF'),'자바 기본을 위한 강의 1부','화보촬영.mp4','n',2);
REM INSERTING into C##TEAM4.WISH
SET DEFINE OFF;
Insert into C##TEAM4.WISH (MEMBER_ID,LECTURE_TITLE,UDATE) values ('test@test.com','자바 실전',to_timestamp('21/03/28 16:09:09.000000000','RR/MM/DD HH24:MI:SSXFF'));
--------------------------------------------------------
--  DDL for Index BASKET_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##TEAM4"."BASKET_PK" ON "C##TEAM4"."BASKET" ("LECTURE_TITLE", "MEMBER_ID") 
  ;
--------------------------------------------------------
--  DDL for Index NOTICE_CATEGORY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##TEAM4"."NOTICE_CATEGORY_PK" ON "C##TEAM4"."NOTICE_CATEGORY" ("CID") 
  ;
--------------------------------------------------------
--  DDL for Index NOTICE_CATEGORY_UK1
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##TEAM4"."NOTICE_CATEGORY_UK1" ON "C##TEAM4"."NOTICE_CATEGORY" ("CNAME") 
  ;
--------------------------------------------------------
--  DDL for Index NOTICE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##TEAM4"."NOTICE_PK" ON "C##TEAM4"."NOTICE" ("NNUM") 
  ;
--------------------------------------------------------
--  DDL for Index NOTICE_UPLOAD_FILE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##TEAM4"."NOTICE_UPLOAD_FILE_PK" ON "C##TEAM4"."NOTICE_UPLOAD_FILE" ("FID") 
  ;
--------------------------------------------------------
--  Constraints for Table NOTICE_CATEGORY
--------------------------------------------------------

  ALTER TABLE "C##TEAM4"."NOTICE_CATEGORY" MODIFY ("CID" NOT NULL ENABLE);
  ALTER TABLE "C##TEAM4"."NOTICE_CATEGORY" MODIFY ("CNAME" NOT NULL ENABLE);
  ALTER TABLE "C##TEAM4"."NOTICE_CATEGORY" MODIFY ("USE_YN" NOT NULL ENABLE);
  ALTER TABLE "C##TEAM4"."NOTICE_CATEGORY" ADD CONSTRAINT "NOTICE_CATEGORY_PK" PRIMARY KEY ("CID")
  USING INDEX  ENABLE;
  ALTER TABLE "C##TEAM4"."NOTICE_CATEGORY" ADD CONSTRAINT "NOTICE_CATEGORY_CHK1" CHECK (use_yn in ('y', 'n')) ENABLE;
  ALTER TABLE "C##TEAM4"."NOTICE_CATEGORY" ADD CONSTRAINT "NOTICE_CATEGORY_UK1" UNIQUE ("CNAME")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table NOTICE_UPLOAD_FILE
--------------------------------------------------------

  ALTER TABLE "C##TEAM4"."NOTICE_UPLOAD_FILE" MODIFY ("FID" NOT NULL ENABLE);
  ALTER TABLE "C##TEAM4"."NOTICE_UPLOAD_FILE" ADD CONSTRAINT "NOTICE_UPLOAD_FILE_PK" PRIMARY KEY ("FID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table BASKET
--------------------------------------------------------

  ALTER TABLE "C##TEAM4"."BASKET" MODIFY ("LECTURE_TITLE" NOT NULL ENABLE);
  ALTER TABLE "C##TEAM4"."BASKET" MODIFY ("MEMBER_ID" NOT NULL ENABLE);
  ALTER TABLE "C##TEAM4"."BASKET" ADD CONSTRAINT "BASKET_PK" PRIMARY KEY ("LECTURE_TITLE", "MEMBER_ID")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table NOTICE
--------------------------------------------------------

  ALTER TABLE "C##TEAM4"."NOTICE" MODIFY ("NNUM" NOT NULL ENABLE);
  ALTER TABLE "C##TEAM4"."NOTICE" MODIFY ("NTITLE" NOT NULL ENABLE);
  ALTER TABLE "C##TEAM4"."NOTICE" ADD CONSTRAINT "NOTICE_PK" PRIMARY KEY ("NNUM")
  USING INDEX  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table NOTICE
--------------------------------------------------------

  ALTER TABLE "C##TEAM4"."NOTICE" ADD CONSTRAINT "NOTICE_FK2" FOREIGN KEY ("NCATEGORY")
	  REFERENCES "C##TEAM4"."NOTICE_CATEGORY" ("CID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table NOTICE_UPLOAD_FILE
--------------------------------------------------------

  ALTER TABLE "C##TEAM4"."NOTICE_UPLOAD_FILE" ADD CONSTRAINT "NOTICE_UPLOAD_FILE_FK1" FOREIGN KEY ("NNUM")
	  REFERENCES "C##TEAM4"."NOTICE" ("NNUM") ON DELETE CASCADE ENABLE;
