package com.kh.portfolio.lecture.svc;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.kh.portfolio.lecture.dao.ReviewDAO;
import com.kh.portfolio.lecture.vo.ReviewVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class ReviewSVCImpl implements ReviewSVC{
	
	private final ReviewDAO reviewDAO;

	@Override
	public Map<String,Object> reviewList(String lecture_title, int nextRec) {
		Map<String,Object> map =  new HashMap<>();
		
		Boolean exist = true;
		int startRec = (nextRec*5)-4;
		int endRec = nextRec*5;
		List<ReviewVO> list = reviewDAO.reviewList(lecture_title, startRec, endRec);
		List<ReviewVO> listLast = reviewDAO.reviewList(lecture_title, startRec+5, endRec+5);		
		if( list.size() == 5 && listLast.size() < 5 ) {
			exist = false;
		}
		
		map.put("list",list);
		map.put("checkVolume",exist);
		
		return map;
	}
	
	@Override
	public List<Integer> ratingCnt(String lecture_title) {
		
		List<Integer> list = new ArrayList<>();
		
		for(int i=1; i<6; i++) {
			list.add(reviewDAO.ratingCnt(lecture_title, i));
		}
		
		return list;
	}

}
