package com.kh.portfolio.orders.dao;

import java.util.List;

import com.kh.portfolio.orders.vo.CheckAmountVO;
import com.kh.portfolio.orders.vo.OrdersVO;

public interface OrdersDAO {

	/**
	 * 강의 주문
	 * @param orders
	 * @return
	 */
	void orders(List<OrdersVO> orders);

	/**
	 * 회원 아이디로 주문 목록 조회
	 * @param member_id
	 * @return
	 */
	List<OrdersVO> list(String member_id);
	
	/**
	 * 강의 예약시 수강 인원 카운트 증가 
	 * @param lecture_title
	 */
	void updateCount(String lecture_title);
	
	/**
	 * 강의 제한 인원 체크(수강인원과 제한인원을 조회)
	 * @param lecture_title
	 * @return
	 */
	CheckAmountVO checkAmount(String lecture_title);
	
	/**
	 * 강의 구매 후 장바구니에서 해당 강의 삭제
	 * @param lecture_title
	 * @param member_id
	 */
	void cleanBasket (String lecture_title,String member_id);
	

	/**
	 * 강의 구매 후 progress 추가
	 * @param lecture_title
	 * @param member_id
	 * @param video_id
	 */
	void addProgress(String lecture_title, String member_id, long video_id );

}
