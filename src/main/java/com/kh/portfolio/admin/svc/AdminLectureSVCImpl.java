package com.kh.portfolio.admin.svc;

import java.util.List;

import javax.transaction.Transactional;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.portfolio.admin.dao.AdminLectureDAO;
import com.kh.portfolio.lecture.vo.LectureVO;
import com.kh.portfolio.member.vo.MemberVO;

@Service
public class AdminLectureSVCImpl implements AdminLectureSVC{
	
	private static final Logger logger 
		= LoggerFactory.getLogger(AdminLectureSVCImpl.class);
	
	@Autowired
	AdminLectureDAO memberDAO;
	
	
	
	//회원목록
	@Override
	public List<MemberVO> memberList() {
		
		List<MemberVO> list = memberDAO.memberList();
		
		return list;
	}

	//강의등록
	@Transactional
	@Override
	public int registerOnLecture(LectureVO lectureVO) {
		int result = 0;
		result = memberDAO.registerOnLecture(lectureVO);
		
		return result;
	}
	
	//오프 강의등록
	@Transactional
	@Override
	public int registerOffLecture(LectureVO lectureVO) {
		int result = 0;
		result = memberDAO.registerOffLecture(lectureVO);
		
		return result;
	}
	
	/**
	 * 강의소개수정
	 * @param lectureVO
	 * @return
	 */
	@Override
	public int modifyIntro(LectureVO lectureVO) {
		return memberDAO.modifyIntro(lectureVO);
	}
	

}







