package com.kh.portfolio.lecture.controller;

import java.util.List;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.kh.portfolio.lecture.svc.OfflineLectureSVC;
import com.kh.portfolio.lecture.vo.LectureVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@RestController
@Slf4j
@RequestMapping("/offlinelectures")
@RequiredArgsConstructor
public class RestOfflineLectureController {
	
	public final OfflineLectureSVC offlineLectureSVC;

	
	@GetMapping(value = "/list/{location}/{option}", produces = "application/json")
	public List<LectureVO> ratingList(
			@PathVariable("location") String location,
			@PathVariable("option") String option){
		
		
		
		
		
		
		return offlineLectureSVC.ratingList(location, option);
	}
	
	
	
	
	
}
