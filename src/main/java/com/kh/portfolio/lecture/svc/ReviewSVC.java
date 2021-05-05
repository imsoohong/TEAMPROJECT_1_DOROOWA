package com.kh.portfolio.lecture.svc;

import java.util.List;
import java.util.Map;

public interface ReviewSVC {

	
	
	Map<String,Object> reviewList(String lecture_title, int nextRec);
	
	List<Integer> ratingCnt(String lecture_title);
}
