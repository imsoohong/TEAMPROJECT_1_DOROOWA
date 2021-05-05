package com.kh.portfolio.teacher.svc;

import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.portfolio.lecture.dao.LectureDAO;
import com.kh.portfolio.lecture.vo.ChapterVO;
import com.kh.portfolio.lecture.vo.LectureVO;
import com.kh.portfolio.member.vo.MemberVO;
import com.kh.portfolio.teacher.dao.TeacherDAO;
import com.kh.portfolio.video.vo.VideoVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@RequiredArgsConstructor
@Slf4j
public class TeacherSVCImpl implements TeacherSVC {
	
	private final TeacherDAO teacherDAO;
	private final LectureDAO lectureDAO;
	
	
//	private final TeacherDAO teacherDAO;
//	
//	
//	public TeacherSVCImpl (TeacherDAO teacherDAO) {
//		this.teacherDAO = teacherDAO;
//	}

	@Override
	public int joinTeacher(MemberVO memberVO) {
		log.info("int joinTeacher를 호출하였습니다 ! memberVO에 바인딩 된 정보는 " + memberVO);
		int result = 0;
		result = teacherDAO.joinTeacher(memberVO);
		return result;
	
	}
	
	@Override
	public boolean authentiCode(String code) {
		return teacherDAO.authentiCode(code);
	}
	
	@Override
	public int deleteCode(String code) {
		return teacherDAO.deleteCode(code);
	}
	
	
	/**
	 * 진행중인강의 리스트
	 * @param member_id
	 * @return
	 */
	@Override
	public List<LectureVO> lectureList(String member_id) {
		return teacherDAO.lectureList(member_id);
	}
	
	

	
	
	@Override
	public int addChapter(String chapter_title, String lecture_title, long chapter_id) {
		return teacherDAO.addChapter(chapter_title, lecture_title, chapter_id);
	}
	
	@Override
	public int deleteChapter(long chapter_id, String lecture_title) {
		return teacherDAO.deleteChapter(chapter_id, lecture_title);
	}
	
	@Override
	public int modifyChapter(String chapter_title, long chapter_id, String lecture_title) {
		return teacherDAO.modifyChapter(chapter_title, chapter_id, lecture_title);
	}
	



	/**
	 * 강의 영상 등록
	 * @param videoVO
	 * @return
	 */
	@Override
	public 	int uploadVideo(String title, String content, String lecture_title, String filename, String secret, long chapter_id) {
		return teacherDAO.uploadVideo(title, content, lecture_title, filename, secret, chapter_id);
	}
	
	@Override
	public int modifyVideo(String title, String content, String filename, String secret, long chapter_id, long video_id) {
		return teacherDAO.modifyVideo(title, content, filename, secret, chapter_id, video_id);
	}

}
