package com.kh.portfolio.member.vo;

import java.sql.Timestamp;
import java.time.LocalDate;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class MemberVO {
	
		@NotBlank(message = "이메일 주소를 입력하세요.")
		@Email(message = "올바른 이메일 주소를 입력하세요.")
		private String member_id;							//	MEMBER_ID	VARCHAR2(40 BYTE)	No		1	아이디 *이메일형식 ex)example@example.com
		
		@NotBlank(message = "비밀번호를 입력하세요.")
		@Size(min=4,max=10,message = "비밀번호는 4~10자리로 입력하세요")
		private String pw;										//	PW	VARCHAR2(10 BYTE)	Yes		2	8~10자리,특수문자 포함
		
		private String nickname;							//	NICKNAME	VARCHAR2(30 BYTE)	Yes		3	별칭
		private String type;									//	TYPE	VARCHAR2(20 BYTE)	Yes		4	회원 타입(관리자,강사,수강생)
		
		@Pattern(regexp = "^\\d{3}-\\d{3,4}-\\d{4}$",message = "올바른 전화번호를 입력하세요. 전화번호는 '-'을 포함하여 입력하세요.")
		private String tel;										//	TEL	VARCHAR2(13 BYTE)	Yes		5
		private String gender;								//	GENDER	CHAR(3 BYTE)	Yes		6	gender in('남','여')
		private String name;									//	NAME	VARCHAR2(20 BYTE)	Yes		7	
		private String region;								//	REGION	VARCHAR2(20 BYTE)	Yes		8	
		
		@DateTimeFormat(pattern = "yyyy-MM-dd")
		private LocalDate birth;							//	BIRTH	DATE	Yes		9	
		private Timestamp cdate;							//	CDATE	TIMESTAMP(6)	Yes		10	
		private Timestamp udate;							//	UDATE	TIMESTAMP(6)	Yes		11	
		
		/**
		 * 아래는 프로필 사진을 위한 부분 입니다 ! 
		 * 프로필 사진 기능을 사용할 경우 아래 부분의 형식에 맞춰 변수를 선언해주세요 !
		 * 사진은 배열 참조 타입의 변수로 선언되어야 합니다 !
		 */
		
		//	PIC	BLOB	Yes		12	
		//	FSIZE	VARCHAR2(45 BYTE)	Yes		13	
		//	FTYPE	VARCHAR2(50 BYTE)	Yes		14	
		//	FNAME	VARCHAR2(100 BYTE)	Yes		15	
	
}
