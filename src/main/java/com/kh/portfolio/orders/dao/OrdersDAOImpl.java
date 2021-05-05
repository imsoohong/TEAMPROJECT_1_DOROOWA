package com.kh.portfolio.orders.dao;

import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.BatchPreparedStatementSetter;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.portfolio.orders.vo.CheckAmountVO;
import com.kh.portfolio.orders.vo.OrdersVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@RequiredArgsConstructor
@Slf4j
public class OrdersDAOImpl implements OrdersDAO {
	
	private final JdbcTemplate jt;

	/**
	 * 회원 아이디로 주문 목록 조회
	 * @param member_id
	 * @return
	 */
	@Override
	public List<OrdersVO> list(String member_id) {
		
		StringBuilder sql = new StringBuilder();
		sql.append(" select * ");
		sql.append("   from orders ");
		sql.append("  where member_id = ? ");
		sql.append("  order by orderdate desc ");
		
		return jt.query(sql.toString(),new BeanPropertyRowMapper<OrdersVO>(OrdersVO.class),member_id);
	}
	
	/**
	 * 강의 주문
	 * @param orders
	 * @return
	 */
	@Override
	public void orders(List<OrdersVO> orders) {
		StringBuilder sql= new StringBuilder();
		sql.append(" insert into orders( ");
		sql.append(" 		order_id, ");
		sql.append(" 		udate, ");
		sql.append(" 		orderdate, ");
		sql.append(" 		status, ");
		sql.append(" 		member_id, "); 
		sql.append(" 		lecture_title ");
		sql.append(" 		) ");
		sql.append(" values( ");
		sql.append(" 		ORDERS_ID_SEQ.nextval, ");
		sql.append(" 		systimestamp, ");
		sql.append(" 		systimestamp, ");
		sql.append(" 		'구매완료', ");
		sql.append(" 		?, ");
		sql.append(" 		? ");
		sql.append(" 		) ");
		
		jt.batchUpdate(sql.toString(), new BatchPreparedStatementSetter() {
			
			@Override
			public void setValues(PreparedStatement ps, int i) throws SQLException {
				ps.setString(1, orders.get(i).getMember_id());
				ps.setString(2, orders.get(i).getLecture_title());
			}
			
			@Override
			public int getBatchSize() {
				return orders.size();
			}
		});
		
	}

	/**
	 * 강의 예약시 수강 인원 카운트 증가 
	 * @param lecture_title
	 */
	@Override
	public void updateCount(String lecture_title) {
		String sql = "update lecture set count = count+1 where lecture_title = ? ";
		jt.update(sql.toString(), lecture_title);	
	}

	/**
	 * 강의 제한 인원 체크 및 온라인, 오프라인 강의 구분(수강인원과 제한인원을 조회)
	 * @param lecture_title
	 * @return
	 */
	@Override
	public CheckAmountVO checkAmount(String lecture_title) {
		String sql = "select count,amount,type from lecture where lecture_title = ? ";
		return jt.queryForObject(sql.toString(), new BeanPropertyRowMapper<CheckAmountVO>(CheckAmountVO.class), lecture_title);		
	}

	/**
	 * 강의 구매 후 장바구니에서 해당 강의 삭제
	 * @param lecture_title
	 * @param member_id
	 */
	@Override
	public void cleanBasket(String lecture_title, String member_id) {
		String sql = "DELETE from basket where lecture_title = ? and member_id = ? ";
		jt.update(sql.toString(), lecture_title, member_id);
	}
	


	/**
	 * 강의 구매 후 progress 추가
	 * @param lecture_title
	 * @param member_id
	 * @param video_id
	 */
	@Override
	public void addProgress(String lecture_title, String member_id, long video_id) {
		StringBuilder sql= new StringBuilder();
		sql.append("INSERT INTO progress (lecture_title,member_id,video_id,progress)  ");
		sql.append("VALUES (?,?,?,0) ");
		
		jt.update(sql.toString(), lecture_title, member_id, video_id);

		
	}




}
