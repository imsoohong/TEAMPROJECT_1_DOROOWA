package com.kh.portfolio.lecture.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.kh.portfolio.lecture.vo.ReviewVO;
import com.kh.portfolio.member.vo.MemberVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
@RequiredArgsConstructor
public class ReviewDAOImpl implements ReviewDAO{
	
	private final JdbcTemplate jt;

	@Override
	public List<ReviewVO> reviewList(String lecture_title, int startRec, int endRec) {
		
		StringBuilder sql = new StringBuilder();
		sql.append(" select * ");
		sql.append(" from (select row_number() over (order by t1.cdate desc) as num, ");
		sql.append("							t1.review_id, t1.rcontent, t2.nickname, t1.cdate, t1.rating, t2.member_id ");
		sql.append("         from review t1, member t2 ");
		sql.append("        where t1.lecture_title = ?  ");
		sql.append("        and t1.member_id = t2.member_id ) ");
		sql.append(" where num between ? and ? ");
		
		return jt.query(sql.toString(), new RowMapper<ReviewVO>() {

			@Override
			public ReviewVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				ReviewVO reviewVO = new ReviewVO();
				reviewVO.setReview_id(rs.getLong("review_id"));
				reviewVO.setRcontent(rs.getString("rcontent"));
				reviewVO.setCdate(rs.getTimestamp("cdate"));
				reviewVO.setRating(rs.getInt("rating"));
				
				MemberVO memberVO = new MemberVO();
				memberVO.setNickname(rs.getString("nickname"));
				memberVO.setMember_id(rs.getString("member_id"));
				
				reviewVO.setMemberVO(memberVO);
				return reviewVO;
			}
			
		},lecture_title,startRec,endRec);
		
	}
	
	@Override
	public int ratingCnt(String lecture_title, int rating) {
		StringBuilder sql = new StringBuilder();
		sql.append(" select count(*) ");
		sql.append(" from review ");
		sql.append(" where lecture_title = ? ");
		sql.append(" and rating = ? ");
		return jt.queryForObject(sql.toString(), Integer.class, lecture_title, rating );
	}

}
