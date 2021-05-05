package com.kh.portfolio.member.svc;

import com.kh.portfolio.member.vo.MemberVO;

public interface MemberSVC {
	
	//회원 등록
	int joinMember(MemberVO memberVO);
	
	//아이디로 회원 가입 조회(회원가입 유무 체크)
	boolean checkMember(String member_id);
	
	//아이디,비밀번호로 회원 검증
	boolean passMember(String member_id,String pw);
	
	//검증된 아이디의 회원 정보 읽어오기
	MemberVO readMemberInfo(String member_id);
	
	//회원 수정
	int modifyMember(MemberVO memberVO);	
	
	//회원 개별조회
	MemberVO listOneMember(String member_id);
	
	//비밀번호 검증
	boolean checkPw(String pw, String member_id);
	
	//회원 탈퇴
	int outMember(String member_id, String pw);
	
	
	

}
