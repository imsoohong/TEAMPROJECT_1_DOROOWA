package com.kh.portfolio.member.dao;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.kh.portfolio.member.vo.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO  {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberDAOImpl.class);
	private JdbcTemplate jt;
	
	@Autowired
	public MemberDAOImpl(JdbcTemplate jt) {
		this.jt = jt;
		
	}
	
	//회원등록
	@Override
	public int joinMember(MemberVO memberVO) {
		logger.info("joinMember 호출 ! 인수는 MemberVO => " + memberVO);
		int result = 0;
		StringBuilder sql = new StringBuilder();
				sql.append("insert into member(member_id,pw,name,nickname,region,tel) " );
				sql.append("values (?,?,?,?,?,?) " );
				result = jt.update(sql.toString(),memberVO.getMember_id(),memberVO.getPw(),memberVO.getName(),memberVO.getNickname(), memberVO.getRegion(), memberVO.getTel());
		return result;
		
	}

	
	//아이디로 회원 가입 조회(회원가입 유무 체크)
	@Override
	public boolean checkMember(String member_id) {
		logger.info("조회할 회원 아이디는 :"+ member_id);
		Boolean result = false;
		
		StringBuilder sql = new StringBuilder();
			sql.append(" select count(*) ");
			sql.append(" from member ");
			sql.append(" where member_id=? ");
			int count = jt.queryForObject(sql.toString(),Integer.class,member_id);
			logger.info("값이 1일 경우 회원 존재 => " + count);
			result = (count == 1) ? true : false;
			return result;
	}
	
	//아이디와 비밀번호를 통해 회원 검증
	@Override
	public boolean passMember(String member_id, String pw) {
		boolean result = false;
		
		StringBuilder sql = new StringBuilder();
		sql.append(" select count(*) ");
		sql.append(" from member ");
		sql.append(" where member_id=? ");
		sql.append(" and pw=? ");
		int count = jt.queryForObject(sql.toString(),Integer.class,member_id,pw);
		result = (count == 1) ? true : false;

		return result;
	}
	
	//검증 된 아이디를 통해 회원의 정보 조회
	@Override
	public MemberVO readMemberInfo(String member_id) {

		StringBuilder sql = new StringBuilder();
		sql.append(" select * ");
		sql.append(" from member ");
		sql.append(" where member_id = ? ");
		
		MemberVO memberVO = jt.queryForObject(sql.toString(), new BeanPropertyRowMapper<MemberVO>(MemberVO.class), member_id);
		
		return memberVO ;
	}
	
	//회원수정
	public int modifyMember(MemberVO memberVO) {
		int result = 0;
			
		StringBuilder sql = new StringBuilder();
		sql.append("update member ");
		sql.append("   set tel = ?, ");
		sql.append("       nickname = ?, ");
		sql.append("       region = ?, ");
		sql.append("       udate = systimestamp ");
		sql.append("where  member_id = ? ");
		sql.append("  and  pw = ? ");
				
		result = jt.update(
									sql.toString(),
									memberVO.getTel(),
									memberVO.getNickname(),
									memberVO.getRegion(),
									memberVO.getMember_id(),
									memberVO.getPw());
		
		return result;
	}
	
	//회원 개별조회
	@Override
	public MemberVO listOneMember(String member_id) {
		
		StringBuilder sql = new StringBuilder();
		sql.append("select * from member ");
		sql.append("where member_id = ?");
		
		MemberVO memberVO =	jt.queryForObject(
							sql.toString(), 
							new BeanPropertyRowMapper<MemberVO>(MemberVO.class), 
							member_id);	
		
		logger.info("============"+memberVO.toString());
		return memberVO;
	}

	@Override
	public boolean checkPw(String pw, String member_id) {
		logger.info("조회할 회원 아이디는 :"+ member_id);
		Boolean result = false;
		
		StringBuilder sql = new StringBuilder();
			sql.append(" select count(*) ");
			sql.append(" from member ");
			sql.append(" where member_id= ? ");
			sql.append("   and pw= ? ");
			int count = jt.queryForObject(sql.toString(),Integer.class,member_id,pw);
			logger.info("값이 1일 경우 비밀번호 맞음 => " + count);
			result = (count == 1) ? true : false;
			return result;
	}


	//회원 탈퇴
	@Override
	public int outMember(String member_id, String pw) {
		String sql = "delete from member where member_id = ? and pw = ? ";
		return jt.update(sql.toString(),member_id,pw);
	}
	

}
