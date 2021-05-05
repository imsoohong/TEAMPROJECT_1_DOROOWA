package com.kh.portfolio.lecture.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.kh.portfolio.common.svc.MailService;
import com.kh.portfolio.lecture.svc.LectureSVC;
import com.kh.portfolio.lecture.svc.ReviewSVC;
import com.kh.portfolio.lecture.vo.ChapterVO;
import com.kh.portfolio.lecture.vo.LectureVO;
import com.kh.portfolio.lecture.vo.QnaVO;
import com.kh.portfolio.lecture.vo.ReviewVO;
import com.kh.portfolio.member.vo.MemberVO;
import com.kh.portfolio.student.svc.StudentSVC;
import com.kh.portfolio.video.svc.VideoSVC;
import com.kh.portfolio.video.vo.VideoVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/lecture")
@RequiredArgsConstructor

public class LectureController {
	
	private final MailService mailService;
	private final LectureSVC lectureSVC;
	private final VideoSVC videoSVC;
	private final StudentSVC studentSVC;
	private final ReviewSVC reviewSVC;

	
	@GetMapping("/applyForm")
	public String applyForm() {
		return "/lecture/applyForm";
	}
	
	
	@PostMapping("/apply")
	public Map<String,Object> apply(
			@RequestBody Map<String,String> reqData) {
		
		Map<String,Object> map = new HashMap<>();
		
		try {
			String mailSubject = "강의신청폼";
			StringBuilder sb = new StringBuilder();
			sb.append("<!DOCTYPE html>");
			sb.append("<html lang='ko'>");
			sb.append("<head>");
			sb.append("  <meta charset='UTF-8'>");
			sb.append("  <meta name='viewport' content='width=device-width, initial-scale=1.0'>");
			sb.append("  <title>강의신청폼</title>");
			sb.append("</head>");
			sb.append("<body>");
			sb.append("  <h1>강의신청폼</h1>");
			sb.append("  <p>성함 :" + reqData.get("name") + "</p>");
			sb.append("  <p>연락처 :" + reqData.get("tel") + "</p>");
			if(reqData.get("category").equals("기타")) {
				sb.append("  <p>희망카테고리 :" + reqData.get("etctext") + "</p>");
			}else {
				sb.append("  <p>희망카테고리 :" + reqData.get("category") + "</p>");
				
			}
			sb.append("  <p>강의이름:" + reqData.get("title") + "</p>");
			sb.append("  <p>가격 :" + reqData.get("price") + "</p>");
			sb.append("  <p>강의설명 :" + reqData.get("description") + "</p>");

			sb.append("</body>");
			sb.append("</html>");
			
			mailService.sendMail("gnh967@gmail.com", mailSubject, sb.toString());
			map.put("rtcd", "00");
			map.put("result", "강의신청 완료");
		} catch (Exception e) {
			e.printStackTrace();
			map.put("rtcd", "01");
			map.put("errmsg","강의신청 실패" );		
		}			

		
		return map;
	}
	
	
	@GetMapping({"/online",
		"/online/{selectType}",
		"/online/{lectureType}/{selectType}"
	})
	public String online(
			Model model,
			@PathVariable(required = false) String lectureType,
			@PathVariable(required = false) String selectType
			) {
		
		log.info("==*==*==*==*==*==*==*==*==*==*==*==*");
		log.info("||강의타입 선택 ==>"+lectureType);
		log.info("||정렬 선택 ==>"+selectType);
		log.info("==*==*==*==*==*==*==*==*==*==*==*==*");
		
		
		if(selectType== null) {
			model.addAttribute("Lecture", lectureSVC.alllectureList("late"));
			return "/lecture/online";
		}
		
		if(lectureType != null && selectType != null) {
			//둘다 값이 있을떄
			model.addAttribute("Lecture", lectureSVC.lectureList(lectureType, selectType));
			
			if(lectureType == "all") {
				//(값이있을떄) 강의타입이 "전체" 일떄
				model.addAttribute("Lecture", lectureSVC.alllectureList(selectType));
			}
		}else {
			model.addAttribute("Lecture", lectureSVC.alllectureList(selectType));
		}
		
		
		return "/lecture/online";
		
	}
	
	
	@GetMapping("/reviewForm")
	
	public String reviewForm() {
		return "/lecture/reviewForm";
	}
	
	@PostMapping("/review")
	
	public String review(ReviewVO reviewVO) {
		String viewName = null;
		
		int result = lectureSVC.writeReview(reviewVO);
		
		
		if(result==1) {
			viewName = "redirect:/student/myPage";
		}else {
			viewName = "/lecture/reviewForm";
		}
		
		return viewName;
		
	}
	
	
	@GetMapping("/{lecture_title}/detail")
	public String detail(@PathVariable(name="lecture_title") String lecture_title, 
						Model model, HttpSession session) {
		

		
		MemberVO memberVO = (MemberVO)session.getAttribute("member");
		
		model.addAttribute("lectureVO", lectureSVC.listOneLecture(lecture_title));
		
		
		model.addAttribute("qnaList", lectureSVC.qnaList(lecture_title));

		model.addAttribute("videoList", videoSVC.videoList(lecture_title));
		
		model.addAttribute("curriculum", lectureSVC.curriculum(lecture_title));
		
		model.addAttribute("chapterList", lectureSVC.chapterList(lecture_title));
		
		
		
		model.addAttribute("studentCnt", lectureSVC.studentCnt(lecture_title));
		model.addAttribute("reviewCnt", lectureSVC.reviewCnt(lecture_title));
		
		model.addAttribute("ratingCnt", reviewSVC.ratingCnt(lecture_title) );

		
		
		
		model.addAttribute("reviewYn", "none");
		
		//1)회원인 경우
		if(memberVO != null) {
			//1-1)찜등록했을 경우
			if(studentSVC.existWish(memberVO.getMember_id(), lecture_title)){
				model.addAttribute("wishYn", "deleteWish");
				model.addAttribute("wishContent", "찜 해제하기");
			//1-2)찜등록안했을 경우
			}else {
				model.addAttribute("wishYn", "insertWish");
				model.addAttribute("wishContent", "찜 등록하기");
			}
			//2-1)구매했을 경우
			if(studentSVC.existOrder(memberVO.getMember_id(), lecture_title)) {
					//비공개강의까지 다 볼 수 있게
					//2-1-1)수강기록이 있을 경우
				if(studentSVC.existProgress(lecture_title, memberVO.getMember_id())) {
					model.addAttribute("orderYn", "recentVideo");
					model.addAttribute("orderContent", "이어서 수강하기");
					model.addAttribute("myProgress", studentSVC.myProgress(lecture_title, memberVO.getMember_id()));
					model.addAttribute("openYn", true);
					//리뷰작성버튼 활성화
					model.addAttribute("reviewYn", "display");
					
					//2-1-2)수강기록이 없을 경우
				}else {
					model.addAttribute("orderYn", "startProgress");
					model.addAttribute("orderContent", "수강시작");
					model.addAttribute("openYn2", true);

				}
			//2-2)구매안했을 경우
			}else {
				model.addAttribute("openYn", false);
				if(studentSVC.existBasket(lecture_title, memberVO.getMember_id())) {
					model.addAttribute("orderYn", "alreadyExist");
					model.addAttribute("orderContent", "수강신청");
				}else {
					model.addAttribute("orderYn", "orderThis");
					model.addAttribute("orderContent", "수강신청");
					
				}
			}
			
		//2)회원이 아닐 경우
		}else {
			model.addAttribute("wishYn", "insertWish");
			model.addAttribute("wishContent", "찜 등록하기");
			model.addAttribute("orderYn", "");
			model.addAttribute("orderContent", "수강신청");
			
		}
		
		
		
		
		
		
		
		return "/lecture/detail";
	}
	
	
	@GetMapping("/{lecture_title}/writeQnaForm") 
	public String writeQnaForm(
			@PathVariable(name="lecture_title") String lecture_title){
		
		
		return "/lecture/qnaForm";
	}
	
	@PostMapping("/{lecture_title}/writeQna") 
	public String writeQna(){
		
		
		
		return "redirect:/lecture/detail";
	}
	
	
	
	// 더보기 요청
//	@PostMapping(value = "/reviewList",produces = "application/text;charset=UTF-8")
//	@ResponseBody
//	public String searchMoreNotify(@RequestParam Map<String,String> param) throws Exception {
//		Map<String, String> searchParam = new HashMap<String, String>();	// search 파라미터 생성
//		searchParam.put("startIndex", param.get("startIndex"));	
//		searchParam.put("endIndex", param.get("endIndex"));
//		searchParam.put("title", param.get("title"));
//		// startIndex ~ endIndex 범위에 해당하는 list 조회 
//		//List<MemberP005VO> addList = memberP005_d001Service.searchOldNotifyList(searchParam);
//		
//		String title = "자바";
//		int startIndex = 1;
//		int endIndex = 5;
//		
//		List<ReviewVO> reviewList = lectureSVC.reviewList(title, startIndex,endIndex);
//		
//		ObjectMapper mapper = new ObjectMapper();
//		String jsonStr = mapper.writeValueAsString(reviewList);
//		return jsonStr;
//	}
	
	

	
	
	

	

	
	
	
	
	
	
	

	
	

	
	
	
	
	
	
	

}
