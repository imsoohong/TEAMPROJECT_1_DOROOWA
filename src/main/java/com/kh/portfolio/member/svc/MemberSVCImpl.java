package com.kh.portfolio.member.svc;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.portfolio.member.dao.MemberDAO;
import com.kh.portfolio.member.vo.MemberVO;

@Service
@Transactional(readOnly = true)
public class MemberSVCImpl implements MemberSVC {
	
	private static final Logger logger = LoggerFactory.getLogger(MemberSVCImpl.class);

	private final MemberDAO memberDAO;
	
	public MemberSVCImpl (MemberDAO memberDAO) {
		this.memberDAO = memberDAO;
	}
	
	
	//회원 등록
	@Override
	public int joinMember(MemberVO memberVO) {
		logger.info("int joinMember를 호출하였습니다 ! memberVO의 값은 " + memberVO);
		int result = 0;
		result = memberDAO.joinMember(memberVO);
		return result;
	}

	//아이디로 회원 가입 조회(회원가입 유무 체크)
	@Override
	public boolean checkMember(String member_id) {
		return memberDAO.checkMember(member_id);
	}


	//아이디,비밀번호로 회원 검증
	@Override
	public boolean passMember(String member_id, String pw) {
		return memberDAO.passMember(member_id, pw);
	}
	
	
	/**
	 * 검증된 아이디의 회원 정보 읽어오기... 
	 * 인데 보안문제 발생 우려 , 아이디만으로 비밀번호까지 읽어오게 할 수 있기에 외부 클라이언트에서 해당 메소드를 실행 할 수 있는 주소가 공개되면 
	 * 웹브라우저의 에러 메세지에서 아이디와 비밀번호를 탈취가능 !!! 보안요소 관련하여 질문할 것 !
	 */
	@Override
	public MemberVO readMemberInfo(String member_id) {
		MemberVO memberVO = memberDAO.readMemberInfo(member_id);
		return memberVO;
	}

	//회원수정
	@Transactional
	@Override
	public int modifyMember(MemberVO memberVO) {
		int result = 0;
		result = memberDAO.modifyMember(memberVO);
		return  result;
	}

	
	//회원 개별조회
	@Override
	public MemberVO listOneMember(String member_id) {
		MemberVO memberVO = memberDAO.listOneMember(member_id);
		return memberVO;
	}


	@Override
	public boolean checkPw(String pw, String member_id) {
		return memberDAO.checkPw(pw,member_id);
	}


	@Override
	public int outMember(String member_id, String pw) {
		return memberDAO.outMember(member_id, pw);
	}
}
