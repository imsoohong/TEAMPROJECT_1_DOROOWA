package com.kh.portfolio.lecture.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.kh.portfolio.lecture.vo.ChapterVO;
import com.kh.portfolio.lecture.vo.LectureVO;
import com.kh.portfolio.lecture.vo.QnaVO;
import com.kh.portfolio.lecture.vo.ReviewVO;
import com.kh.portfolio.member.vo.MemberVO;
import com.kh.portfolio.student.vo.OrdersVO;
import com.kh.portfolio.video.vo.VideoVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@RequiredArgsConstructor
@Slf4j
public class LectureDAOImpl implements LectureDAO {
	
	private final JdbcTemplate jt;
	
//	private final ReviewVO reviewVO;
	

//신규 온라인강의 리스트
	@Override
	public List<LectureVO> getOnNewLecture() {
		
//		StringBuilder sql = new StringBuilder();
//		sql.append("select * from lecture  ");
//		sql.append("where opendate < sysdate ");
//		sql.append("order by opendate desc ");
		
		
		StringBuilder sql = new StringBuilder();
		sql.append("select t1.kinds, t1.lecture_title, t2.nickname, t1.price, t1.lecture_intro, t1.rating, t1.thumbnail  ");
		sql.append("from lecture t1, member t2 ");
		sql.append("where t1.member_id = t2.member_id ");
		sql.append("and t1.type = 'on' ");
		sql.append("and t1.opendate <= sysdate ");
		sql.append("order by opendate desc ");
		
		List<LectureVO> list = jt.query(
				sql.toString(), 
				new RowMapper<LectureVO>() {

					@Override
					public LectureVO mapRow(ResultSet rs, int rowNum) throws SQLException {
						LectureVO lectureVO = new LectureVO();
						lectureVO.setKinds(rs.getString("kinds"));
						lectureVO.setLecture_title(rs.getString("lecture_title"));
						lectureVO.setPrice(rs.getLong("price"));
						lectureVO.setLecture_intro(rs.getString("lecture_intro"));
						lectureVO.setRating(rs.getFloat("rating"));
						lectureVO.setThumbnail(rs.getString("thumbnail"));
						
						MemberVO memberVO = new MemberVO();
						memberVO.setNickname(rs.getString("nickname"));
						
						lectureVO.setMemberVO(memberVO);
						return lectureVO;
					}
					
				}
		);
		
		return list;

	}

//인기 온라인강의 리스트
	@Override
	public List<LectureVO> getOnBestLecture() {
		
//		StringBuilder sql = new StringBuilder();
//		sql.append("select t2.lecture_title, t2.price, t2.rating, t2.teacher_nickname, type, count(*)  ");
//		sql.append("from orders t1, lecture t2  ");
//		sql.append("where t1.lecture_title = t2.lecture_title ");
//		sql.append("group by t2.lecture_title, t2.price, t2.rating, t2.teacher_nickname, type ");
//		sql.append("order by count(*) desc ");
		
		
		

		StringBuilder sql = new StringBuilder();
		sql.append("select t2.lecture_title, t2.price, t2.rating, t3.nickname, t2.lecture_intro, t2.thumbnail, count(*)  ");
		sql.append("from orders t1, lecture t2, member t3  ");
		sql.append("where t1.lecture_title = t2.lecture_title ");
		sql.append("and t2.member_id = t3.member_id ");
		sql.append("and t2.type = 'on' ");
		sql.append("group by t2.lecture_title, t2.price, t2.rating, t3.nickname, t2.lecture_intro, t2.thumbnail ");
		sql.append("order by count(*) desc ");
		
		List<LectureVO> list = jt.query(
				sql.toString(), 
				new RowMapper<LectureVO>() {

					@Override
					public LectureVO mapRow(ResultSet rs, int rowNum) throws SQLException {

						LectureVO lectureVO = new LectureVO();
						lectureVO.setLecture_title(rs.getString("lecture_title"));
						lectureVO.setPrice(rs.getLong("price"));
						lectureVO.setLecture_intro(rs.getString("lecture_intro"));
						lectureVO.setRating(rs.getFloat("rating"));
						lectureVO.setThumbnail(rs.getString("thumbnail"));
						
						MemberVO memberVO = new MemberVO();
						memberVO.setNickname(rs.getString("nickname"));
						
						lectureVO.setMemberVO(memberVO);
						return lectureVO;
					}
					
				}
		);
		
		return list;
		
	}

//추천 온라인강의 리스트
	@Override
	public List<LectureVO> getOnRecommendLecture() {
		
		StringBuilder sql = new StringBuilder();
		sql.append("select t1.lecture_title, t1.price, t1.rating, t2.nickname, t1.lecture_intro, t1.thumbnail   ");
		sql.append("from lecture t1, member t2  ");
		sql.append("where t1.type = 'on' ");
		sql.append("and t1.member_id = t2.member_id ");
		sql.append("order by t1.rating desc ");
		
		
		//4개만
//		StringBuilder sql = new StringBuilder();
//		sql.append("select * from   ");
//		sql.append("(select * from lecture ");
//		sql.append("order by rating desc) ");
//		sql.append("where rownum <= 4 ");
		
		
		List<LectureVO> list = jt.query(
				sql.toString(), 
				new RowMapper<LectureVO>() {

					@Override
					public LectureVO mapRow(ResultSet rs, int rowNum) throws SQLException {

						LectureVO lectureVO = new LectureVO();
						lectureVO.setLecture_title(rs.getString("lecture_title"));
						lectureVO.setPrice(rs.getLong("price"));
						lectureVO.setLecture_intro(rs.getString("lecture_intro"));
						lectureVO.setRating(rs.getFloat("rating"));
						lectureVO.setThumbnail(rs.getString("thumbnail"));
						
						MemberVO memberVO = new MemberVO();
						memberVO.setNickname(rs.getString("nickname"));
						
						lectureVO.setMemberVO(memberVO);
						return lectureVO;
					}
					
				}
		);
		
		return list;
	}

//리뷰 작성
	@Override
	public int writeReview(ReviewVO reviewVO) {
		
		int result = 0;
		StringBuilder sql = new StringBuilder();
		sql.append("INSERT INTO review (  ");
		sql.append("    review_id, ");
		sql.append("    rcontent, ");
		sql.append("    rating, ");
		sql.append("    lecture_title, ");
		sql.append("    member_id, ");
		sql.append("    cdate ");
		sql.append(") VALUES ( ");
		sql.append("    review_id_seq.nextval, ");
		sql.append("    ?, ");
		sql.append("    ?, ");
		sql.append("    ?, ");
		sql.append("    ?, ");
		sql.append("    sysdate ");
		sql.append(") ");
		
		result =  jt.update(sql.toString(), reviewVO.getRcontent(), reviewVO.getRating(), reviewVO.getLecture_title(),reviewVO.getMember_id()  );
		
		if(result==1) {
			updateReview(reviewVO.getLecture_title());
		}
		
		return result;
	}
	
	
	
	
	


//강의별점 업데이트
	private void updateReview(String lecture_title) {
		StringBuilder sql = new StringBuilder();
		sql.append("UPDATE lecture  ");
		sql.append("SET rating = (select trunc(sum(rating)/count(*),2) ");
		sql.append("from review ");
		sql.append("where lecture_title =  ? ) ");
		sql.append("where lecture_title = ? ");
		
		jt.update(sql.toString(), lecture_title, lecture_title);
	}

//QnA 리스트
	@Override
	public List<QnaVO> qnaList(String lecture_title) {
		StringBuilder sql = new StringBuilder();
		sql.append("select qna_num,title,content, ");
		sql.append("    qgroup,qstep,lecture_title,nickname,cdate ");
		sql.append("    from qna ");		
		sql.append("    where lecture_title = ? ");		
		sql.append("    order by qna_num desc ");
		
		List<QnaVO> list = jt.query(sql.toString(), new BeanPropertyRowMapper<>(QnaVO.class), lecture_title);
		
		return list;
	}
	
	@Override
	public List<ReviewVO> newReviewList() {
		StringBuilder sql = new StringBuilder();
		sql.append("select * from review ");
		sql.append("order by cdate desc ");
		
		
		return jt.query(sql.toString(), new BeanPropertyRowMapper<>(ReviewVO.class));
	}

	@Override
	public LectureVO listOneLecture(String lecture_title) {
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT * ");
		sql.append("    FROM lecture ");		
		sql.append("    where lecture_title = ? ");
		
		
		LectureVO lectureVO = jt.queryForObject(sql.toString(), new BeanPropertyRowMapper<>(LectureVO.class), lecture_title);

		
		return lectureVO;
	}

	@Override
	public List<LectureVO> getOnLecture() {
		StringBuilder sql = new StringBuilder();
		sql.append("select * from lecture ");
		sql.append("where type = 'on' ");
		
		List<LectureVO> list = jt.query(sql.toString(), new BeanPropertyRowMapper<LectureVO>(LectureVO.class));
		
		
		return list;
		}

	@Override
	public List<LectureVO> getOffLecture() {
		StringBuilder sql = new StringBuilder();
		sql.append("select * from lecture ");
		sql.append("where type = 'off' ");
		
		List<LectureVO> list = jt.query(sql.toString(), new BeanPropertyRowMapper<LectureVO>(LectureVO.class));
		
		
		return list;
	}
	
	
	
	/**
	 * 챕터존재여부
	 * @param lecture_title
	 * @return
	 */
	@Override
	public boolean existChapter(String lecture_title) {
		boolean result = false;
		StringBuilder sql = new StringBuilder();
		sql.append("select count(*) " );
		sql.append("from chapter ");
		sql.append("where lecture_title = ? ");
		
		Integer cnt = jt.queryForObject(sql.toString(), Integer.class, lecture_title);
		result = (cnt > 0) ? true : false;
		
		return result;
	}

	
	/**
	 * 챕터리스트
	 * @return
	 */
	@Override
	public List<ChapterVO> chapterList(String lecture_title) {
		StringBuilder sql = new StringBuilder();
		sql.append("select chapter_title, lecture_title, chapter_id ");
		sql.append("from chapter ");
		sql.append("where lecture_title = ? ");
		sql.append("order by chapter_id ");
		
		List<ChapterVO> list = jt.query(sql.toString(), new BeanPropertyRowMapper<>(ChapterVO.class), lecture_title);
		
		return list;
	}
	
	
	
	@Override
	public List<VideoVO> curriculum(String lecture_title) {
		StringBuilder sql = new StringBuilder();
		sql.append("select t1.chapter_title as \"chapterVO.chapter_title\",  ");
		sql.append("t2.chapter_id, t2.video_id, t2.title, t2.secret  ");
		sql.append("from chapter t1, video t2 ");
		sql.append("where t1.lecture_title = t2.lecture_title ");
		sql.append("and t1.chapter_id = t2.chapter_id ");
		sql.append("and t2.lecture_title = ? ");
		sql.append("order by chapter_id, video_id ");
		
		List<VideoVO> list = jt.query(sql.toString(), new RowMapper<VideoVO>() {

			@Override
			public VideoVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				VideoVO videoVO = new VideoVO();
				videoVO.setChapter_id(rs.getInt("chapter_id"));
				videoVO.setVideo_id(rs.getLong("video_id"));
				videoVO.setTitle(rs.getString("title"));
				videoVO.setSecret(rs.getString("secret"));
				
				ChapterVO chapterVO = new ChapterVO();
				chapterVO.setChapter_title(rs.getString("chapterVO.chapter_title"));
				
				videoVO.setChapterVO(chapterVO);
				
				return videoVO;
			}
			
		}, lecture_title);
		
		return list;
	}
	
	
	
	@Override
	public int studentCnt(String lecture_title) {
		StringBuilder sql = new StringBuilder();
		sql.append("select count(*) ");
		sql.append("from orders ");
		sql.append("where lecture_title = ? ");
		sql.append("and status = '구매완료' ");
		return jt.queryForObject(sql.toString(), Integer.class, lecture_title);
	}
	
	
	@Override
	public int reviewCnt(String lecture_title) {
		StringBuilder sql = new StringBuilder();
		sql.append("select count(*) ");
		sql.append("from review ");
		sql.append("where lecture_title = ? ");
		return jt.queryForObject(sql.toString(), Integer.class, lecture_title);

	}
	
	
	@Override
	public int updateCnt(String lecture_title, String count) {
		StringBuilder sql = new StringBuilder();
		sql.append("update lecture ");
		sql.append("set count = ? ");
		sql.append("WHERE lecture_title = ? ");
		return jt.update(sql.toString(), count, lecture_title);
	}

	@Override
	public List<LectureVO> alllectureList(String selectType) {
		StringBuilder sql = new StringBuilder();
		
		sql.append("select kinds, ");
		sql.append("       lecture_title, ");
		sql.append("       teacher_nickname, ");
		sql.append("       price, ");
		sql.append("       opendate, ");
		sql.append("       teacher_intro, ");
		sql.append("       lecture_intro, ");
		sql.append("       rating ");
		sql.append("  from lecture ");
		sql.append(" where type = 'on' ");
		switch(selectType) {
		case"late": //최신순
			sql.append("order by lecture.opendate desc ");
			break;
		case"pop":	//인기순 (인기순은 조회수 필드만들어야되서 보류)
			sql.append("order by lecture.rating desc ");
			break;
		case"star": //별점순
			sql.append("order by rating desc ");
			break;
			
		default:
			break;
		}

		return jt.query(sql.toString(), 
									new BeanPropertyRowMapper<LectureVO>(LectureVO.class));
	}
	
	@Override
	public List<LectureVO> lectureList(String lectureType, String selectType) {
		StringBuilder sql = new StringBuilder();
		

		sql.append("select kinds, ");
		sql.append("       lecture_title, ");
		sql.append("       teacher_nickname, ");
		sql.append("       price, ");
		sql.append("       opendate, ");
		sql.append("       teacher_intro, ");
		sql.append("       lecture_intro, ");
		sql.append("       rating ");
		sql.append("  from lecture ");
		sql.append(" where kinds = ? ");
		sql.append(" and type = 'on' ");
		switch(selectType) {
		case"late": //최신순
			sql.append("order by lecture.opendate desc ");
			break;
		case"pop":	//인기순 (인기순은 조회수 필드만들어야되서 보류)
			sql.append("order by lecture.rating desc ");
			break;
		case"star": //별점순
			sql.append("order by rating desc ");
			break;
			
		default:
			break;
		}

		return jt.query(sql.toString(), 
									new BeanPropertyRowMapper<LectureVO>(LectureVO.class),
									lectureType);
	}






	

}
