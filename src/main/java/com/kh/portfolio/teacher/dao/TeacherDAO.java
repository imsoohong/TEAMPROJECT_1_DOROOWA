package com.kh.portfolio.teacher.dao;

import java.util.List;

import com.kh.portfolio.lecture.vo.LectureVO;
import com.kh.portfolio.member.vo.MemberVO;
import com.kh.portfolio.video.vo.VideoVO;

public interface TeacherDAO {
	
	/**
	 * 강사 회원 등록
	 * @param memberVO
	 * @return
	 */
	int joinTeacher(MemberVO memberVO);
	
	/**
	 * 인증 코드
	 * @param code
	 * @return
	 */
	boolean authentiCode(String code);
	
	/**
	 * 회원가입 후 인증코드 삭제
	 * @param code
	 * @return
	 */
	int deleteCode(String code);
	
	
	/**
	 * 진행중인강의 리스트
	 * @param member_id
	 * @return
	 */
	List<LectureVO> lectureList(String member_id);
	
	

	
	

	/**
	 * 챕터등록
	 * @param chapterVO
	 * @return
	 */
	int addChapter(String chapter_title, String lecture_title, long chapter_id);
	
	/**
	 * 챕터삭제
	 * @param chapter_id, lecture_title
	 */
	int deleteChapter(long chapter_id, String lecture_title);
	
	
	
	/**
	 * 챕터수정
	 * @param chapter_title
	 * @param chapter_id
	 * @param lecture_title
	 * @return
	 */
	int modifyChapter(String chapter_title, long chapter_id, String lecture_title);

	
	/**
	 * 강의 영상 등록
	 * @param videoVO
	 * @return
	 */
	int uploadVideo(String title, String content, String lecture_title, String filename, String secret, long chapter_id);

	/**
	 * 강의 영상 수정
	 * @param videoVO
	 * @return
	 */
	int modifyVideo(String title, String content, String filename, String secret, long chapter_id, long video_id);
	
	
}
