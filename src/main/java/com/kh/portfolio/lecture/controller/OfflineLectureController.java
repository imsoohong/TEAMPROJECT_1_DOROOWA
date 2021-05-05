package com.kh.portfolio.lecture.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.portfolio.lecture.svc.OfflineLectureSVC;
import com.kh.portfolio.lecture.vo.LectureVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/offlinelectures")
@RequiredArgsConstructor
@Slf4j
public class OfflineLectureController {
	
	private final OfflineLectureSVC offlineLectureSVC;
	
//	//오프라인 강의 메인 페이지
//	@GetMapping("/list")
//	public String offline(Model model) {
//		model.addAttribute("offlineLectureList",offlineLectureSVC.list());
//	return "/lecture/offline";
//	}
	
	//지역선택으로 해당 지역의 오프라인 강의 목록 불러오기
	@GetMapping("/list/{key:.+}")
	public String locationList(@PathVariable("key") String location, Model model) {
		model.addAttribute("offlineLectureList",offlineLectureSVC.locationList(location));
		model.addAttribute("location",location);
		return "/lecture/offline";
		
	}
	
	//강의 상세페이지
	@GetMapping("view/{lecture_title}")
	public String view(
			@PathVariable(name = "lecture_title") String lecture_title,
			Model model
			) {
		LectureVO lectureVO = offlineLectureSVC.view(lecture_title);
		model.addAttribute("lectureVO", lectureVO);
		return "/lecture/offlineLectureReadForm";
	}
	
	//강의 예약페이지
	@GetMapping("reserve/{lecture_title}")
	public String reserve(@PathVariable(name = "lecture_title") String lecture_title) {
		
		return "/lecture/offlineLectureReserveForm";
	}
	
}
