package com.kh.portfolio.lecture.vo;

import java.sql.Date;

import com.kh.portfolio.member.vo.MemberVO;
import com.kh.portfolio.student.vo.BasketVO;

import lombok.Data;




@Data
public class LectureVO {
	
	private BasketVO basketVO;
	
	private MemberVO memberVO;

	private String kinds;

	private String lecture_title;

	private String teacher_nickname;
	private String member_id;

	private long price;

	private Date opendate;
	private String teacher_intro;
	private String lecture_intro;
	private Number rating;
	private String type;
	
	private Date startdate;
	private Date enddate;
	private Date closedate;
	private String hours;

	

	
	private String intro;
	private String count;
	private String amount;
	
	private String thumbnail;
	
	
	/**
	 * 오프라인 강의 지역 정보 
	 */
	//주소를 문자열로 나타내기 위한 변수
	private String location;
	private String sortLocation;

	
	
	

}
