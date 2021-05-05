package com.kh.portfolio.student.dao;

import java.util.List;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Disabled;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.kh.portfolio.lecture.vo.LectureVO;
import com.kh.portfolio.student.vo.OrdersVO;
import com.kh.portfolio.video.vo.ProgressVO;

import lombok.extern.slf4j.Slf4j;





@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/*.xml"})
@Slf4j
public class StudentDAOImplTest {
	


	@Autowired
	JdbcTemplate jt;
	
	@Autowired
	StudentDAO studentDAO;
	
	
	@Test
	@Disabled
	void orderList() {
		
		String member_id = "student1@test.com";
		List<OrdersVO> list = studentDAO.orderList(member_id);
		
		list.stream().forEach(ele->{
			log.info(ele.toString());
		});
		
	}
	
//	@Test
//	@Disabled
//	void updateStudy() {
//		long video_id = 2;
//		String member_id = "student1@test.com";
//		int result = studentDAO.updateStudy(video_id, member_id);
//		Assertions.assertEquals(1, result);
//	}
	
	
	@Test
	@Disabled
	void wishList() {
		String member_id = "student1@test.com";
		List<LectureVO> list = studentDAO.wishList(member_id);
		
		list.stream().forEach(ele->{
			log.info(ele.toString());
		});
		
		
	}
	
	
	@Test
	@Disabled
	void getRecentVideo() {
		String member_id = "student1@test.com";
		String lecture_title = "파이썬 입문 오리지널";
		ProgressVO progressVO = studentDAO.getRecentVideo(member_id, lecture_title);
		log.info("progressVO: "+progressVO);
	}
	
	@Test
	void oneOrder() {
		long order_id = 262;
		String lecture_title = studentDAO.oneOrder(order_id).getLecture_title();
		log.info("ordersVO"+lecture_title);
	}
	
	
	
	
	
	

}
