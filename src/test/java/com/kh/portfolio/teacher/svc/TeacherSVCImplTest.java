package com.kh.portfolio.teacher.svc;

import org.junit.jupiter.api.Assertions;
import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;


import lombok.extern.slf4j.Slf4j;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/*.xml"})
@Slf4j					//로거 기록
public class TeacherSVCImplTest {
	
	@Autowired
	private TeacherSVC teacherSVC;
	
	@Test
	void uploadVideo() {
		String title = "제목 테스트2";
		String content = "본문 테스트2";
		String lecture_title = "자바32강";
		String filename = "cat.mp4";
		int result = teacherSVC.uploadVideo(title, content, lecture_title, filename);
		Assertions.assertEquals(1, result);
	}

}
