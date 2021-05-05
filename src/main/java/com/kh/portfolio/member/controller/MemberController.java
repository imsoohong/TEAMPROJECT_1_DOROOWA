package com.kh.portfolio.member.controller;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.portfolio.member.svc.MemberSVC;
import com.kh.portfolio.member.vo.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/member")
@Slf4j
public class MemberController {
	
	private final MemberSVC memberSVC;
	
	
	public MemberController(MemberSVC memberSVC) {
		this.memberSVC = memberSVC;
	}
		
	@GetMapping("/findIdForm")
	public String findIdForm() {
		return "/member/findIdForm";
	}
	
	
	//회원가입 분류 선택
	@GetMapping("joinSelect")
	public String joinSelect() {
		return "/member/joinSelect";
	}
	
	//회원가입시 아이디 중복 체크
	@ResponseBody
	@GetMapping("/checkId")
	public boolean checkId(@RequestParam String member_id) {
		log.info(member_id);
		return memberSVC.checkMember(member_id);
	}
	
	//회원 탈퇴 페이지
	@GetMapping("/outMemberForm")
	public String outMemberForm() {
		return "/member/outMemberForm";
	}
	
//	//회원 탈퇴 처리
//	@PostMapping("/outMember")
//	public String outMember(HttpSession session, String pw) {
//		String viewUrl = null;
//		MemberVO memberVO = (MemberVO)session.getAttribute("member");
//		String member_id = memberVO.getMember_id();
//		int result = memberSVC.outMember(member_id, pw);
//		if(result == 1) {
//			viewUrl = "탈퇴 결과";
//		}else {
//			viewUrl = "리다이렉트";
//		}
//		return viewUrl;
//		
//	}
	
	//회원 가입 정보 입력 페이지 및 회원 등록 기능은 각각의 컨트롤러에서 구현
	
	//회원수정처리
	@PostMapping("/modify")
	public String modify(
			@Valid MemberVO memberVO,
			HttpSession session
		) {
		String viewName = null;
		

		
		int result = memberSVC.modifyMember(memberVO);
		//수정 성공
		if(result == 1 ) {

			
			//세션의 회원정보 갱신
			//현재 세션정보 제거
			session.removeAttribute("member");
			//새로운 정보로 세션생성
			session.setAttribute("member", memberSVC.listOneMember(memberVO.getMember_id()));
			
			
			viewName = "/member/modifyResult";
		}else {
		//수정 실패	

			viewName = "/member/modifyForm";
		}
		return viewName;
	}
	
	
	//비밀번호 검증 체크 체크
	@ResponseBody
	@GetMapping("/checkPw")
	public boolean checkPw(@RequestParam String pw,HttpSession session) {
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		String member_id = memberVO.getMember_id();
		
		return memberSVC.checkPw(pw,member_id);
	}
	
	
	// VO가 아니라 뷰에서 단 두개의 정보만을 POST방식으로 들고 오는 법은 없을까 ?
	@PostMapping("/outMember")
	public String outMember(@Valid MemberVO memberVO,HttpSession session) {
		log.info("회원 탈퇴 실행");
		String viewName = null;
		String member_id = memberVO.getMember_id();
		String pw = memberVO.getPw();
		
		if(1 == memberSVC.outMember(member_id, pw)) {
			session.removeAttribute("member");
			viewName = "/member/outMemberResult";
		}else {
			viewName = "리다이렉트";
		}
		return viewName;
	};
	
}
