package com.kh.portfolio.lecture.dao;

import java.util.List;

import com.kh.portfolio.lecture.vo.LectureVO;

public interface OfflineLectureDAO {
	
	/**
	 * 전체 강의 목록 조회
	 * @return
	 */
	List<LectureVO> locationListAll();	
	/**
	 * 지역 선택 강의 목록 가져오기
	 * @param location
	 * @return
	 */
	List<LectureVO> locationList(String location);
	/**
	 * 지역 선택 강의 목록 가져오기
	 * @param location
	 * @return
	 */
	List<LectureVO> locationListEtc(String location);
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
	public List<LectureVO> ratingList(String location, String option);
	
	/**
	 * 정렬 기능 선택 후 높은 순으로 강의 재조회(지역 선택 전체 선택시)
	 * @return
	 */
	public List<LectureVO> ratingListAll(String option);
	
	/**
	 * 정렬 기능 선택 후 높은 순으로 강의 재조회(지역 선택 기타 선택시)
	 * @return
	 */
	public List<LectureVO> ratingListEtc(String location, String option);
}
