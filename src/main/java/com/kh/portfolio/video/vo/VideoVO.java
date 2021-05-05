package com.kh.portfolio.video.vo;

import java.sql.Timestamp;

import com.kh.portfolio.lecture.vo.ChapterVO;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class VideoVO {

	private ChapterVO chapterVO;
	
	private long video_id;//	VIDEO_ID	NUMBER	No	
	private String title;//	TITLE	VARCHAR2(90 BYTE)	Yes	
	private String content;//	CONTENT	VARCHAR2(500 BYTE)	Yes	
	private Timestamp cdate;//	CDATE	TIMESTAMP(6)	Yes	
	private Timestamp udate;//	UDATE	TIMESTAMP(6)	Yes	
//	VDATA	BLOB	Yes	
	private String lecture_title;//	LECTURE_TITLE	VARCHAR2(90 BYTE)	Yes	
	private Timestamp studydate;
	private String filename;
	
	//첨부파일
//	private List<MultipartFile> files;
	
	private String secret;
	
	private int chapter_id;
	
}
