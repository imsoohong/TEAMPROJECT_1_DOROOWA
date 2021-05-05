package com.kh.portfolio.student.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class BasketVO {
	
//	LECTURE_TITLE	VARCHAR2(90 BYTE)	No
	private String lecture_title;
//	MEMBER_ID	VARCHAR2(90 BYTE)	No
	private String member_id;
//	CDATE	TIMESTAMP(6)	Yes
	private Timestamp cdate;

}
