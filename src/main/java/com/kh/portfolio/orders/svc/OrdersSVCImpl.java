package com.kh.portfolio.orders.svc;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Service;

import com.kh.portfolio.member.vo.MemberVO;
import com.kh.portfolio.orders.dao.OrdersDAO;
import com.kh.portfolio.orders.vo.OrdersVO;
import com.kh.portfolio.video.dao.VideoDAO;
import com.kh.portfolio.video.vo.VideoVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class OrdersSVCImpl implements OrdersSVC {
	
	private final OrdersDAO ordersDAO;
	private final VideoDAO videoDAO;

	//데이터 테스트 용도
	@Override
	public void test(List<OrdersVO> orders) {
		
		log.info(orders.toString());
	}
	
	/**
	 * 강의 주문
	 * @param orders
	 * @return
	 */
	@Override
	public String orders(List<String> list,HttpSession session) {
		String result = "구매 실패";
		List<OrdersVO> orders = new ArrayList<>();	
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		String member_id = memberVO.getMember_id();
		
		log.info(member_id);
		
		for(int i = 0; i < list.size(); i++) {
			log.info("강의 구매 로직 시작");
			String lecture_title = list.get(i);
			log.info("강의 제목은"+lecture_title);
			log.info("강의 타입은"+ordersDAO.checkAmount(lecture_title).getType());
			log.info(ordersDAO.checkAmount(lecture_title).getType());
			
			//장바구니에 담겨있는 강의 중 온라인 강의에 대한 구매 처리
			if(ordersDAO.checkAmount(lecture_title).getType().equals("on")) {
				log.info("온라인 강의 구매로직 시작");
				OrdersVO ordersVO = new OrdersVO();
				ordersVO.setLecture_title(lecture_title);
				ordersVO.setMember_id(member_id);
				orders.add(ordersVO);
				log.info("온라인강의"+ordersVO+"구매 등록 준비" );
				
			//장바구니에 담겨있는 강의 중 오프라인 강의에 대한 구매 처리
			}else{
				log.info("오프라인 강의 구매로직 시작");
				if(ordersDAO.checkAmount(lecture_title).getCount() < ordersDAO.checkAmount(lecture_title).getAmount()) {
					log.info("오프라인 강의 정원 체크 작동");
					
					OrdersVO ordersVO = new OrdersVO();
					ordersVO.setLecture_title(lecture_title);
					ordersDAO.updateCount(lecture_title);
					ordersVO.setMember_id(member_id);
					orders.add(ordersVO);
					log.info("오프라인강의"+ordersVO+"구매 등록 준비");
				}else {
					i = list.size();
					orders = null;
					log.info("수강 정원이 가득 찼습니다. 해당 오프라인 강의를 구매할 수 없습니다.");
				}				
			}
		}
		
		
		if(orders != null) {
			ordersDAO.orders(orders);
			log.info("강의"+orders+"가 정상적으로 구매되었습니다.");
			
			
			//강의 정상 구매시, progress에 진행도 추가
			for(int i=0;i<orders.size();i++) {
				
				log.info("진행도1(i) 실행");
				log.info("orders.size:"+orders.size());
				String title = orders.get(i).getLecture_title();
				List<VideoVO> videoList = videoDAO.videoList(title);
				List<Long> videoIdList = new ArrayList<>();
				
				for(int j=0;j<videoList.size();j++) {
					log.info("진행도2(j) 실행");
					log.info("videoList.size:"+videoList.size());
					long videoId = videoList.get(j).getVideo_id();
					log.info("videoId:"+videoId);
					ordersDAO.addProgress(title, member_id, videoId);
					videoIdList.add(videoId);
				}
				
				
			}
			
			
			
			// 강의 정상 구매시, 구매한 강의를 장바구니에서 삭제
			for(int i = 0; i < orders.size(); i++) {
				String lecture_title = orders.get(i).getLecture_title();
				ordersDAO.cleanBasket(lecture_title, member_id);
				log.info("장바구니를 비웠습니다");
			}
			result = "강의 구매 성공";
		}else {
			log.info("수강인원 초과 또는 알수 없는 이유로 강의 구매를 실패하였습니다.");
			result = "강의 구매 실패";
		}
		return result;
	}
		
	


	/**
	 * 회원 아이디로 주문 목록 조회
	 * @param member_id
	 * @return
	 */
	@Override
	public List<OrdersVO> list(String member_id) {
		
		return ordersDAO.list(member_id);
	}

//	/**
//	 * 강의 예약시 수강 인원 카운트 증가 
//	 * @param lecture_title
//	 */
//	@Override
//	public void updateCount(String lecture_title) {
//		ordersDAO.updateCount(lecture_title);
//	}
	
	
	
	
	
	
	

	
	
	
	

}
