package com.kh.portfolio.teacher.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.portfolio.lecture.vo.ChapterVO;
import com.kh.portfolio.lecture.vo.LectureVO;
import com.kh.portfolio.member.vo.MemberVO;
import com.kh.portfolio.video.vo.VideoVO;

@Repository
public class TeacherDAOImpl implements TeacherDAO{
	private static final Logger logger = LoggerFactory.getLogger(TeacherDAOImpl.class);
	
	private final JdbcTemplate jt;
	
	
	
	public TeacherDAOImpl(JdbcTemplate jt) {
		this.jt = jt;
	}

	/**
	 * 강사 회원 등록 기능
	 */
	@Override
	public int joinTeacher(MemberVO memberVO) {
		logger.info(memberVO + "의 입력 정보로 강사 회원 등록 실행");
		int result = 0;
		StringBuilder sql = new StringBuilder();
		sql.append("insert into member(member_id,pw,nickname,name,tel,region,type) " );
		sql.append("values (?,?,?,?,?,?,'강사')");
		result = jt.update(sql.toString(),
											 memberVO.getMember_id(),
											 memberVO.getPw(),
											 memberVO.getNickname(),
											 memberVO.getName(),
											 memberVO.getTel(),
											 memberVO.getRegion());
		return result;
	}
	
	
	@Override
	public boolean authentiCode(String code) {
		boolean result = false;
		StringBuilder sql = new StringBuilder();
		sql.append("select count(*) " );
		sql.append("from aucode ");
		sql.append("where code = ? ");
		
		Integer cnt = jt.queryForObject(sql.toString(), Integer.class, code);
		result = (cnt > 0) ? true : false;
		
		return result;
	}
	
	@Override
	public int deleteCode(String code) {
		int result = 0;
		StringBuilder sql = new StringBuilder();
		sql.append("delete from aucode " );
		sql.append("where code = ? ");
		
		jt.update(sql.toString(), code);
		return result;
	}
	
	
//	
//	//회원 정보 수정
//	public int modifyStudent(MemberVO memberVO) {
//		int result = 0;
//		StringBuilder sql = new StringBuilder();
//		//=====================회원정보를 더 늘릴것인가 ? null 값으로 가지고 갈 데이터는 무엇인가 ? ==========================
//		return result;
//		
//	}
	
	/**
	 * 진행중인강의 리스트
	 * @param member_id
	 * @return
	 */
	@Override
	public List<LectureVO> lectureList(String member_id) {
		StringBuilder sql = new StringBuilder();
		sql.append("select * from lecture " );
		sql.append("where member_id = ? ");
		sql.append("order by opendate ");
		
		return jt.query(sql.toString(), new BeanPropertyRowMapper<>(LectureVO.class),member_id);
		
	}
	
	

	
	
	/**
	 * 챕터등록
	 * @param list
	 */
//	@Override
//	public void registerChapter(List<ChapterVO> list) {
//
//		
//		StringBuilder sql = new StringBuilder();
//		sql.append("INSERT INTO chapter (chapter_title,lecture_title,chapter_id ) " );
//		sql.append("VALUES (?,?,?); ");
//		
//		jt.batchUpdate(sql.toString(), new BatchPreparedStatementSetter() {
//			
//			@Override
//			public void setValues(PreparedStatement ps, int i) throws SQLException {
//				ps.setString(1, list.get(i).getChapter_title());
//				ps.setString(2, list.get(i).getLecture_title());
//				ps.setLong(3, list.get(i).getChapter_id());
//			}
//			
//			@Override
//			public int getBatchSize() {
//				return list.size();
//			}
//		});
//		
//		
//		
//	}
	
	/**
	 * 챕터등록
	 * @param chapterVO
	 * @return
	 */
  @Override
  public int addChapter(String chapter_title, String lecture_title, long chapter_id) {
  	StringBuilder sql = new StringBuilder();
		sql.append("INSERT INTO chapter (chapter_title,lecture_title,chapter_id)  " );
		sql.append("VALUES (?,?,?)");
		return jt.update(sql.toString(), chapter_title, lecture_title, chapter_id );
  }
	
	
	/**
	 * 챕터삭제
	 * @param lecture_title
	 */
	public int deleteChapter(long chapter_id, String lecture_title) {
		StringBuilder sql = new StringBuilder();
		sql.append("DELETE FROM chapter " );
		sql.append("where chapter_id = ? " );
		sql.append("and lecture_title = ? ");
		
		int result = jt.update(sql.toString(), chapter_id, lecture_title);
		
		if(result==1) {
			deleteVideoAll(lecture_title);
		}
		
		return result;
	}
	
	private void deleteVideoAll(String lecture_title) {
		StringBuilder sql = new StringBuilder();
		sql.append("DELETE FROM video " );
		sql.append("where lecture_title = ? ");
		
		jt.update(sql.toString(), lecture_title);
	}

	/**
	 * 챕터수정
	 * @param chapter_title
	 * @param chapter_id
	 * @param lecture_title
	 * @return
	 */
	@Override
	public int modifyChapter(String chapter_title, long chapter_id, String lecture_title) {
		StringBuilder sql = new StringBuilder();
		sql.append("UPDATE chapter " );
		sql.append("SET chapter_title = ? " );
		sql.append("WHERE chapter_id = ? ");
		sql.append("and lecture_title = ? ");
		return jt.update(sql.toString(), chapter_title, chapter_id, lecture_title);
	}

	/**
	 * 강의 영상 등록
	 * @param videoVO
	 * @return
	 */
	@Override
	public int uploadVideo(String title, String content, String lecture_title, String filename, String secret, long chapter_id) {
		StringBuilder sql = new StringBuilder();
		sql.append("INSERT INTO video (video_id, title, content, cdate, lecture_title, filename, secret, chapter_id ) " );
		sql.append("values (video_id_seq.nextval,?,?,sysdate,?,?,?,?)");
		
		return jt.update(sql.toString(), title, content, lecture_title, filename, secret, chapter_id);
		
	}
	
	@Override
	public int modifyVideo(String title, String content, String filename, String secret, long chapter_id, long video_id) {
		StringBuilder sql = new StringBuilder();
		sql.append("UPDATE video " );
		sql.append("SET title = ?, " );
		sql.append("content = ?, ");
		sql.append("udate = sysdate, ");
		sql.append("filename = ?, ");
		sql.append("secret = ?, ");
		sql.append("chapter_id = ? ");
		sql.append("WHERE video_id = ?  ");
		return jt.update(sql.toString(), title, content, filename, secret, chapter_id, video_id);
	}
	
	
	
	
	
	

}
