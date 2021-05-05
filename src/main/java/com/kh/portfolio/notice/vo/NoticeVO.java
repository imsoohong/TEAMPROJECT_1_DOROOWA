package com.kh.portfolio.notice.vo;

import java.sql.Timestamp;

import javax.validation.Valid;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Size;

import lombok.Data;

@Data
public class NoticeVO {
//	NNUM	NUMBER(10,0)	No		1	공지사항번호
//	NTITLE	VARCHAR2(150 BYTE)	No		2	제목
//	NID	VARCHAR2(40 BYTE)	Yes		3	작성자ID
//	NNICKNAME	VARCHAR2(30 BYTE)	Yes		4	별칭
//	NCDATE	TIMESTAMP(6)	Yes	systimestamp 	5	작성일
//	NUDATE	TIMESTAMP(6)	Yes	systimestamp 	6	수정일
//	NHIT	NUMBER(5,0)	Yes	0 	7	조회수
//	NCONTENT	CLOB	Yes		8	본문내용
//	NCATEGORY	NUMBER(10,0)	Yes		9	분류카테고리
	private long nnum;
	
	@Valid
	public NoticeCategoryVO noticeCategoryVO; //	NCATEGORY	NUMBER(10,0)	Yes		9	분류카테고리
	
	@NotBlank
	@Size(min = 4,max = 50, message = "제목은 4~50자 까지 입력가능합니다!" )
	private	String ntitle;
	
	@NotBlank(message = "이메일 형식 이어야합니다! ex)aaa@bbb.com")
	@Email(message = "이메일 형식 이어야합니다! ex)aaa@bbb.com")
	private String nid;		//	BID	VARCHAR2(40 BYTE)	Yes		4	작성자ID
	
	private String nnickname;
	
	private Timestamp ncdate;//	BCDATE	TIMESTAMP(6)	Yes	systimestamp	6	작성일
	private Timestamp nudate;//	BUDATE	TIMESTAMP(6)	Yes	systimestamp	7	수정일
	private int nhit;				 //	BHIT	NUMBER(5,0)	Yes	0	8	조회수
	
	@NotBlank(message = "내용을 입력해주세요!")
	private String ncontent; //	BCONTENT	CLOB	Yes		9	본문내용
}
