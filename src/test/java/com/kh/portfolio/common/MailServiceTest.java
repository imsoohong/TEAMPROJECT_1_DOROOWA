package com.kh.portfolio.common;

import org.junit.jupiter.api.Test;
import org.junit.jupiter.api.extension.ExtendWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit.jupiter.SpringExtension;

import com.kh.portfolio.common.svc.MailService;

import lombok.extern.slf4j.Slf4j;

@ExtendWith(SpringExtension.class)
@ContextConfiguration(locations = { "file:src/main/webapp/WEB-INF/spring/*.xml" })
@Slf4j
public class MailServiceTest {

	@Autowired
	MailService mailService;

	@Test
	void mail() {
		mailService.sendMail("sang105kr2@naver.com", "메일테스트", "메일본문");
	}
}
