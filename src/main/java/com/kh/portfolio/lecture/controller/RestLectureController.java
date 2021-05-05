package com.kh.portfolio.lecture.controller;

import java.util.HashMap;
import java.util.Map;
import java.util.Optional;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.portfolio.lecture.svc.ReviewSVC;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/lecture/review")
@Slf4j
@RequiredArgsConstructor
public class RestLectureController {
	
	public final ReviewSVC reviewSVC;
	
	
	@ResponseBody
	@GetMapping(value={"/{lecture_title}","/{lecture_title}/{nextRec}"},
							produces="application/json")
	public ResponseEntity<Map<String,Object>> reviewList(
			@PathVariable(required = false) Optional<Integer> nextRec,
			@PathVariable String lecture_title
			) {
		log.info("리뷰 리스트 불러오기");
		ResponseEntity<Map<String,Object>> reviewList = null;
		Map<String,Object> map = new HashMap<>();
		
		map.put("resultCode", "00");
		map.put("resultMessage", reviewSVC.reviewList(lecture_title, nextRec.orElse(1)));
		
		reviewList = new ResponseEntity<Map<String,Object>>(map,HttpStatus.OK);
		return reviewList;
	}
	

}
