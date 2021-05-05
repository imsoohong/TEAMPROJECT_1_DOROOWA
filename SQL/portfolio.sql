	DROP USER c##springedu CASCADE;
	CREATE USER c##springedu IDENTIFIED BY springedu1234 DEFAULT TABLESPACE users TEMPORARY
	TABLESPACE temp PROFILE DEFAULT;
	GRANT CONNECT, RESOURCE TO c##springedu;
	GRANT CREATE VIEW, CREATE SYNONYM TO c##springedu;
	GRANT UNLIMITED TABLESPACE TO c##springedu;
	ALTER USER c##springedu ACCOUNT UNLOCK;


--------------------------------------------------------
--  파일이 생성됨 - 금요일-1월-22-2021   
--------------------------------------------------------
--------------------------------------------------------
--  DDL for Table CODE
--------------------------------------------------------

  CREATE TABLE "C##SPRINGEDU"."CODE" ("CODE_ID" CHAR(2), "NAME" VARCHAR2(30), "USE_YN" CHAR(1), "CODETYPE_ID" CHAR(4)) ;
--------------------------------------------------------
--  DDL for Table CODETYPE
--------------------------------------------------------

  CREATE TABLE "C##SPRINGEDU"."CODETYPE" ("CODETYPE_ID" CHAR(4), "NAME" VARCHAR2(30)) ;
--------------------------------------------------------
--  DDL for Table MEMBER
--------------------------------------------------------

  CREATE TABLE "C##SPRINGEDU"."MEMBER" ("MEMBER_ID" VARCHAR2(40), "PW" VARCHAR2(10), "TEL" VARCHAR2(13), "NICKNAME" VARCHAR2(30), "GENDER" CHAR(3), "REGION" VARCHAR2(30), "BIRTH" DATE, "CDATE" TIMESTAMP (6) DEFAULT SYSTIMESTAMP, "UDATE" TIMESTAMP (6), "PIC" BLOB, "FSIZE" VARCHAR2(45), "FTYPE" VARCHAR2(50), "COL1" VARCHAR2(20)) ;

   COMMENT ON COLUMN "C##SPRINGEDU"."MEMBER"."MEMBER_ID" IS 'ex)admin@google.com';
   COMMENT ON COLUMN "C##SPRINGEDU"."MEMBER"."PW" IS '8~10자리,특수문자포함';
   COMMENT ON COLUMN "C##SPRINGEDU"."MEMBER"."TEL" IS '''-''포함';
   COMMENT ON COLUMN "C##SPRINGEDU"."MEMBER"."GENDER" IS '성별(''남'',''여'')';
   COMMENT ON COLUMN "C##SPRINGEDU"."MEMBER"."REGION" IS '지역';
   COMMENT ON COLUMN "C##SPRINGEDU"."MEMBER"."BIRTH" IS '생년월일(''YYYYMMDD'')';
   COMMENT ON COLUMN "C##SPRINGEDU"."MEMBER"."CDATE" IS '생성일시';
   COMMENT ON COLUMN "C##SPRINGEDU"."MEMBER"."UDATE" IS '변경일시';
   COMMENT ON COLUMN "C##SPRINGEDU"."MEMBER"."PIC" IS '회원사진(GIF,JPEG,PNG)';
   COMMENT ON COLUMN "C##SPRINGEDU"."MEMBER"."FSIZE" IS '파일크기';
   COMMENT ON COLUMN "C##SPRINGEDU"."MEMBER"."FTYPE" IS '파일타입';
   COMMENT ON COLUMN "C##SPRINGEDU"."MEMBER"."COL1" IS '임시';
--------------------------------------------------------
--  DDL for Table MEMBER_HOBBY
--------------------------------------------------------

  CREATE TABLE "C##SPRINGEDU"."MEMBER_HOBBY" ("CODE_ID" CHAR(2), "MEMBER_ID" VARCHAR2(40)) ;
--------------------------------------------------------
--  DDL for Table STUDENT
--------------------------------------------------------

  CREATE TABLE "C##SPRINGEDU"."STUDENT" ("ID" VARCHAR2(10), "NAME" VARCHAR2(20), "KOR" NUMBER, "ENG" NUMBER, "MATH" NUMBER) ;

   COMMENT ON COLUMN "C##SPRINGEDU"."STUDENT"."ID" IS '학번';
   COMMENT ON COLUMN "C##SPRINGEDU"."STUDENT"."NAME" IS '이름';
   COMMENT ON COLUMN "C##SPRINGEDU"."STUDENT"."KOR" IS '국어점수';
   COMMENT ON COLUMN "C##SPRINGEDU"."STUDENT"."ENG" IS '영어점수';
   COMMENT ON COLUMN "C##SPRINGEDU"."STUDENT"."MATH" IS '수학점수';
REM INSERTING into C##SPRINGEDU.CODE
SET DEFINE OFF;
Insert into C##SPRINGEDU.CODE (CODE_ID,NAME,USE_YN,CODETYPE_ID) values ('01','서울','y','1000');
Insert into C##SPRINGEDU.CODE (CODE_ID,NAME,USE_YN,CODETYPE_ID) values ('04','음악','y','1010');
Insert into C##SPRINGEDU.CODE (CODE_ID,NAME,USE_YN,CODETYPE_ID) values ('05','영화','Y','1010');
Insert into C##SPRINGEDU.CODE (CODE_ID,NAME,USE_YN,CODETYPE_ID) values ('02','부산','y','1000');
Insert into C##SPRINGEDU.CODE (CODE_ID,NAME,USE_YN,CODETYPE_ID) values ('03','울산','y','1000');
Insert into C##SPRINGEDU.CODE (CODE_ID,NAME,USE_YN,CODETYPE_ID) values ('04','대전','y','1000');
Insert into C##SPRINGEDU.CODE (CODE_ID,NAME,USE_YN,CODETYPE_ID) values ('05','제주','y','1000');
Insert into C##SPRINGEDU.CODE (CODE_ID,NAME,USE_YN,CODETYPE_ID) values ('01','축구','y','1010');
Insert into C##SPRINGEDU.CODE (CODE_ID,NAME,USE_YN,CODETYPE_ID) values ('02','등산','y','1010');
Insert into C##SPRINGEDU.CODE (CODE_ID,NAME,USE_YN,CODETYPE_ID) values ('03','수영','y','1010');
Insert into C##SPRINGEDU.CODE (CODE_ID,NAME,USE_YN,CODETYPE_ID) values ('06','대구','Y','1000');
REM INSERTING into C##SPRINGEDU.CODETYPE
SET DEFINE OFF;
Insert into C##SPRINGEDU.CODETYPE (CODETYPE_ID,NAME) values ('1000','지역');
Insert into C##SPRINGEDU.CODETYPE (CODETYPE_ID,NAME) values ('1010','취미');
REM INSERTING into C##SPRINGEDU.MEMBER
SET DEFINE OFF;
Insert into C##SPRINGEDU.MEMBER (MEMBER_ID,PW,TEL,NICKNAME,GENDER,REGION,BIRTH,CDATE,UDATE,FSIZE,FTYPE,COL1) values ('test5@test.com','1234','010-444-5555','관리자5','남','울산',to_date('21/01/05','RR/MM/DD'),to_timestamp('21/01/20 12:46:31.153000000','RR/MM/DD HH24:MI:SSXFF'),null,null,null,null);
Insert into C##SPRINGEDU.MEMBER (MEMBER_ID,PW,TEL,NICKNAME,GENDER,REGION,BIRTH,CDATE,UDATE,FSIZE,FTYPE,COL1) values ('test@test.com','1234','010-3333-222','관리자2','여','부산',to_date('00/01/01','RR/MM/DD'),to_timestamp('21/01/06 09:33:45.804000000','RR/MM/DD HH24:MI:SSXFF'),to_timestamp('21/01/15 14:23:48.967000000','RR/MM/DD HH24:MI:SSXFF'),null,null,null);
Insert into C##SPRINGEDU.MEMBER (MEMBER_ID,PW,TEL,NICKNAME,GENDER,REGION,BIRTH,CDATE,UDATE,FSIZE,FTYPE,COL1) values ('test20@test.com','1234','010-444-5555','관리자1','남','03',to_date('21/01/11','RR/MM/DD'),to_timestamp('21/01/22 12:41:07.602000000','RR/MM/DD HH24:MI:SSXFF'),null,null,null,null);
Insert into C##SPRINGEDU.MEMBER (MEMBER_ID,PW,TEL,NICKNAME,GENDER,REGION,BIRTH,CDATE,UDATE,FSIZE,FTYPE,COL1) values ('test30@test.com','1234','010-444-5555','관리자1','남','03',to_date('21/01/11','RR/MM/DD'),to_timestamp('21/01/22 12:39:32.258000000','RR/MM/DD HH24:MI:SSXFF'),null,null,null,null);
Insert into C##SPRINGEDU.MEMBER (MEMBER_ID,PW,TEL,NICKNAME,GENDER,REGION,BIRTH,CDATE,UDATE,FSIZE,FTYPE,COL1) values ('test10@test.com','1234','010-444-5555','관리자1','남','02',to_date('21/01/19','RR/MM/DD'),to_timestamp('21/01/21 17:37:50.393000000','RR/MM/DD HH24:MI:SSXFF'),null,null,null,null);
Insert into C##SPRINGEDU.MEMBER (MEMBER_ID,PW,TEL,NICKNAME,GENDER,REGION,BIRTH,CDATE,UDATE,FSIZE,FTYPE,COL1) values ('test11@test.com','1111','010-444-5555','관리자1','남','02',to_date('21/01/19','RR/MM/DD'),to_timestamp('21/01/21 17:39:27.659000000','RR/MM/DD HH24:MI:SSXFF'),null,null,null,null);
Insert into C##SPRINGEDU.MEMBER (MEMBER_ID,PW,TEL,NICKNAME,GENDER,REGION,BIRTH,CDATE,UDATE,FSIZE,FTYPE,COL1) values ('test1@test.com','1234','010-3333-222','관리자2','여','부산',to_date('00/01/01','RR/MM/DD'),to_timestamp('21/01/06 09:33:45.804000000','RR/MM/DD HH24:MI:SSXFF'),to_timestamp('21/01/15 14:23:48.967000000','RR/MM/DD HH24:MI:SSXFF'),null,null,null);
REM INSERTING into C##SPRINGEDU.MEMBER_HOBBY
SET DEFINE OFF;
Insert into C##SPRINGEDU.MEMBER_HOBBY (CODE_ID,MEMBER_ID) values ('01','test20@test.com');
Insert into C##SPRINGEDU.MEMBER_HOBBY (CODE_ID,MEMBER_ID) values ('01','test@test.com');
Insert into C##SPRINGEDU.MEMBER_HOBBY (CODE_ID,MEMBER_ID) values ('02','test@test.com');
Insert into C##SPRINGEDU.MEMBER_HOBBY (CODE_ID,MEMBER_ID) values ('03','test@test.com');
Insert into C##SPRINGEDU.MEMBER_HOBBY (CODE_ID,MEMBER_ID) values ('04','test20@test.com');
Insert into C##SPRINGEDU.MEMBER_HOBBY (CODE_ID,MEMBER_ID) values ('05','test20@test.com');
REM INSERTING into C##SPRINGEDU.STUDENT
SET DEFINE OFF;
Insert into C##SPRINGEDU.STUDENT (ID,NAME,KOR,ENG,MATH) values ('id1','홍길동1',100,100,100);
Insert into C##SPRINGEDU.STUDENT (ID,NAME,KOR,ENG,MATH) values ('id2','홍길동2',50,80,70);
Insert into C##SPRINGEDU.STUDENT (ID,NAME,KOR,ENG,MATH) values ('id3','홍길동3',60,90,77);
--------------------------------------------------------
--  DDL for Index CODETYPE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##SPRINGEDU"."CODETYPE_PK" ON "C##SPRINGEDU"."CODETYPE" ("CODETYPE_ID") ;
--------------------------------------------------------
--  DDL for Index CODE_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##SPRINGEDU"."CODE_PK" ON "C##SPRINGEDU"."CODE" ("CODE_ID", "CODETYPE_ID") ;
--------------------------------------------------------
--  DDL for Index HOBBY_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##SPRINGEDU"."HOBBY_PK" ON "C##SPRINGEDU"."MEMBER_HOBBY" ("CODE_ID", "MEMBER_ID") ;
--------------------------------------------------------
--  DDL for Index MEMBER_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##SPRINGEDU"."MEMBER_PK" ON "C##SPRINGEDU"."MEMBER" ("MEMBER_ID") ;
--------------------------------------------------------
--  DDL for Index STUDENT_PK
--------------------------------------------------------

  CREATE UNIQUE INDEX "C##SPRINGEDU"."STUDENT_PK" ON "C##SPRINGEDU"."STUDENT" ("ID") ;
--------------------------------------------------------
--  Constraints for Table MEMBER
--------------------------------------------------------

  ALTER TABLE "C##SPRINGEDU"."MEMBER" MODIFY ("MEMBER_ID" NOT NULL ENABLE);
  ALTER TABLE "C##SPRINGEDU"."MEMBER" ADD CONSTRAINT "MEMBER_PK" PRIMARY KEY ("MEMBER_ID") USING INDEX  ENABLE;
  ALTER TABLE "C##SPRINGEDU"."MEMBER" ADD CONSTRAINT "MEMBER_CHK1" CHECK (gender in('남','여')) ENABLE;
  ALTER TABLE "C##SPRINGEDU"."MEMBER" MODIFY ("PW" NOT NULL ENABLE);
--------------------------------------------------------
--  Constraints for Table MEMBER_HOBBY
--------------------------------------------------------

  ALTER TABLE "C##SPRINGEDU"."MEMBER_HOBBY" MODIFY ("CODE_ID" NOT NULL ENABLE);
  ALTER TABLE "C##SPRINGEDU"."MEMBER_HOBBY" MODIFY ("MEMBER_ID" NOT NULL ENABLE);
  ALTER TABLE "C##SPRINGEDU"."MEMBER_HOBBY" ADD CONSTRAINT "HOBBY_PK" PRIMARY KEY ("CODE_ID", "MEMBER_ID") USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CODE
--------------------------------------------------------

  ALTER TABLE "C##SPRINGEDU"."CODE" MODIFY ("CODE_ID" NOT NULL ENABLE);
  ALTER TABLE "C##SPRINGEDU"."CODE" MODIFY ("CODETYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "C##SPRINGEDU"."CODE" ADD CONSTRAINT "CODE_PK" PRIMARY KEY ("CODE_ID", "CODETYPE_ID") USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table STUDENT
--------------------------------------------------------

  ALTER TABLE "C##SPRINGEDU"."STUDENT" MODIFY ("ID" NOT NULL ENABLE);
  ALTER TABLE "C##SPRINGEDU"."STUDENT" ADD CONSTRAINT "STUDENT_PK" PRIMARY KEY ("ID") USING INDEX  ENABLE;
--------------------------------------------------------
--  Constraints for Table CODETYPE
--------------------------------------------------------

  ALTER TABLE "C##SPRINGEDU"."CODETYPE" MODIFY ("CODETYPE_ID" NOT NULL ENABLE);
  ALTER TABLE "C##SPRINGEDU"."CODETYPE" ADD CONSTRAINT "CODETYPE_PK" PRIMARY KEY ("CODETYPE_ID") USING INDEX  ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table CODE
--------------------------------------------------------

  ALTER TABLE "C##SPRINGEDU"."CODE" ADD CONSTRAINT "CODE_CODETYPE_FK" FOREIGN KEY ("CODETYPE_ID") REFERENCES "C##SPRINGEDU"."CODETYPE" ("CODETYPE_ID") ENABLE;
--------------------------------------------------------
--  Ref Constraints for Table MEMBER_HOBBY
--------------------------------------------------------

  ALTER TABLE "C##SPRINGEDU"."MEMBER_HOBBY" ADD CONSTRAINT "HOBBY_FK1" FOREIGN KEY ("MEMBER_ID") REFERENCES "C##SPRINGEDU"."MEMBER" ("MEMBER_ID") ENABLE;

      