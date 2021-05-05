package com.kh.portfolio.orders.svc;

import java.util.List;

import javax.servlet.http.HttpSession;

import com.kh.portfolio.orders.vo.OrdersVO;

public interface OrdersSVC {
	
	/**
	 * 데이터 전달 테스트 용도
	 */
	void test(List<OrdersVO> orders);
	
	/**
	 * 강의 주문
	 * @param orders
	 * @return
	 */
	String orders(List<String> list,HttpSession session);
	
	/**
	 * 회원 아이디로 주문 목록 조회
	 * @param member_id
	 * @return
	 */
	List<OrdersVO> list(String member_id);

	
	
	
//	/**
//	 * 강의 예약시 수강 인원 카운트 증가 
//	 * @param lecture_title
//	 */
//	void updateCount(String lecture_title);
	
	
	
	
}
