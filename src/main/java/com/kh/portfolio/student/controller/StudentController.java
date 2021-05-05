package com.kh.portfolio.student.controller;

import java.util.List;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.kh.portfolio.lecture.vo.LectureVO;
import com.kh.portfolio.member.svc.MemberSVC;
import com.kh.portfolio.member.vo.MemberVO;
import com.kh.portfolio.student.svc.StudentSVC;
import com.kh.portfolio.student.vo.BasketVO;
import com.kh.portfolio.student.vo.OrdersVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/student")
@Slf4j
public class StudentController {
	
	private final StudentSVC studentSVC;
	private final MemberSVC memberSVC;
	
	@Autowired
	public StudentController(StudentSVC studentSVC,MemberSVC memberSVC) {
		this.studentSVC = studentSVC;
		this.memberSVC = memberSVC;
	}
	

	

	/**
	 * 수강생 회원가입 정보입력페이지
	 * @return
	 */
	@GetMapping("/joinForm")
	public String joinForm() {
		return "/student/joinForm";
	}
	
	/**
	 * 수강생 회원가입 기능 처리
	 * @param memberVO
	 * @param errResult
	 * @return
	 */
	@PostMapping("/studentJoin")
	public String join(@Valid MemberVO memberVO,BindingResult errResult){
		String viewName = null;
		int result = 0;
		log.info("memberVO에 바인딩 된 정보" + memberVO);
		
		
		if(errResult.hasErrors()) {
			log.info("가입정보 입력값 유효성 오류 발생");
			return "/student/joinForm";
		}
		String member_id = memberVO.getMember_id();
				
		//아이디 중복 체크
		//가입하고자 하는 회원아이디가 중복시 
		if(memberSVC.checkMember(member_id)) {
			log.info("해당 아이디는 이미 가입된 아이디");
			viewName = "/student/joinForm";
			
		//가입하고자 하는 회원아이디가 중복 하지 않을 시
		}else {
			//회원 등록 성공(DB 쿼리 후 삽입 성공된 행의 수 "1"을 반환)
			result = studentSVC.joinStudent(memberVO);
			
			if(result == 1) {
				log.info("회원 정보 등록 성공");
				viewName = "redirect:/";
			}else {
				log.info("회원 정보 등록 실패");
				viewName = "/student/joinForm";
			}
		}
		return viewName;
	}
	

	
//
@GetMapping("/outMemberForm")
public String outMember() {
	
	return "/student/outMemberForm";
}
//
//@GetMapping("/joinForm")
//public String joinForm() {
//	return "/student/joinForm";
//}
	
	
	//회원정보수정 입력 페이지
	//로그인 된 해당 세션에서 회원 정보를 얻어 입력 페이지에 각각 바인딩
	@GetMapping("/modifyForm")
	public String modifyForm(Model model,HttpSession session) {
		
		//다른 서비스에서 담은 세션 정보를 해당 세션으로 불러올 수 있는가 ? 세션 명을 서로 다르게 해서 테스트하고 세션 참조타입의 주소값을 찍어서 대조 !
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		if(memberVO == null) {
			log.info("로그인 정보가 존재하지 않음");
			return "/member/loginForm";
		}
		MemberVO member = memberSVC.readMemberInfo(memberVO.getMember_id());
		member.setPw("");
		model.addAttribute("memberVO", member);

		
		return "/member/modifyForm";
	}
	
	//회원정보수정 기능
	@PostMapping("/modify")
	public String modify(@Valid MemberVO memberVO,BindingResult errResult,Model model,RedirectAttributes redirectattrs,HttpSession session) {
		String viewName = null;
		
		if(errResult.hasErrors()) {
			return "/student/modifyForm";
		}
		
		
		
		
		return viewName;
	}
	
	
	
	
	
	@GetMapping("/myPage")
	public String myPage(Model model, HttpSession session) {
		
		MemberVO m = (MemberVO)session.getAttribute("member");
		
		
		List<OrdersVO> list = studentSVC.onlineList(m.getMember_id());
		model.addAttribute("orderList", list);
		
		return "/student/myPage";
	}
		
	//OrdersVO 와 충돌발생
	@GetMapping("/myReserve")
	public String myReserve(Model model, HttpSession session) {
		
		MemberVO m = (MemberVO)session.getAttribute("member");
		
		List<OrdersVO> list = studentSVC.offlineLectureList(m.getMember_id());
		model.addAttribute("reserveList",list);
		log.info(model.toString());
		
		return "/student/myReserve";
	}
	
	
	
	
	@GetMapping("/myWish")
	public String myWish(Model model, HttpSession session) {
		
		MemberVO m = (MemberVO)session.getAttribute("member");
		List<LectureVO> list = studentSVC.wishList(m.getMember_id());
		
		model.addAttribute("wishList", list);
		
		return "/student/myWish";
	}
	
	@GetMapping("/myOrders")
	public String myOrders(Model model, HttpSession session) {
		
		MemberVO m = (MemberVO)session.getAttribute("member");
		
		List<OrdersVO> list = studentSVC.ordersList(m.getMember_id());
		
		model.addAttribute("orderList", list);

		
		
		
		return "/student/myOrders";
	}
	
	@GetMapping("/myBasket")
	public String basket(Model model, HttpSession session) {
		
		MemberVO m = (MemberVO)session.getAttribute("member");
		
		List<LectureVO> list = studentSVC.basketList(m.getMember_id());
		
		model.addAttribute("basketList", list);
		
		
		return "/student/myBasket";
	}
	

	
	
	
	@PatchMapping("/deleteWish/{lecture_title}")
	@ResponseBody
	public String deleteWish(@PathVariable String lecture_title, HttpSession session) {
		
		MemberVO m = (MemberVO)session.getAttribute("member");
		String status = null;
		
		log.info("됐나?");
		
		int result = studentSVC.deleteWish(lecture_title, m.getMember_id());
		
		log.info("lecture_title"+lecture_title);
		log.info("member_id"+ m.getMember_id());
		
		
		if(result == 1 ) {
			status = "ok";
			
		}else {
			status = "nope";
			
		}
		
		return status;
		
		
	}
	
	@PatchMapping("/insertWish/{lecture_title}")
	@ResponseBody
	public String insertWish(@PathVariable String lecture_title, HttpSession session) {
		
		MemberVO m = (MemberVO)session.getAttribute("member");
		
		String status = null;
		
		int result = studentSVC.insertWish(lecture_title, m.getMember_id());
		
		log.info("lecture_title"+lecture_title);
		log.info("member_id"+ m.getMember_id());
		
		
		if(result == 1 ) {
			status = "ok";
			
		}else {
			status = "nope";
			
		}
		
		return status;
		
		
	}
	
	
	@PostMapping("/addBasket/{lecture_title}")
	@ResponseBody
	public String addBasket(@PathVariable String lecture_title, HttpSession session) {
		
		log.info("넘어옴");
		MemberVO m = (MemberVO)session.getAttribute("member");
		
		log.info("lecture_title"+lecture_title);
		log.info("member_id"+ m.getMember_id());
		
		String status = null;
		
		
		int result = studentSVC.addBasket(m.getMember_id(), lecture_title);
		
		if(result == 1 ) {
			status = "ok";
			
		}else {
			status = "nope";
			
		}
		
		return status;
	}
	
	@PatchMapping("/refund/{order_id}")
	@ResponseBody
	public String refund(@PathVariable long order_id) {
		
		String status = null;
		
		int result = studentSVC.refund(order_id);
		log.info("order_id:"+order_id);
		
		if(result == 1 ) {
			status = "ok";
			
		}else {
			status = "nope";
			
		}
		
		log.info(status);
		
		return status;
		
		
	}
	

	

	
	

}
