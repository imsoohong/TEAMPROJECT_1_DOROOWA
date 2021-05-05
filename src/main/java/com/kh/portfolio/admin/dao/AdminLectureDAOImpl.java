package com.kh.portfolio.admin.dao;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.portfolio.lecture.vo.LectureVO;
import com.kh.portfolio.member.vo.MemberVO;

@Repository
public class AdminLectureDAOImpl implements AdminLectureDAO {

	private static final Logger logger 
		= LoggerFactory.getLogger(AdminLectureDAOImpl.class);

	@Autowired
	JdbcTemplate jt;
	
	//회원목록
	@Override
	public List<MemberVO> memberList() {

		String sql = "select * from member";
		
		List<MemberVO> list = jt.query(sql, new BeanPropertyRowMapper(MemberVO.class));
		
		return list;
	}

	//온라인강의등록
	@Override
	public int registerOnLecture(LectureVO lectureVO) {
		
		int result= 0;
		
		StringBuilder sql = new StringBuilder();
		sql.append("INSERT INTO lecture (kinds,lecture_title,member_id,");
		sql.append("price,opendate,teacher_intro,");
		sql.append("lecture_intro,rating,type,thumbnail) ");
		sql.append("VALUES (?,?,?,?,?,?,?,?,?,?)");
		
		
		
		result = jt.update(sql.toString(), lectureVO.getKinds(), lectureVO.getLecture_title(), lectureVO.getMember_id(), 
				lectureVO.getPrice(), lectureVO.getOpendate(), lectureVO.getTeacher_intro(), 
				lectureVO.getLecture_intro(), 0, "on", lectureVO.getThumbnail());
		
		
		
		return result;
	}
	
	
	/**
	 * 강의소개수정
	 * @param lectureVO
	 * @return
	 */
	@Override
	public int modifyIntro(LectureVO lectureVO) {
		StringBuilder sql = new StringBuilder();
		sql.append("UPDATE lecture ");
		sql.append("SET intro = ? ");
		sql.append("WHERE lecture_title = ? ");
		return jt.update(sql.toString(), lectureVO.getIntro(), lectureVO.getLecture_title());
	}

	//아이디 입력 안됨 , 정원 입력
	//오프라인 강의 등록
	@Override
	public int registerOffLecture(LectureVO lectureVO) {
		
		int result= 0;
		
		StringBuilder sql = new StringBuilder();
		sql.append("INSERT INTO lecture (kinds,lecture_title,teacher_nickname,");
		sql.append("price,opendate,teacher_intro,");
		sql.append("lecture_intro,rating,type,location,startdate,enddate) ");
		sql.append("VALUES (?,?,?,?,?,?,?,0,'off',?,?,?)");
		
		
		
		result = jt.update(sql.toString(), lectureVO.getKinds(), lectureVO.getLecture_title(), lectureVO.getTeacher_nickname(), 
				lectureVO.getPrice(), lectureVO.getOpendate(), lectureVO.getTeacher_intro(), 
				lectureVO.getLecture_intro(),lectureVO.getLocation(), lectureVO.getStartdate(),lectureVO.getEnddate());
		
		
		
		return result;
	}
}





