package com.kh.portfolio.student.vo;

import java.sql.Timestamp;

import com.kh.portfolio.lecture.vo.LectureVO;

import lombok.Data;

@Data
public class OrdersVO {
	
	private LectureVO lectureVO;
//	ORDER_ID	VARCHAR2(40 BYTE)	No
	private long order_id;
//	STATUS	VARCHAR2(20 BYTE)	Yes
	private String status;
//	ORDERDATE	TIMESTAMP(6)	Yes
	private Timestamp udate;
//	CANCELDATE	TIMESTAMP(6)	Yes
//	private Timestamp canceldate;
//	STUDENT_ID	VARCHAR2(40 BYTE)	Yes
	private String member_id;
//	LECTURE_TITLE	VARCHAR2(90 BYTE)	Yes
	private String lecture_title;
//	PROGRESSBAR	NUMBER	Yes
	private int progressbar;
	
	private Timestamp studydate;
	
}
