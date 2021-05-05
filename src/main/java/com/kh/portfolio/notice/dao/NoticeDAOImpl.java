package com.kh.portfolio.notice.dao;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Repository;

import com.kh.portfolio.notice.vo.NoticeCategoryVO;
import com.kh.portfolio.notice.vo.NoticeVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
@Repository
@RequiredArgsConstructor
@Slf4j
public class NoticeDAOImpl implements NoticeDAO {
	
	private final JdbcTemplate jt;
	
	//공지사항 카테고리 읽어오기
	@Override
	public List<NoticeCategoryVO> getCategory() {
		StringBuilder sql = new StringBuilder();
		sql.append("select cid, cname  ");
		sql.append("  from notice_Category ");
		sql.append(" where use_yn = 'y' ");		
		
		//자동 매핑
		List<NoticeCategoryVO> list = jt.query(
				sql.toString(), 
				new BeanPropertyRowMapper<NoticeCategoryVO>(NoticeCategoryVO.class)
		);
		
		
		return list;
	}
	//공지사항 리스트 출력하기
	@Override
	public List<NoticeVO> noticeList(int startRec, int endRec) {
		StringBuilder sql = new StringBuilder();
		
		sql.append("select t3.nnum, ");
		sql.append("       t3.cid   as \"noticeCategoryVO.cid\",   ");
		sql.append("       t3.ntitle,  ");
		sql.append("       t3.nid,  ");
		sql.append("       t3.nnickname,  ");
		sql.append("       t3.ncdate,  ");
		sql.append("       t3.nhit ");
		sql.append("from( ");
		sql.append("select row_number() over(order by t1.ncdate desc) as num, ");
		sql.append("       t1.nnum,  ");
		sql.append("       t2.cid,  ");
		sql.append("       t1.ntitle,  ");
		sql.append("       t1.nid,  ");
		sql.append("       t1.nnickname,  ");
		sql.append("       t1.ncdate,  ");
		sql.append("       t1.nhit ");
		sql.append("  from notice t1, notice_category t2  ");
		sql.append(" where t1.ncategory = t2.cid and ");
		sql.append("       t2.cid = 1010 ) t3 ");
		sql.append(" where t3.num between ? and ? ");
		
		List<NoticeVO> list = jt.query(sql.toString(),
				new RowMapper<NoticeVO>() {
			@Override
			public NoticeVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				NoticeVO noticeVO = new NoticeVO();
				noticeVO.setNnum(rs.getLong("nnum"));
				
				NoticeCategoryVO noticeCategoryVO = new NoticeCategoryVO();
				noticeCategoryVO.setCid(rs.getInt("noticeCategoryVO.cid"));
				
				noticeVO.setNtitle(rs.getString("ntitle"));
				noticeVO.setNid(rs.getString("nid"));
				noticeVO.setNnickname(rs.getString("nnickname"));
				noticeVO.setNcdate(rs.getTimestamp("ncdate"));
				noticeVO.setNhit(rs.getInt("nhit"));
				
				return noticeVO;
			}
		}, 
				startRec,endRec);
		return list;
	}
	//공지사항 검색도 출력하게 하기
	@Override
	public List<NoticeVO> noticeList(int startRec, int endRec, String searchType, String keyWord) {
		StringBuilder sql = new StringBuilder();
		
		sql.append("select t3.nnum, ");
		sql.append("       t3.cid   as \"noticeCategoryVO.cid\",   ");
		sql.append("       t3.ntitle,  ");
		sql.append("       t3.nid,  ");
		sql.append("       t3.nnickname,  ");
		sql.append("       t3.ncdate,  ");
		sql.append("       t3.nhit,  ");
		sql.append("       t3.ncontent  ");
		sql.append("from( ");
		sql.append("select row_number() over(order by t1.nnum asc) as num, ");
		sql.append("       t1.nnum,  ");
		sql.append("       t2.cid,  ");
		sql.append("       t1.ntitle,  ");
		sql.append("       t1.nid,  ");
		sql.append("       t1.nnickname,  ");
		sql.append("       t1.ncdate,  ");
		sql.append("       t1.nhit,  ");
		sql.append("       t1.ncontent  ");
		sql.append("  from notice t1, notice_category t2  ");
		sql.append(" where t1.ncategory = t2.cid and ");
		sql.append("       t2.cid = 1010  ");
		switch (searchType) {
		case "TC": //제목+내용
			sql.append("and ( t1.ntitle  like '%" + keyWord + "%' ");
			sql.append("   or t1.ncontent like '%" + keyWord + "%' ) ");
			break;
		case "T":	//제목
			sql.append("and t1.ntitle  like '%" + keyWord + "%' ");
			break;
		case "C":	//내용
			sql.append("and t1.ncontent  like '%" + keyWord + "%' ");
			break;
		case "N": //별칭
			sql.append("and t1.nnickname  like '%" + keyWord + "%'" );
			break;
		case "I":  //아이디
			sql.append("and t1.nid  like '%" + keyWord + "%'" );
			break;
		case "A":  //전체			
			sql.append("and ( t1.ntitle  like '%" + keyWord + "%' ");
			sql.append("   or t1.ncontent like '%" + keyWord + "%' ");
			sql.append("   or t1.nnickname like '%" + keyWord + "%' ");
			sql.append("   or t1.nid like '%" + keyWord + "%' )");
			break;
		default:
			break;
		}	
		sql.append(") t3 ");
		sql.append(" where t3.num between ? and ? ");


		
		
		List<NoticeVO> list = jt.query(sql.toString(),
				new RowMapper<NoticeVO>() {
			@Override
			public NoticeVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				NoticeVO noticeVO = new NoticeVO();
				noticeVO.setNnum(rs.getLong("nnum"));
				
				NoticeCategoryVO noticeCategoryVO = new NoticeCategoryVO();
				noticeCategoryVO.setCid(rs.getInt("noticeCategoryVO.cid"));
				
				noticeVO.setNtitle(rs.getString("ntitle"));
				noticeVO.setNid(rs.getString("nid"));
				noticeVO.setNnickname(rs.getString("nnickname"));
				noticeVO.setNcdate(rs.getTimestamp("ncdate"));
				noticeVO.setNhit(rs.getInt("nhit"));
				
				return noticeVO;
			}
		}, 
				startRec,endRec);
		return list;
	}
	//이벤트 목록
	@Override
	public List<NoticeVO> eventList(int startRec, int endRec) {
StringBuilder sql = new StringBuilder();
		
		sql.append("select t3.nnum, ");
		sql.append("       t3.cid   as \"noticeCategoryVO.cid\",   ");
		sql.append("       t3.ntitle,  ");
		sql.append("       t3.nid,  ");
		sql.append("       t3.nnickname,  ");
		sql.append("       t3.ncdate,  ");
		sql.append("       t3.nhit ");
		sql.append("from( ");
		sql.append("select row_number() over(order by t1.nnum asc) as num, ");
		sql.append("       t1.nnum,  ");
		sql.append("       t2.cid,  ");
		sql.append("       t1.ntitle,  ");
		sql.append("       t1.nid,  ");
		sql.append("       t1.nnickname,  ");
		sql.append("       t1.ncdate,  ");
		sql.append("       t1.nhit ");
		sql.append("  from notice t1, notice_category t2  ");
		sql.append(" where t1.ncategory = t2.cid and ");
		sql.append("       t2.cid = 1020 ) t3 ");
		sql.append(" where t3.num between ? and ? ");
		
		List<NoticeVO> list = jt.query(sql.toString(),
				new RowMapper<NoticeVO>() {
			@Override
			public NoticeVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				NoticeVO noticeVO = new NoticeVO();
				noticeVO.setNnum(rs.getLong("nnum"));
				
				NoticeCategoryVO noticeCategoryVO = new NoticeCategoryVO();
				noticeCategoryVO.setCid(rs.getInt("noticeCategoryVO.cid"));
				
				noticeVO.setNtitle(rs.getString("ntitle"));
				noticeVO.setNid(rs.getString("nid"));
				noticeVO.setNnickname(rs.getString("nnickname"));
				noticeVO.setNcdate(rs.getTimestamp("ncdate"));
				noticeVO.setNhit(rs.getInt("nhit"));
				
				return noticeVO;
			}
		}, 
				startRec,endRec);
		return list;
	}
	//이벤트 목록 (검색포함)
	@Override
	public List<NoticeVO> eventList(int startRec, int endRec, String searchType, String keyWord) {
StringBuilder sql = new StringBuilder();
		
		sql.append("select t3.nnum, ");
		sql.append("       t3.cid   as \"noticeCategoryVO.cid\",   ");
		sql.append("       t3.ntitle,  ");
		sql.append("       t3.nid,  ");
		sql.append("       t3.nnickname,  ");
		sql.append("       t3.ncdate,  ");
		sql.append("       t3.nhit,  ");
		sql.append("       t3.ncontent  ");
		sql.append("from( ");
		sql.append("select row_number() over(order by t1.nnum asc) as num, ");
		sql.append("       t1.nnum,  ");
		sql.append("       t2.cid,  ");
		sql.append("       t1.ntitle,  ");
		sql.append("       t1.nid,  ");
		sql.append("       t1.nnickname,  ");
		sql.append("       t1.ncdate,  ");
		sql.append("       t1.nhit,  ");
		sql.append("       t1.ncontent  ");
		sql.append("  from notice t1, notice_category t2  ");
		sql.append(" where t1.ncategory = t2.cid and ");
		sql.append("       t2.cid = 1020  ");
		switch (searchType) {
		case "TC": //제목+내용
			sql.append("and ( t1.ntitle  like '%" + keyWord + "%' ");
			sql.append("   or t1.ncontent like '%" + keyWord + "%' ) ");
			break;
		case "T":	//제목
			sql.append("and t1.ntitle  like '%" + keyWord + "%' ");
			break;
		case "C":	//내용
			sql.append("and t1.ncontent  like '%" + keyWord + "%' ");
			break;
		case "N": //별칭
			sql.append("and t1.nnickname  like '%" + keyWord + "%'" );
			break;
		case "I":  //아이디
			sql.append("and t1.nid  like '%" + keyWord + "%'" );
			break;
		case "A":  //전체			
			sql.append("and ( t1.ntitle  like '%" + keyWord + "%' ");
			sql.append("   or t1.ncontent like '%" + keyWord + "%' ");
			sql.append("   or t1.nnickname like '%" + keyWord + "%' ");
			sql.append("   or t1.nid like '%" + keyWord + "%' )");
			break;
		default:
			break;
		}	
		sql.append(") t3 ");
		sql.append(" where t3.num between ? and ? ");


		
		
		List<NoticeVO> list = jt.query(sql.toString(),
				new RowMapper<NoticeVO>() {
			@Override
			public NoticeVO mapRow(ResultSet rs, int rowNum) throws SQLException {
				NoticeVO noticeVO = new NoticeVO();
				noticeVO.setNnum(rs.getLong("nnum"));
				
				NoticeCategoryVO noticeCategoryVO = new NoticeCategoryVO();
				noticeCategoryVO.setCid(rs.getInt("noticeCategoryVO.cid"));
				
				noticeVO.setNtitle(rs.getString("ntitle"));
				noticeVO.setNid(rs.getString("nid"));
				noticeVO.setNnickname(rs.getString("nnickname"));
				noticeVO.setNcdate(rs.getTimestamp("ncdate"));
				noticeVO.setNhit(rs.getInt("nhit"));
				
				return noticeVO;
			}
		}, 
				startRec,endRec);
		return list;
	}
	
	
	@Override
	public NoticeVO view(long nnum) {
		StringBuilder sql = new StringBuilder();
		sql.append("select t1.nnum, ");
		sql.append("       t1.ntitle, ");
		sql.append("       t1.nid, ");
		sql.append("       t1.nnickname, ");
		sql.append("       t1.ncdate, ");
		sql.append("       t1.nudate, ");
		sql.append("       t1.nhit, ");
		sql.append("       t1.ncontent, ");
		sql.append("       t1.ncategory ");
		sql.append("  from notice t1,notice_category t2 ");
		sql.append(" where t1.ncategory = t2.cid and ");
		sql.append("       t1.nnum = ? ");
		
		return jt.queryForObject(sql.toString(), new BeanPropertyRowMapper<NoticeVO>(NoticeVO.class),nnum);
	}
	//게시물의 아이디 조회
	@Override
	public String selectNid(long nnum) {
		StringBuilder sql = new StringBuilder();
		
		sql.append("select t1.nid ");
		sql.append("  from notice t1, notice_category t2 ");
		sql.append(" where t1.ncategory = t2.cid");
		sql.append("   and t1.nnum = ? ");
		
		
		return jt.queryForObject(sql.toString(),String.class,nnum);
	}
	
	//공지사항 게시글 작성
	@Override
	public int write(NoticeVO noticeVO) {
		StringBuilder sql = new StringBuilder();
		int result = 0;
		sql.append("INSERT INTO notice ( ");
		sql.append("    nnum, ");
		sql.append("    ntitle, ");
		sql.append("    nid, ");
		sql.append("    nnickname, ");
		sql.append("    nhit, ");
		sql.append("    ncontent, ");
		sql.append("    ncategory ");
		sql.append(") VALUES ( ");
		sql.append("notice_nnum_seq.nextval, ");
		sql.append("?, ");
		sql.append("?, ");
		sql.append("?, ");
		sql.append("0, ");
		sql.append("?, ");
		sql.append("? ");
		sql.append(") ");
		
		result = jt.update(sql.toString(),
											 noticeVO.getNtitle(),
											 noticeVO.getNid(),
											 noticeVO.getNnickname(),
											 noticeVO.getNcontent(),
											 noticeVO.getNoticeCategoryVO().getCid()					 
				);
		
		return result;
	}
	//조회수 증가
	@Override
	public int updateNhit(long nnum) {
		StringBuilder sql = new StringBuilder();
		sql.append("update notice ");
		sql.append("   set nhit = nhit + 1 ");
		sql.append(" where nnum = ? ");
		
		return jt.update(sql.toString(), nnum);
	}
	//게시글 수정
	@Override
	public int modify(NoticeVO noticeVO) {
		StringBuilder sql = new StringBuilder();
		sql.append("update notice ");
		sql.append("   set ncategory = ?, ");
		sql.append("       ntitle = ?, ");
		sql.append("       ncontent = ?, ");
		sql.append("       nudate = systimestamp ");
		sql.append("where  nnum = ? ");
		
		int result = jt.update(sql.toString(),
								noticeVO.getNoticeCategoryVO().getCid(),
								noticeVO.getNtitle(),
								noticeVO.getNcontent(),
								noticeVO.getNnum());
		
		return result;
	}
	//게시글삭제
	@Override
	public void delete(long nnum) {
		String sql = "delete from notice where nnum = ? ";
		
		jt.update(sql.toString(), nnum);
		
	}
	//게시글 총 레코드 수
	@Override
	public long totalRecordCount() {
		StringBuilder sql = new StringBuilder();
		 sql.append("select count(*) as totalRecCnt ");
		 sql.append("  from notice t1, notice_category t2 ");
		 sql.append(" where t1.ncategory = t2.cid ");
		
		return jt.queryForObject(sql.toString(), Long.class);
	}
	//게시글 총 레코드 수(검색어 포함)
	public long totalRecordCount(String searchType, String keyWord) {
		StringBuilder sql = new StringBuilder();
		 sql.append("select count(*) as totalRecCnt ");
		 sql.append("  from notice t1, notice_category t2 ");
		 sql.append(" where t1.ncategory = t2.cid ");
		 switch (searchType) {
			case "TC": //제목+내용
				sql.append("and ( t1.ntitle  like '%" + keyWord + "%' ");
				sql.append("   or t1.ncontent like '%" + keyWord + "%' ) ");
				break;
			case "T":	//제목
				sql.append("and t1.ntitle  like '%" + keyWord + "%' ");
				break;
			case "C":	//내용
				sql.append("and t1.ncontent  like '%" + keyWord + "%' ");
				break;
			case "N": //별칭
				sql.append("and t1.nnickname  like '%" + keyWord + "%'" );
				break;
			case "I":  //아이디
				sql.append("and t1.nid  like '%" + keyWord + "%'" );
				break;
			case "A":  //전체			
				sql.append("and ( t1.ntitle  like '%" + keyWord + "%' ");
				sql.append("   or t1.ncontent like '%" + keyWord + "%' ");
				sql.append("   or t1.nnickname like '%" + keyWord + "%' ");
				sql.append("   or t1.nid like '%" + keyWord + "%' )");
				break;
				
			default:
				break;
			}	
		 
		 return jt.queryForObject(sql.toString(), Long.class);
	}
	
	
}
