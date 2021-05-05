package com.kh.portfolio.teacher.controller;

import java.util.List;
import java.util.Map;

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
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.portfolio.lecture.svc.LectureSVC;
import com.kh.portfolio.lecture.vo.ChapterVO;
import com.kh.portfolio.member.svc.MemberSVC;
import com.kh.portfolio.member.vo.MemberVO;
import com.kh.portfolio.teacher.svc.TeacherSVC;
import com.kh.portfolio.teacher.vo.AucodeVO;
import com.kh.portfolio.video.svc.VideoSVC;
import com.kh.portfolio.video.vo.VideoVO;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/teacher")
public class TeacherController {

	
	private final TeacherSVC teacherSVC;
	private final MemberSVC memberSVC;
	private final VideoSVC videoSVC;
	private final LectureSVC lectureSVC;
	
	
	@Autowired
	public TeacherController(TeacherSVC teacherSVC, MemberSVC memberSVC,VideoSVC videoSVC, LectureSVC lectureSVC) {
		this.teacherSVC = teacherSVC;
		this.memberSVC = memberSVC;
		this.videoSVC = videoSVC;
		this.lectureSVC = lectureSVC;
	}
	
	/**
	 * 강사 회원가입 정보입력페이지
	 * @return
	 */
	@GetMapping("/joinForm")
	public String joinForm() {
		return "/teacher/joinForm";
	}
	
	
	
	/**
	 * 강사 회원가입 기능 처리
	 * @param memberVO
	 * @param errResult
	 * @return
	 */
	@PostMapping("/teacherJoin")
	public String join(@Valid MemberVO memberVO, AucodeVO aucodeVO, BindingResult errResult, Model model){
		String viewName = null;
		int result = 0;
		log.info("memberVO에 바인딩 된 정보" + memberVO);
		
		
		if(errResult.hasErrors()) {
			log.info("가입정보 입력값 유효성 오류 발생");
			return "/teacher/joinForm";
		}
		String member_id = memberVO.getMember_id();
				
		//아이디 중복 체크
		//가입하고자 하는 회원아이디가 중복시 
		if(memberSVC.checkMember(member_id)) {
			log.info("해당 아이디는 이미 가입된 아이디");
			viewName = "/teacher/joinForm";	
		//가입하고자 하는 회원아이디가 중복 하지 않을 시
		}
		
		else if(!teacherSVC.authentiCode(aucodeVO.getCode())){
			model.addAttribute("svr_msg", "유효하지 않은 인증코드입니다.");
			viewName = "/teacher/joinForm";	
		}
		
		else {
			//회원 등록 성공(DB 쿼리 후 삽입 성공된 행의 수 "1"을 반환)
			result = teacherSVC.joinTeacher(memberVO);
			
			if(result == 1) {
				log.info("회원 정보 등록 성공");
				teacherSVC.deleteCode(aucodeVO.getCode());
				viewName = "redirect:/";
			}else {
				log.info("회원 정보 등록 실패");
				viewName = "/teacher/joinForm";
			}
		}
		return viewName;
	}
	
	
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
	
	
	

	
	
	@GetMapping("/studio")
	public String myPage(Model model,HttpSession session) {
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		
		
		model.addAttribute("lectureVO", teacherSVC.lectureList(memberVO.getMember_id()));
		return "/teacher/studio";
	}
	
	
	@GetMapping("/studio/{lecture_title}")
	public String studio(@PathVariable(name="lecture_title") String lecture_title,
						Model model,HttpSession session) {
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		model.addAttribute("lecture_title", lecture_title);
		
		model.addAttribute("videoList", videoSVC.videoList(lecture_title));
		model.addAttribute("lecture_title", lecture_title);
		model.addAttribute("chapterList", lectureSVC.chapterList(lecture_title));
		model.addAttribute("curriculum", lectureSVC.curriculum(lecture_title));
		
		return "/teacher/manage_chap";
	}
	
	
	
	@GetMapping("/studio/{lecture_title}/vid")
	public String manage(@PathVariable(name="lecture_title") String lecture_title,
			Model model,HttpSession session) {
		
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		model.addAttribute("lectureVO", teacherSVC.lectureList(memberVO.getMember_id()));
		model.addAttribute("videoList", videoSVC.videoList(lecture_title));
		model.addAttribute("lecture_title", lecture_title);
		model.addAttribute("chapterList", lectureSVC.chapterList(lecture_title));
		model.addAttribute("curriculum", lectureSVC.curriculum(lecture_title));
		
		
		return "/teacher/manage_vid";
	}
	
	@GetMapping("/studio/{lecture_title}/vid/{video_id}")
	public String modifyVid(@PathVariable(name="lecture_title") String lecture_title,
													@PathVariable(name="video_id") long video_id,
													Model model){
		
		model.addAttribute("videoVO", videoSVC.view(video_id));
		model.addAttribute("chapterList", lectureSVC.chapterList(lecture_title));
		
		
		return "/teacher/modifyVid";
	}
	
	

	
	
//	@PostMapping("/studio/{lecture_title}/modify")
//	@ResponseBody
//	public void modifyChapter(
//			@PathVariable(name="lecture_title") String lecture_title,
//			@RequestBody List<Object> list){
//		
//		log.info("넘어옴");
//		
//		//teacherSVC.registerChapter(list, lecture_title);
//		
//		list.stream().forEach(e -> {
//      System.out.println(e.toString());
//  });
//		
//
//
//
//		
//		
//		
//	}
	
	
	@PostMapping("/studio/{lecture_title}/{chapter_title}/{chapter_id}")
	@ResponseBody
	public String addChapter(
			@PathVariable String lecture_title,
			@PathVariable String chapter_title,
			@PathVariable long chapter_id
			) {
		
		String status = null;
		
		int result = teacherSVC.addChapter(chapter_title, lecture_title, chapter_id);
		
		if(result == 1 ) {
			status = "ok";
			
		}else {
			status = "nope";
			
		}
		
		return status;
		
	}
	
	
	@DeleteMapping("/studio/{lecture_title}/{chapter_id}")
	@ResponseBody
	public String deleteChapter(
			@PathVariable String lecture_title,
			@PathVariable long  chapter_id
			) {
		String status = null;
		int result = teacherSVC.deleteChapter(chapter_id, lecture_title);
		
		if(result == 1 ) {
			status = "ok";
			
		}else {
			status = "nope";
			
		}
		
		return status;
	}
	
	
	@PatchMapping("/studio/{lecture_title}/{chapter_title}/{chapter_id}")
	@ResponseBody
	public String modifyChapter(
			@PathVariable String lecture_title,
			@PathVariable String chapter_title,
			@PathVariable long chapter_id
			) {
		
		String status = null;
		int result = teacherSVC.modifyChapter(chapter_title, chapter_id, lecture_title);
		
		if(result == 1 ) {
			status = "ok";
			
		}else {
			status = "nope";
			
		}
		
		return status;
		
		
	}
	
	
	
	

	

	
	

	

	
	
	
	

}
