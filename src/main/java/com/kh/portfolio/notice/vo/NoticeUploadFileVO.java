package com.kh.portfolio.notice.vo;

import java.sql.Timestamp;

import lombok.Data;

@Data
public class NoticeUploadFileVO {
//	FID	NUMBER(10,0)	No		1	파일아이디
//	NNUM	NUMBER(10,0)	Yes		2	공지사항 게시글 번호
//	FNAME	VARCHAR2(150 BYTE)	Yes		3	파일명
//	FSIZE	VARCHAR2(45 BYTE)	Yes		4	파일크기
//	FTYPE	VARCHAR2(100 BYTE)	Yes		5	파일유형
//	CDATE	TIMESTAMP(6)	Yes	"systimestamp 
//	"	6	작성일
//	UDATE	TIMESTAMP(6)	Yes	"systimestamp 
//	"	7	수정일
	private long fid;
	private long nnum;
	private String fname;
	private String fsize;//	FSIZE	VARCHAR2(45 BYTE)	Yes		4	파일크기
	private String ftype;//	FTYPE	VARCHAR2(100 BYTE)	Yes		5	파일유형
	private byte[] fdata;//	FDATA	BLOB	Yes		6	첨부파일
	private Timestamp cdate;//	CDATE	TIMESTAMP(6)	Yes	systimestamp	7	작성일
	private Timestamp udate;//	UDATE	TIMESTAMP(6)	Yes	systimestamp	8	수정일
	
	 
	
	
}
