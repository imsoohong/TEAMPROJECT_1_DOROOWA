package com.kh.portfolio.lecture.svc;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.portfolio.lecture.dao.LectureDAO;
import com.kh.portfolio.lecture.vo.ChapterVO;
import com.kh.portfolio.lecture.vo.LectureVO;
import com.kh.portfolio.lecture.vo.QnaVO;
import com.kh.portfolio.lecture.vo.ReviewVO;
import com.kh.portfolio.video.vo.VideoVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class LectureSVCImpl implements LectureSVC {
	
	private final LectureDAO lectureDAO;

	@Override
	public List<LectureVO> getOnNewLecture() {
		
		return lectureDAO.getOnNewLecture();
	}

	@Override
	public List<LectureVO> getOnBestLecture() {
		return lectureDAO.getOnBestLecture();
	}

	@Override
	public List<LectureVO> getOnRecommendLecture() {

		return lectureDAO.getOnRecommendLecture();
	}

	@Override
	public int writeReview(ReviewVO reviewVO) {
		return lectureDAO.writeReview(reviewVO);
	}
	

	@Override
	public List<QnaVO> qnaList(String lecture_title) {
		return lectureDAO.qnaList(lecture_title);
	}
	
	@Override
	public List<ReviewVO> newReviewList() {
		return lectureDAO.newReviewList();
	}

	@Override
	public LectureVO listOneLecture(String lecture_title) {
		//log.info("서비스"+lectureDAO.listOneLecture(lecture_title));
		return lectureDAO.listOneLecture(lecture_title);
	}

	@Override
	public List<LectureVO> getOnLecture() {
		return lectureDAO.getOnLecture();
	}

	@Override
	public List<LectureVO> getOffLecture() {
		return lectureDAO.getOffLecture();
	}
	
	
	@Override
	public List<ChapterVO> chapterList(String lecture_title) {
		return lectureDAO.chapterList(lecture_title);
	}
	
	
	@Override
	public List<VideoVO> curriculum(String lecture_title) {
		return lectureDAO.curriculum(lecture_title);
	}
	
	
	@Override
	public int studentCnt(String lecture_title) {
		return lectureDAO.studentCnt(lecture_title);
	}
	
	
	@Override
	public int reviewCnt(String lecture_title) {
		return lectureDAO.reviewCnt(lecture_title);
	}
	
	@Override
	public List<LectureVO> alllectureList(String selectType) {
		
		return lectureDAO.alllectureList(selectType);
	}
	@Override
	public List<LectureVO> lectureList(String lectureType, String selectType) {
		
		return lectureDAO.lectureList(lectureType, selectType);
	}

}
