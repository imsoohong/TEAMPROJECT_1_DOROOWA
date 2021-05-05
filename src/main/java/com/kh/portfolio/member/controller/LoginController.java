package com.kh.portfolio.member.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.portfolio.member.svc.MemberSVC;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
public class LoginController {
	private static final Logger logger = LoggerFactory.getLogger(LoginController.class);
	
	
	private final MemberSVC memberSVC;
	
	@Autowired
	public LoginController(MemberSVC memberSVC) {
		this.memberSVC = memberSVC;
	}
	
	
	//로그인 정보 입력 페이지
	@GetMapping("/member/loginForm")
	public String loginFomr() {
		return "/member/loginForm";
	}
	
	
	//로그인 처리 기능
	@PostMapping("/login")
	public String login(@RequestParam("member_id") String member_id, @RequestParam ("pw") String pw, Model model, HttpSession session) {
		logger.info(member_id,pw);
		String viewName = null;
		
		//회원아이디가 존재 할 경우
		if(memberSVC.checkMember(member_id)) {
			
			//비밀번호가 일치 할 경우
			if(memberSVC.passMember(member_id, pw)) {
				session.setAttribute("member",memberSVC.readMemberInfo(member_id));
				
				viewName = "redirect:/";
			//비밀번호가 불일치 할 경우
			}else {
				model.addAttribute("loginErr_msg","존재하지 않는 회원 또는 비밀번호가 일치하지 않습니다.");
				viewName = "/member/loginForm";
			}
		//회원아이디가 존재 하지 않을 경우
		}else {
			model.addAttribute("loginErr_msg","존재하지 않는 회원 또는 비밀번호가 일치하지 않습니다.");
			viewName = "/member/loginForm";
		}//end of else
		
		log.info("세션정보:"+session.toString());
		return viewName;
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	
	
	
}
