package com.kh.portfolio.student.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.kh.portfolio.lecture.vo.LectureVO;
import com.kh.portfolio.member.vo.MemberVO;
import com.kh.portfolio.student.vo.BasketVO;
import com.kh.portfolio.student.vo.OrdersVO;
import com.kh.portfolio.video.vo.ProgressVO;

@Repository
public class StudentDAOImpl implements StudentDAO {

	private static final Logger logger = LoggerFactory.getLogger(StudentDAOImpl.class);

	private final JdbcTemplate jt;

	public StudentDAOImpl(JdbcTemplate jt) {
		this.jt = jt;
	}

	/**
	 * 수강생 회원 등록 기능
	 */
	@Override
	public int joinStudent(MemberVO memberVO) {
		logger.info(memberVO + "의 입력 정보로 수강생 회원 등록 실행");
		int result = 0;
		StringBuilder sql = new StringBuilder();
		sql.append("insert into member(member_id,pw,nickname,name,tel,region,type) ");
		sql.append("values (?,?,?,?,?,?,'수강생')");
		result = jt.update(sql.toString(), memberVO.getMember_id(), memberVO.getPw(), memberVO.getNickname(),
				memberVO.getName(), memberVO.getTel(), memberVO.getRegion());
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
	 * 구매한 강의 목록(가장 최근에 학습한 강의순으로 정렬)
	 * 
	 * @return
	 */
	@Override
	public List<OrdersVO> onlineList(String member_id) {
		StringBuilder sql = new StringBuilder();
		sql.append("select t1.lecture_title, t1.progressbar, t2.thumbnail ");
		sql.append("from orders t1, lecture t2 ");
		sql.append("where t1.lecture_title = t2.lecture_title ");
		sql.append("and t1.member_id = ? ");
		sql.append("and t1.status = '구매완료' ");
		sql.append("and t2.type = 'on' ");
		sql.append("order by t1.studydate desc nulls last ");
		
		
		List<OrdersVO> list = jt.query(sql.toString(), new RowMapper<OrdersVO>() {

			@Override
			public OrdersVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				OrdersVO ordersVO = new OrdersVO();
				ordersVO.setLecture_title(rs.getString("lecture_title"));
				ordersVO.setProgressbar(rs.getInt("progressbar"));
				
				LectureVO lectureVO = new LectureVO();
				lectureVO.setThumbnail(rs.getString("thumbnail"));
				
				ordersVO.setLectureVO(lectureVO);
				
				return ordersVO;
			}
			
		}, member_id);
		
		return list;
	}

	/**
	 * studydate 업데이트
	 * 
	 * @param video_id
	 * @param member_id
	 * @return
	 */
	public int updateStudy(long video_id, String member_id) {
		StringBuilder sql = new StringBuilder();
		sql.append("UPDATE orders ");
		sql.append("SET studydate = sysdate ");
		sql.append("WHERE lecture_title = (select lecture_title ");
		sql.append("from video ");
		sql.append("where video_id= ? ) ");
		sql.append("and member_id = ? ");
		return jt.update(sql.toString(), video_id, member_id);
	}
	
	
	/**
	 * 구매 여부
	 * @param member_id
	 * @param lecture_title
	 * @return
	 */
	@Override
	public boolean existOrder(String member_id, String lecture_title) {
		
		boolean result = false;
		
		StringBuilder sql = new StringBuilder();
		sql.append("select count(*) ");
		sql.append("from orders ");
		sql.append("where member_id = ? ");
		sql.append("and lecture_title = ? ");
		sql.append("and status = '구매완료' ");
		
		Integer cnt = jt.queryForObject(sql.toString(), Integer.class, member_id, lecture_title);
		result = (cnt == 1 ) ? true : false;

		return result;
	}
	
	

	/**
	 * 찜 여부
	 * 
	 * @param member_id
	 * @param lecture_title
	 * @return
	 */
	@Override
	public boolean existWish(String member_id, String lecture_title) {

		boolean result = false;
		
		StringBuilder sql = new StringBuilder();
		sql.append("select count(*) ");
		sql.append("from wish ");
		sql.append("where member_id = ? ");
		sql.append("and lecture_title = ? ");
		
		Integer cnt = jt.queryForObject(sql.toString(), Integer.class, member_id, lecture_title);
		result = (cnt == 1 ) ? true : false;

		return result;
	}
	
	/**
	 * 찜 목록
	 * @param member_id
	 * @return
	 */
	@Override
	public List<LectureVO> wishList(String member_id) {
		StringBuilder sql = new StringBuilder();
		sql.append("select t2.lecture_title, t2.teacher_nickname, t2.thumbnail, ");
		sql.append("t2.price, t2.lecture_intro, t2.rating, t2.type, t1.udate  ");
		sql.append("from wish t1, lecture t2 ");
		sql.append("where t1.lecture_title = t2.lecture_title ");
		sql.append("and t1.member_id = ? ");
		sql.append("order by t1.udate desc");
		
		return jt.query(sql.toString(), new BeanPropertyRowMapper<>(LectureVO.class), member_id);

	}
	

	@Override
	public int deleteWish(String lecture_title, String member_id) {
		StringBuilder sql = new StringBuilder();
		sql.append("DELETE FROM wish ");
		sql.append("WHERE  lecture_title = ? ");
		sql.append("and member_id = ? ");
		return jt.update(sql.toString(), lecture_title, member_id );
	}
	
	

	@Override
	public int insertWish(String lecture_title, String member_id) {
		StringBuilder sql = new StringBuilder();
		sql.append("INSERT INTO wish (lecture_title, member_id, udate)  ");
		sql.append("VALUES (?,?,sysdate) ");
		return jt.update(sql.toString(), lecture_title, member_id);
	}
	
	
	@Override
	public int updateRecentVideo(long video_id, String member_id) {
		int result = 0;
		StringBuilder sql = new StringBuilder();
		sql.append("UPDATE progress  ");
		sql.append("SET studydate = sysdate ");
		sql.append("WHERE video_id= ? ");
		sql.append("and member_id= ? ");
		result =  jt.update(sql.toString(), video_id, member_id );
		
		if(result==1) {
			updateStudy(video_id, member_id);
		}
		
		return result;
	}
	
	
	/**
	 * 수강진행 여부
	 * @return
	 */
	@Override
	public boolean existProgress(String lecture_title, String member_id) {
		boolean result = false;
		
		StringBuilder sql = new StringBuilder();
		sql.append("select count(*)  ");
		sql.append("from progress ");
		sql.append("where lecture_title = ? ");
		sql.append("and member_id = ? ");
		sql.append("and progress = 1 ");
		
		Integer cnt = jt.queryForObject(sql.toString(), Integer.class, lecture_title, member_id);
		result = (cnt > 0 ) ? true : false;

		return result;
	}
	
	
	
	
	/**
	 * 강의 이어서 수강
	 * @return
	 */
	@Override
	public ProgressVO getRecentVideo(String member_id, String lecture_title) {
		StringBuilder sql = new StringBuilder();
		sql.append("select video_id , member_id, lecture_title, progress, studydate  ");
		sql.append("from progress ");
		sql.append("where member_id = ? ");
		sql.append("and lecture_title = ? ");
		sql.append("group by studydate, member_id, lecture_title, video_id, progress ");
		sql.append("having max(studydate) = (select max(studydate) ");
		sql.append("from progress ");
		sql.append("where member_id = ? ");
		sql.append("and lecture_title = ? ) ");
		return jt.queryForObject(sql.toString(), new BeanPropertyRowMapper<>(ProgressVO.class), member_id, lecture_title, member_id, lecture_title);
	}
	
	/**
	 * 구매 이력
	 * @param member_id
	 * @return
	 */
	@Override
	public List<OrdersVO> ordersList(String member_id) {
		StringBuilder sql = new StringBuilder();
		sql.append("select t1.order_id, t1.status, t1.udate, t1.lecture_title, t1.studydate, t2.price, t2.thumbnail ");
		sql.append("from orders t1, lecture t2 ");
		sql.append("where t1.lecture_title = t2.lecture_title ");
		sql.append("and t1.member_id = ? ");
		sql.append("order by t1.udate desc ");
		List<OrdersVO> list = jt.query(sql.toString(), new RowMapper<OrdersVO>() {

			@Override
			public OrdersVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				OrdersVO ordersVO = new OrdersVO();
				ordersVO.setOrder_id(rs.getLong("order_id"));
				ordersVO.setStatus(rs.getString("status"));
				ordersVO.setUdate(rs.getTimestamp("udate"));
				ordersVO.setLecture_title(rs.getString("lecture_title"));
				ordersVO.setStudydate(rs.getTimestamp("studydate"));
				
				LectureVO lectureVO = new LectureVO();
				lectureVO.setPrice(rs.getLong("price"));
				lectureVO.setThumbnail(rs.getString("thumbnail"));
				ordersVO.setLectureVO(lectureVO);
				
				return ordersVO;
			}
			
		}, member_id);
		
		return list;
	}
	

	
	@Override
	public OrdersVO oneOrder(long order_id) {
		StringBuilder sql = new StringBuilder();
		sql.append("select * ");
		sql.append("from orders ");
		sql.append("where order_id = ? ");
		return jt.queryForObject(sql.toString(), new BeanPropertyRowMapper<>(OrdersVO.class), order_id);
	}
	
	
	@Override
	public int addBasket(String member_id, String lecture_title) {
		StringBuilder sql = new StringBuilder();
		sql.append("INSERT INTO basket (member_id,lecture_title,cdate)  ");
		sql.append("VALUES (?,?,sysdate) ");
		return jt.update(sql.toString(), member_id, lecture_title);
	}
	
	
	@Override
	public int removeBasket(String member_id, String lecture_title) {
		StringBuilder sql = new StringBuilder();
		sql.append("DELETE FROM basket  ");
		sql.append("WHERE member_id = ? ");
		sql.append("AND lecture_title = ? ");
		return jt.update(sql.toString(), member_id, lecture_title);

	}
	
	@Override
	public List<LectureVO> basketList(String member_id) {
		StringBuilder sql = new StringBuilder();
		sql.append("select t1.cdate as \"basketVO.cdate\", ");
		sql.append("t2.lecture_title, t2.kinds, t2.teacher_nickname, t2.price, t2.type, t2.lecture_intro  ");
		sql.append("from basket t1, lecture t2 ");
		sql.append("where t1.lecture_title = t2.lecture_title ");
		sql.append("and t1.member_id = ? ");
		sql.append("order by t1.cdate desc ");
		
		
		List<LectureVO> list = jt.query(sql.toString(), new RowMapper<LectureVO>() {

			@Override
			public LectureVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				LectureVO lectureVO = new LectureVO();
				lectureVO.setLecture_title(rs.getString("lecture_title"));
				lectureVO.setKinds(rs.getString("kinds"));
				lectureVO.setTeacher_nickname(rs.getString("teacher_nickname"));
				lectureVO.setPrice(rs.getLong("price"));
				lectureVO.setType(rs.getString("type"));
				lectureVO.setLecture_intro(rs.getString("lecture_intro"));
				
				BasketVO basketVO = new BasketVO();
				
				basketVO.setCdate(rs.getTimestamp("basketVO.cdate"));
				
				lectureVO.setBasketVO(basketVO);
				
				
				
				return lectureVO;
			}
			
		}, member_id);
		
		return list;
	
	}
	
	
	@Override
	public boolean existBasket(String lecture_title, String member_id) {
		
		boolean result = false;
		
		StringBuilder sql = new StringBuilder();
		sql.append("select count(*)  ");
		sql.append("from basket ");
		sql.append("where lecture_title = ? ");
		sql.append("and member_id = ? ");
		Integer cnt =  jt.queryForObject(sql.toString(), Integer.class, lecture_title, member_id );
		result = (cnt > 0 ) ? true : false;

		return result;
	}
	
	
//	@Override
//	public List<ProgressVO> myProgressList(String lecture_title, String member_id) {
//		StringBuilder sql = new StringBuilder();
//		sql.append("select distinct(t1.lecture_title), ");
//		sql.append("t2.title as \"videoVO.title\" , ");
//		sql.append("t2.cdate as \"videoVO.cdate\", ");
//		sql.append("t1.progress, ");
//		sql.append("t2.video_id as \"videoVO.video_id\" ");
//		sql.append("from progress t1, video t2 ");
//		sql.append("where t1.lecture_title = t2.lecture_title ");
//		sql.append("and t1.lecture_title = ? ");
//		sql.append("and t1.member_id = ? ");
//		sql.append("order by t2.cdate ");
//		List<ProgressVO> list =  jt.query(sql.toString(), new RowMapper<ProgressVO>() {
//
//			@Override
//			public ProgressVO mapRow(ResultSet rs, int rowNum) throws SQLException {
//				ProgressVO progressVO = new ProgressVO();
//				progressVO.setProgress(rs.getInt("progress"));
//				progressVO.setLecture_title(rs.getString("lecture_title"));
//				
//				VideoVO videoVO = new VideoVO();
//				videoVO.setVideo_id(rs.getLong("videoVO.video_id"));
//				videoVO.setTitle(rs.getString("videoVO.title"));
//				videoVO.setCdate(rs.getTimestamp("videoVO.cdate"));
//				
//				
//				progressVO.setVideoVO(videoVO);
//				
//				
//				return progressVO;
//			}
//			
//		},lecture_title, member_id );
//		
//		return list;
//	}
	
	//2021.3.19
	
	@Override
	public List<ProgressVO> myProgress(String lecture_title, String member_id) {
		StringBuilder sql = new StringBuilder();
		sql.append("select * from progress  ");
		sql.append("where lecture_title = ? ");
		sql.append("and member_id = ? ");
		
		return jt.query(sql.toString(), new BeanPropertyRowMapper<>(ProgressVO.class), lecture_title, member_id);
	}
	
	
	@Override
	public int progressCnt(String lecture_title, String member_id) {
		StringBuilder sql = new StringBuilder();
		sql.append("select count(*)  ");
		sql.append("from progress ");
		sql.append("where lecture_title = ? ");
		sql.append("and member_id = ? ");
		sql.append("and progress = 1 ");
		
		return jt.queryForObject(sql.toString(), Integer.class, lecture_title, member_id);
		
	}
	
	
	@Override
	public int refund(long order_id) {
		StringBuilder sql = new StringBuilder();
		sql.append("UPDATE orders  ");
		sql.append("SET status = '구매취소', ");
		sql.append("    udate = sysdate, ");
		sql.append("    order_id = orders_id_seq.nextval ");
		sql.append("WHERE order_id = ? ");
		return jt.update(sql.toString(), order_id);
	
	}
	
	
	/**
	 * 회원 아이디로 주문 목록 조회(오프라인 전용)
	 * @param member_id
	 * @return
	 */
	@Override
	public List<OrdersVO> offlineLectureList(String member_id) {
		
		StringBuilder sql = new StringBuilder();
		sql.append(" select order_id,status,lecture.lecture_title,price,location,startdate,enddate,thumbnail ");
		sql.append(" 	 from orders,lecture ");
		sql.append("  where orders.lecture_title = lecture.lecture_title ");
		sql.append("    and type = 'off' ");
		sql.append("    and orders.member_id = ? ");
		sql.append("    and status = '구매완료' ");
		
		return jt.query(sql.toString(),new RowMapper<OrdersVO>() {

			@Override
			public OrdersVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				OrdersVO ordersVO = new OrdersVO();
				ordersVO.setOrder_id(rs.getLong("order_id"));
				ordersVO.setStatus(rs.getString("status"));
				ordersVO.setLecture_title(rs.getString("lecture_title"));
				
				LectureVO lectureVO = new LectureVO();
				lectureVO.setPrice(rs.getLong("price"));
				lectureVO.setLocation(rs.getString("location"));
				lectureVO.setStartdate(rs.getDate("startdate"));
				lectureVO.setEnddate(rs.getDate("enddate"));
				lectureVO.setThumbnail(rs.getString("thumbnail"));
				ordersVO.setLectureVO(lectureVO);
				
				return ordersVO;
			}	
		},member_id);
	}
	

}
