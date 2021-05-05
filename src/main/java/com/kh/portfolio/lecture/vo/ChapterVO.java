package com.kh.portfolio.lecture.vo;

import lombok.Data;

@Data
public class ChapterVO {
	
	
	private String chapter_title; //	CHAPTER_TITLE	VARCHAR2(100 BYTE)	No
	private String lecture_title;	//	LECTURE_TITLE	VARCHAR2(90 BYTE)	Yes
	private int chapter_id;//	IDX	NUMBER	Yes

}
