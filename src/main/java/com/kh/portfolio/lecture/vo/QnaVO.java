package com.kh.portfolio.lecture.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class QnaVO {
	 
//	QNA_NUM	NUMBER(10,0)	Yes	
	private long Qna_num;
//	TITLE	VARCHAR2(150 BYTE)	Yes
	private String title;
//	CONTENT	CLOB	Yes
	private String content;
//	QGROUP	NUMBER(5,0)	Yes
	private int qgroup;
//	QSTEP	NUMBER(5,0)	Yes
	private int qstep;
//	QINDENT	NUMBER(5,0)	Yes
	private int qindent;
//	LECTURE_TITLE	VARCHAR2(90 BYTE)	Yes
	private String lecture_title;
//	STUDENT_ID	VARCHAR2(40 BYTE)	Yes
	private String nickname;
	
	private Timestamp cdate;//	BCDATE	TIMESTAMP(6)	Yes	systimestamp	6	작성일
	private Timestamp udate;//	BUDATE	TIMESTAMP(6)	Yes	systimestamp	7	수정일


}
