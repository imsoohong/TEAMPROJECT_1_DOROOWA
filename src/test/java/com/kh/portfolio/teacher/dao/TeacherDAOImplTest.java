package com.kh.portfolio.teacher.dao;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.kh.portfolio.teacher.dao.TeacherDAO;

import lombok.extern.slf4j.Slf4j;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/*.xml"})
@Slf4j
public class TeacherDAOImplTest {
	
	@Autowired
	JdbcTemplate jt;
	
	@Autowired
	TeacherDAO teacherDAO;
	
	@Test
	void uploadVideo() {
		String title = "제목 테스트";
		String content = "본문 테스트";
		String lecture_title = "자바3강";
		String filename = "cat.mp4";
		int result = teacherDAO.uploadVideo(title, content, lecture_title, filename);
		Assertions.assertEquals(1, result);
	}

}
