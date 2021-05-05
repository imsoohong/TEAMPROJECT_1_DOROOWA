package com.kh.portfolio.common.svc;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Service;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor // : final멤버필드를 생성자 매개변수로 생성
//@AllArgsConstructor    // : 모든 멤버필드를 생성자 매개변수로 생성
//@NoArgsConstructor     // : 디폴트생성자 생성
public class MailService {

	//빈을 주입(Injection)받는 방법
	//1) 필드 주입
//	@Autowired
//	private JavaMailSender mailSender;
//	@Autowired
//	private SimpleMailMessage simpleMessage;
	//2) 생성자주입
//	private JavaMailSender mailSender;
//	private SimpleMailMessage simpleMessage;
//	@Autowired
//	public MailService(JavaMailSender mailSender,SimpleMailMessage simpleMessage) {
//		this.mailSender = mailSender;
//		this.simpleMessage = simpleMessage;
//	}
	
	//3) setter메소드 주입
//	private JavaMailSender mailSender;
//	private SimpleMailMessage simpleMessage;
//	@Autowired
//	public void setMailSender(JavaMailSender mailSender) {
//		this.mailSender = mailSender;
//	}
//	@Autowired
//	public void setSimpleMessage(SimpleMailMessage simpleMessage) {
//		this.simpleMessage = simpleMessage;
//	}
	//4) lombok @RequiredArgsConstructor : 생성자주입을 자동으로 해줌.(메버필드는 final이어야함)
	
	private final JavaMailSender mailSender;
	private final SimpleMailMessage simpleMessage;	
	
	private final String from = "sang105kr@gmail.com";
	/**
	 * 메일전송
	 * @param to  : 수신자
	 * @param subject : 제목
	 * @param body : 본문
	 */
	public void sendMail(String to, String subject, String body) {
		MimeMessage message = mailSender.createMimeMessage();
		
		try {
			MimeMessageHelper messageHelper = new MimeMessageHelper(message,true,"UTF-8");
			messageHelper.setSubject(subject);
			messageHelper.setTo(to);
			messageHelper.setFrom(from);
			messageHelper.setText(body,true);
			mailSender.send(message);
			
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		
	}
	/**
	 * 고정 메세지 보낼경우
	 * @param message : 본문
	 */
	public void sendSimpleMail(String message) {
		simpleMessage.setText(message);
		mailSender.send(simpleMessage);
		
	}	
}










