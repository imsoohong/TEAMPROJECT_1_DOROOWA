package com.kh.portfolio.notice.vo;

import javax.validation.constraints.NotNull;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor	 //디폴트 생성자 자동 생성
@AllArgsConstructor  //모든 멤버필드를 매개변수로 갖는 생성자 자동 생성
public class NoticeCategoryVO {
	
//	CID	NUMBER(4,0)	No		1	분류코드
//	CNAME	VARCHAR2(60 BYTE)	No		2	분류명
//	USE_YN	CHAR(1 BYTE)	No		3	사용유무(y,n)
	

//	private NoticeCategoryVO (Integer cid, String cname) {
//		this.cid = cid;
//		this.cname = cname;
//	}

	


	@NotNull(message = "분류를 선택해주세요")
	private Integer cid;
	private String cname;
	
}
