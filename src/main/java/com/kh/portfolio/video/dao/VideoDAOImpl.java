package com.kh.portfolio.video.dao;

import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.portfolio.video.vo.VideoVO;

import lombok.RequiredArgsConstructor;

@Repository
@RequiredArgsConstructor
public class VideoDAOImpl implements VideoDAO {


	private final JdbcTemplate jt;
	
	
	/**
	 * 강의영상 리스트
	 * @param lecture_title
	 * @return
	 */
	@Override
	public List<VideoVO> videoList(String lecture_title) {
		StringBuilder sql = new StringBuilder();
		sql.append("select video_id, title, lecture_title, secret ");
		sql.append("from video ");
		sql.append("where lecture_title = ? ");
		sql.append("order by video_id ");
		
		List<VideoVO> list = jt.query(sql.toString(), new BeanPropertyRowMapper<>(VideoVO.class), lecture_title);
		return list;
	}
	
	
	
	/**
	 * 강의영상 보기
	 * @param video_id
	 * @return
	 */
	@Override
	public VideoVO view(long video_id) {
		StringBuilder sql = new StringBuilder();
		sql.append("select video_id, title, content, cdate, udate, lecture_title, filename, secret, chapter_id  ");
		sql.append("from video ");
		sql.append("where video_id = ? ");
		
		
		return jt.queryForObject(sql.toString(), new BeanPropertyRowMapper<>(VideoVO.class), video_id);
	}

	
	
	/**
	 * 강의영상 진행도 업데이트
	 * @param lecture_title
	 * @param video_id
	 * @param member_id
	 * @return
	 */
	@Override
	public int updateProgress(String lecture_title, long video_id, String member_id) {
		
		StringBuilder sql = new StringBuilder();
		sql.append("UPDATE progress ");
		sql.append("SET progress = 1 ");
		sql.append("WHERE video_id = ? ");
		sql.append("AND member_id = ? ");
		
		int result = jt.update(sql.toString(), video_id, member_id);
		
		if(result==1) {
			updateProgressAll(lecture_title, member_id);
		}
		
		
		
		return result;
	}

	
	/**
	 * progressbar 업데이트
	 * @param lecture_title
	 * @param member_id
	 */
	private void updateProgressAll(String lecture_title, String member_id) {
		StringBuilder sql = new StringBuilder();
		sql.append("UPDATE orders ");
		sql.append("SET progressbar = (select trunc((sum(progress)/count(*))*100) ");
		sql.append("from progress ");
		sql.append("where lecture_title = ? ");
		sql.append("and member_id = ? ) ");
		sql.append("where lecture_title = ? ");
		sql.append("and member_id = ? ");
		
		jt.update(sql.toString(), lecture_title, member_id, lecture_title, member_id);
		
		
		
	}
	
	
	@Override
	public VideoVO firstVideo(String lecture_title) {
		StringBuilder sql = new StringBuilder();
		sql.append("select *  ");
		sql.append("from (select * from video order by video_id) ");
		sql.append("where lecture_title= ? ");
		sql.append("and rownum = 1 ");
		
		return jt.queryForObject(sql.toString(), new BeanPropertyRowMapper<>(VideoVO.class), lecture_title);
		
		
	}
	
	
	
	
	
//2021-3-19
	
	
	@Override
	public VideoVO lastVideo(String lecture_title) {
		StringBuilder sql = new StringBuilder();
		sql.append("select video_id  ");
		sql.append("from (select * from video order by video_id desc) ");
		sql.append("where lecture_title= ? ");
		sql.append("and rownum = 1 ");
		return jt.queryForObject(sql.toString(), new BeanPropertyRowMapper<>(VideoVO.class), lecture_title);

	}
	
	
	@Override
	public boolean existVideo(long video_id, String lecture_title) {
		boolean result = false;
		StringBuilder sql = new StringBuilder();
		sql.append("select count(*)  ");
		sql.append("from video ");
		sql.append("where video_id = ? ");
		sql.append("and lecture_title = ? ");
		
		Integer cnt = jt.queryForObject(sql.toString(), Integer.class, video_id, lecture_title);
		result = (cnt > 0) ? true : false;
		
		return result;
	}
	
	
	
	
	
	
	
	

}
