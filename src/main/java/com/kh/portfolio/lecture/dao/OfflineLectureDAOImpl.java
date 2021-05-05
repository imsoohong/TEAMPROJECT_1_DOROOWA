package com.kh.portfolio.lecture.dao;

import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.portfolio.lecture.vo.LectureVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Repository
@Slf4j
@RequiredArgsConstructor
public class OfflineLectureDAOImpl implements OfflineLectureDAO {
	
	private final JdbcTemplate jt;
	
	/**
	 * 전체 강의 목록 조회
	 * @return
	 */
	@Override
	public List<LectureVO> locationListAll() {
		StringBuilder sql = new StringBuilder();
		
		sql.append(" select * ");
		sql.append("   from lecture ");
		sql.append("  where type = 'off' ");	

		return jt.query(sql.toString(),new BeanPropertyRowMapper<>(LectureVO.class));
	}
	
	/**
	 * 지역 선택 강의 목록 가져오기(지역 선택시)
	 * @param location
	 * @return
	 */
	@Override
	public List<LectureVO> locationList(String location) {
		StringBuilder sql = new StringBuilder();
		
		location = location+"%";
		
		sql.append(" select * ");
		sql.append("   from lecture ");
		sql.append("  where type = 'off' ");	
		sql.append("    and location like ? ");	
		
		return jt.query(sql.toString(), new BeanPropertyRowMapper<>(LectureVO.class),location);
	}
	/**
	 * 지역 선택 강의 목록 가져오기(기타 선택시)
	 * 지역 추가시 해당 지역을 not in 쿼리에 반영해야함
	 * @param location
	 * @return
	 */
	@Override
	public List<LectureVO> locationListEtc(String location) {
		StringBuilder sql = new StringBuilder();
		
		sql.append(" select * ");
		sql.append(" 	from lecture ");
		sql.append("  where type = 'off' "); 
		sql.append("    and location not in (select location ");
		sql.append("                           from lecture ");
		sql.append("                          where location like '울산%') ");
		sql.append("                            and location not in (select location ");
		sql.append("                           from lecture ");
		sql.append("                          where location like '부산%') ");
		sql.append("                            and location not in (select location ");
		sql.append("                           from lecture ");
		sql.append("                          where location like '서울%') ");
		
		return jt.query(sql.toString(), new BeanPropertyRowMapper<>(LectureVO.class));
	}
	/**
	 * 강의 조회
	 * @param lecture_title
	 * @return
	 */
	@Override
	public LectureVO view(String lecture_title) {
		StringBuilder sql = new StringBuilder();
		
		sql.append(" select * ");
		sql.append("   from lecture ");
		sql.append("  where lecture_title = ? ");
		sql.append("    and type = 'off' ");
		
		LectureVO lectureVO = jt.queryForObject(sql.toString(),
				new BeanPropertyRowMapper<LectureVO>(LectureVO.class),
				lecture_title);
		
		return lectureVO;
	}

	/**
	 * 정렬 기능 선택 후 높은 순으로 강의 재조회
	 * @return
	 */
	@Override
	public List<LectureVO> ratingList(String location, String option) {
		StringBuilder sql = new StringBuilder();
		
		location = location+"%";
		
		
		sql.append(" select * "); 
		sql.append(" 	 from lecture ");
		sql.append("  where type = 'off' ");
		sql.append("    and location like ? ");
		sql.append("  order by ");
		sql.append(option);
//		sql.append(" desc");
		
		return jt.query(sql.toString(), new BeanPropertyRowMapper<>(LectureVO.class),location);
	}
	
	/**
	 * 정렬 기능 선택 후 높은 순으로 강의 재조회(지역 선택 기타로 선택시 , 지역 추가시 쿼리 꼭 수정해야함)
	 * @return
	 */
	@Override
	public List<LectureVO> ratingListEtc(String location, String option) {
		StringBuilder sql = new StringBuilder();
		
		location = location+"%";	
		sql.append(" select * ");
	  sql.append("   from lecture ");
	  sql.append("  where type = 'off' ");
	  sql.append("    and location not in (select location "); 
	  sql.append("                           from lecture ");
	  sql.append("                          where location like '울산%') ");
	  sql.append("    and location not in (select location ");
	  sql.append("                           from lecture ");
	  sql.append("                          where location like '부산%') ");
	  sql.append("    and location not in (select location ");
	  sql.append("                           from lecture ");
	  sql.append("                          where location like '서울%') ");
	  sql.append("  order by ");
	  sql.append(option); 
//	  sql.append("  desc ");
	  
	  return jt.query(sql.toString(), new BeanPropertyRowMapper<>(LectureVO.class));
	}

	@Override
	public List<LectureVO> ratingListAll(String option) {
		
		String sql = " select * from lecture where type = 'off' order by "+option;
		
		return jt.query(sql.toString(), new BeanPropertyRowMapper<>(LectureVO.class));
	}

}
