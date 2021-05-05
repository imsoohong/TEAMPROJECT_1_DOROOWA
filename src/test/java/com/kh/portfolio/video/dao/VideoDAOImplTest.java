package com.kh.portfolio.video.dao;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;


@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/*.xml"})
public class VideoDAOImplTest {
	
	private final static Logger logger
	= LoggerFactory.getLogger(VideoDAOImplTest.class);


	@Autowired
	JdbcTemplate jt;
	
	@Autowired
	VideoDAO videoDAO;
	
	
	@Test
	void progress() {
		
		String lecture_title = "자바";
		long video_id = 2;
		String member_id = "student1@test.com";
		
		int result = videoDAO.updateProgress(lecture_title, video_id, member_id);
		Assertions.assertEquals(1, result);
	
	}
	
	
}
