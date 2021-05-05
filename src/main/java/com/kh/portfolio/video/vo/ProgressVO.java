package com.kh.portfolio.video.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
public class ProgressVO {
	
	private VideoVO videoVO;
	
//	LECTURE_TITLE	VARCHAR2(90 BYTE)	No	
	private String lecture_title;
//	STUDENT_ID	VARCHAR2(90 BYTE)	Yes	
	private String member_id;
	
//	VIDEO_ID	NUMBER	No	
	private long video_id;
//	PROGRESS	NUMBER	No	0 
	private int progress;
	
	

}
