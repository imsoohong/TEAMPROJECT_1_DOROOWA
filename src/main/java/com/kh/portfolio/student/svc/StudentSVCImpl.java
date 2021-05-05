package com.kh.portfolio.student.svc;

import java.util.List;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Service;

import com.kh.portfolio.lecture.dao.LectureDAO;
import com.kh.portfolio.lecture.dao.OfflineLectureDAO;
import com.kh.portfolio.lecture.vo.LectureVO;
import com.kh.portfolio.member.vo.MemberVO;
import com.kh.portfolio.student.dao.StudentDAO;
import com.kh.portfolio.student.vo.OrdersVO;
import com.kh.portfolio.video.vo.ProgressVO;

import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
public class StudentSVCImpl implements StudentSVC {
	
	private final StudentDAO studentDAO;
	private final OfflineLectureDAO offLectureDAO;
	private final LectureDAO lectureDAO;
	
	public StudentSVCImpl (StudentDAO studentDAO, OfflineLectureDAO offLectureDAO, LectureDAO lectureDAO) {
		this.studentDAO = studentDAO;
		this.offLectureDAO = offLectureDAO;
		this.lectureDAO = lectureDAO;
	}

	
	/**
	 * 수강생 회원등록
	 */
	@Override
	public int joinStudent(MemberVO memberVO) {
		log.info("int joinStudent를 호출하였습니다 ! memberVO에 바인딩 된 정보는 " + memberVO);
		int result = 0;
		result = studentDAO.joinStudent(memberVO);
		return result;
	}
	
	
	@Override
	public List<OrdersVO> onlineList(String member_id) {
		return studentDAO.onlineList(member_id);
	}
	
//	@Override
//	public OrdersVO oneOrder(String member_id, String lecture_title) {
//		return studentDAO.oneOrder(member_id, lecture_title);
//	}
//	
	
	@Override
	public OrdersVO oneOrder(long order_id) {
		return studentDAO.oneOrder(order_id);
	}
	
	@Override
	public int updateStudy(long video_id, String member_id) {
		return studentDAO.updateStudy(video_id, member_id);
	}
	
	
	@Override
	public boolean existOrder(String member_id, String lecture_title) {
		return studentDAO.existOrder(member_id, lecture_title);
	}
	
	
	@Override
	public boolean existWish(String member_id, String lecture_title) {
		return studentDAO.existWish(member_id, lecture_title);
	}
	
	
	@Override
	public List<LectureVO> wishList(String member_id) {
		return studentDAO.wishList(member_id);
	}
	
	
	@Override
	public int deleteWish(String lecture_title, String member_id) {
		return studentDAO.deleteWish(lecture_title, member_id);
	}
	
	@Override
	public int insertWish(String lecture_title, String member_id) {
		return studentDAO.insertWish(lecture_title, member_id);
	}
	
	@Override
	public int updateRecentVideo(long video_id, String member_id) {
		return studentDAO.updateRecentVideo(video_id, member_id);
	}
	
	
	/**
	 * 수강진행 여부
	 * @return
	 */
	@Override
	public boolean existProgress(String lecture_title, String member_id) {
		return studentDAO.existProgress(lecture_title, member_id);
	}
	
	
	@Override
	public ProgressVO getRecentVideo(String member_id, String lecture_title) {
		return studentDAO.getRecentVideo(member_id, lecture_title);
	}
	
	
	/**
	 * 구매 이력
	 * @param member_id
	 * @return
	 */
	@Override
	public List<OrdersVO> ordersList(String member_id) {
		return studentDAO.ordersList(member_id);
	}
	
	@Override
	public int addBasket(String member_id, String lecture_title) {
		return studentDAO.addBasket(member_id, lecture_title);
	}
	
	
	@Override
	public int removeBasket(String member_id, String lecture_title) {
		return studentDAO.removeBasket(member_id, lecture_title);
	}
	
	
	@Override
	public List<LectureVO> basketList(String member_id) {
		return studentDAO.basketList(member_id);
	}
	
	
	@Override
	public boolean existBasket(String lecture_title, String member_id) {
		return studentDAO.existBasket(lecture_title, member_id);
	}
	
	
//	@Override
//	public List<ProgressVO> myProgressList(String lecture_title, String member_id) {
//		return studentDAO.myProgressList(lecture_title, member_id);
//	}
	
	@Override
	public List<ProgressVO> myProgress(String lecture_title, String member_id) {
		return studentDAO.myProgress(lecture_title, member_id);
	}
	
	@Override
	public int progressCnt(String lecture_title, String member_id) {
		return studentDAO.progressCnt(lecture_title, member_id);
	}
	
	@Override
	public int refund(long order_id) {
		//return studentDAO.refund(order_id);
		
		log.info("타고옴");
		
		OrdersVO oneOrder = studentDAO.oneOrder(order_id);
		log.info("oneOrder:"+oneOrder);
		
		String title = oneOrder.getLecture_title();
		
		
		log.info("title:"+title);
		
		
			try {
				log.info("오프라인 강의면");
				int currentCnt = Integer.parseInt(offLectureDAO.view(title).getCount());
				log.info("현재 수강생 인원:"+ currentCnt);

				
				String count = Integer.toString(--currentCnt);
				log.info("환불후 수강생 인원:"+ currentCnt);
				
				lectureDAO.updateCnt(title, count);
			} catch (EmptyResultDataAccessException e) {
				e.printStackTrace();
			}
			
			
		
		
		return studentDAO.refund(order_id);
		

	}
	
	/**
	 * 회원 아이디로 주문 목록 조회(오프라인 전용)
	 * @param member_id
	 * @return
	 */
	@Override
	public List<OrdersVO> offlineLectureList(String member_id){
		return studentDAO.offlineLectureList(member_id);
		
	}

}
