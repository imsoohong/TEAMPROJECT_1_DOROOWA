package com.kh.portfolio.admin.svc;

import java.util.List;

import com.kh.portfolio.lecture.vo.LectureVO;
import com.kh.portfolio.member.vo.MemberVO;

public interface AdminLectureSVC {
	
	//회원목록
	List<MemberVO> memberList();
	
	//강의등록
	int registerOnLecture(LectureVO lectureVO);
	
	//오프라인 강의 등록
	int registerOffLecture(LectureVO lectureVO);
	
	/**
	 * 강의소개수정
	 * @param lectureVO
	 * @return
	 */
	int modifyIntro(LectureVO lectureVO);
}
