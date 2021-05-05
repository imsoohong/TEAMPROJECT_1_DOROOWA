package com.kh.portfolio.lecture.vo;

import java.sql.Timestamp;

import lombok.Data;


@Data
public class QnaUploadFileVO {
	
	
//	"FID" NUMBER NOT NULL ENABLE, 
	private long fid;
	
//	"FSIZE" VARCHAR2(45 BYTE), 
	private String fsize;
	
//	"FTYPE" VARCHAR2(50 BYTE), 
	private String ftype;
	
//	"FNAME" VARCHAR2(20 BYTE), 
	private String fname;
	
//	"CDATE" TIMESTAMP (6), 
	private Timestamp cdate;
	
//	"UDATE" TIMESTAMP (6), 
	private Timestamp udate;
	
//	"PIC" BLOB, 
	private byte[] pic;
	
//	"QNA_NUM" NUMBER, 
	private String picBase64;
	
	

}
