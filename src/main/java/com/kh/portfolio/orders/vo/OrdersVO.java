package com.kh.portfolio.orders.vo;

import java.sql.Timestamp;

import com.kh.portfolio.lecture.vo.LectureVO;

import lombok.Data;

@Data
public class OrdersVO {
	
	private long order_id;
	private String status;
	private Timestamp udate; 
	private Timestamp orderdate; 
	private Timestamp canceldate;
	private String member_id;
	private String lecture_title;
	

}
