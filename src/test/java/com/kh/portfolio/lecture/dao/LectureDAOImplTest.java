package com.kh.portfolio.lecture.dao;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.kh.portfolio.lecture.vo.ReviewVO;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/*.xml"})

public class LectureDAOImplTest {
	
	@Autowired
	LectureDAO lectureDAO;
	
	@Test
	void writeReview() {
		ReviewVO reviewVO = new ReviewVO();
		reviewVO.setRcontent("굿");
		reviewVO.setRating(5);
		
		lectureDAO.writeReview(reviewVO);
	}

}
