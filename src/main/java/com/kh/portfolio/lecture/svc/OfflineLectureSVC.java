package com.kh.portfolio.lecture.svc;

import java.util.List;

import com.kh.portfolio.lecture.vo.LectureVO;

public interface OfflineLectureSVC {
	
//	/**
//	 * 전체 강의 목록 조회
//	 * @return
//	 */
//	List<LectureVO> list();
	
	/**
	 * 지역 선택으로 오프라인 강의 목록 가져오기
	 * @param location
	 * @return
	 */
	List<LectureVO> locationList(String location);
	
	/**
	 * 지역랜덤
	 * @return
	 */
	String randomLoca();
	
	/**
	 * 강의 조회
	 * @param lecture_title
	 * @return
	 */
	LectureVO view(String lecture_title); 
	
	/**
	 * 정렬 기능 선택 후 높은 순으로 강의 재조회
	 * @return
	 */
	List<LectureVO> ratingList(String location, String option);
}
