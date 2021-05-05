package com.kh.portfolio.student.dao;

import java.util.List;

import com.kh.portfolio.lecture.vo.LectureVO;
import com.kh.portfolio.member.vo.MemberVO;
import com.kh.portfolio.student.vo.BasketVO;
import com.kh.portfolio.student.vo.OrdersVO;
import com.kh.portfolio.video.vo.ProgressVO;

public interface StudentDAO {
	
	
	//수강생 회원 등록
	int joinStudent(MemberVO memberVO);
	
	/**
	 * 진행중인 온라인강의 목록
	 * @return
	 */
	List<OrdersVO> onlineList(String member_id);
	

	
	
	/**
	 * studydate 업데이트
	 * @param video_id
	 * @param member_id
	 * @return
	 */
	int updateStudy(long video_id, String member_id);
	
	
	/**
	 * 구매 여부
	 * @param member_id
	 * @param lecture_title
	 * @return
	 */
	boolean existOrder(String member_id, String lecture_title);
	
	
	/**
	 * 찜 여부
	 * @param member_id
	 * @param lecture_title
	 * @return
	 */
	boolean existWish(String member_id, String lecture_title);
	
	
	/**
	 * 찜 목록
	 * @param member_id
	 * @return
	 */
	List<LectureVO> wishList(String member_id);
	
	
	
	/**
	 * 찜 해제
	 * @param lecture_title
	 * @param member_id
	 * @return
	 */
	int deleteWish(String lecture_title, String member_id);
	
	
	/**
	 * 찜 등록
	 * @param lecture_title
	 * @param member_id
	 * @return
	 */
	int insertWish(String lecture_title, String member_id);
	
	
	/**
	 * 최근 수강한 강의 업데이트
	 * @return
	 */
	int updateRecentVideo(long video_id, String member_id);
	
	
	/**
	 * 수강진행 여부
	 * @return
	 */
	boolean existProgress(String lecture_title, String member_id);
	

	
	/**
	 * 강의 이어서 수강
	 * @return
	 */
	ProgressVO getRecentVideo(String member_id, String lecture_title);
	
	/**
	 * 구매 이력
	 * @param member_id
	 * @return
	 */
	List<OrdersVO> ordersList(String member_id);
	
	
	//2021.3.19
	//OrdersVO oneOrder(String member_id, String lecture_title);
	
	OrdersVO oneOrder(long order_id);
	
	
	/**
	 * 장바구니 추가
	 * @param member_id
	 * @param lecture_title
	 * @return
	 */
	int addBasket(String member_id, String lecture_title);
	
	
	/**
	 * 장바구니 삭제
	 * @param member_id
	 * @param lecture_title
	 * @return
	 */
	int removeBasket(String member_id, String lecture_title);
	
	
	/**
	 * 장바구니 목록
	 * @param member_id
	 * @return
	 */
	List<LectureVO> basketList(String member_id); 
	
	
	
	/**
	 * 장바구니 등록 여부
	 * @param lecture_title
	 * @param member_id
	 * @return
	 */
	boolean existBasket(String lecture_title, String member_id);
	
	
	
	/**
	 * 강의영상리스트(강의수강 여부에 따라,,,) 
	 * @param lecture_title
	 * @param member_id
	 * @return
	 */
//	List<ProgressVO> myProgressList(String lecture_title, String member_id);
	
	List<ProgressVO> myProgress(String lecture_title, String member_id);
	
	
	int progressCnt(String lecture_title, String member_id);
	
	
	/**
	 * 환불
	 * @param order_id
	 * @return
	 */
	int refund(long order_id);
	
	
	/**
	 * 회원 아이디로 주문 목록 조회(오프라인 전용)
	 * @param member_id
	 * @return
	 */
	List<OrdersVO> offlineLectureList(String member_id);



}
