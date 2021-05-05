package com.kh.portfolio.lecture.vo;

import java.sql.Date;
import java.sql.Timestamp;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.kh.portfolio.member.vo.MemberVO;

import lombok.Data;

@Data
public class ReviewVO {
	
	private MemberVO memberVO;
	
	private Number review_id;
	private String rcontent;
	private Number rating;
	@JsonFormat(pattern="yyyy-MM-dd")
	private Timestamp cdate;
	private Date udate;
	private String member_id;
	private String lecture_title;

}
