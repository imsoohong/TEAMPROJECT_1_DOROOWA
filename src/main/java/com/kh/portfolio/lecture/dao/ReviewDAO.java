package com.kh.portfolio.lecture.dao;

import java.util.List;

import com.kh.portfolio.lecture.vo.ReviewVO;

public interface ReviewDAO {
	
	List<ReviewVO> reviewList(String lecture_title, int startRec, int endRec);
	
	int ratingCnt(String lecture_title, int rating);

}
