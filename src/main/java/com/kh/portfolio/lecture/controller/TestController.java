package com.kh.portfolio.lecture.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.RequiredArgsConstructor;

//사용할 곳에 해당 컨트롤러를 이용해 주소를 바꿔사용해야 함 !
@Controller
@RequestMapping("/test")
public class TestController {

	
	
	@GetMapping("/tt")
	public String test() {
		
		return "test";
	}
	
	//카카오 맵 (ajxa시 사용)
	@GetMapping("/map")
	public String map() {
		return "map";
	}
	//도로명 주소 검색
	@GetMapping("/jusoPopup")
	public String addr() {
		return "jusoPopup";
	}
	//오프라인 강의 등록
//	@GetMapping("/offLectureregist")
//	public String offLectureregist() {
//		return "registerOffLectureForm";
//	}
	
}
