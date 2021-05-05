package com.kh.portfolio.student.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class WishVO {
//	MEMBER_ID	VARCHAR2(90 BYTE)	Yes
	private String member_id;
//	LECTURE_TITLE	VARCHAR2(90 BYTE)	Yes
	private String lecture_title;
	
	private Timestamp udate;

}
