package com.kh.portfolio.notice.svc;

import java.util.List;
import java.util.Map;

import com.kh.portfolio.notice.vo.NoticeCategoryVO;
import com.kh.portfolio.notice.vo.NoticeVO;

public interface NoticeSVC {
	//공지사항 카테고리 읽어오기
	List<NoticeCategoryVO> getCategory();
	
//	//공지사항 목록 불러오기
//	List<NoticeVO> noticeList();
	
	//공지사항 목록
	Map<String,Object> list(int reqPage);
	
	//공지사항 목록(검색어 포함)
	Map<String,Object> list(int reqPage, String searchType, String keyword);
	
	//이벤트 목록
	Map<String,Object> eventlist(int reqPage);
		
	//이벤트 목록(검색어 포함)
	Map<String,Object> eventlist(int reqPage, String searchType, String keyword);
	
	
	
	//공지사항 게시물 읽기
	NoticeVO view(long nnum);
	
	//게시물의 아이디 조회
	String selectNid(long nnum);
	
	//게시물 작성
	int write(NoticeVO noticeVO);
	//게시물 조회수
	int updateNhit(long nnum);
	
	//게시물 수정
	int modify(NoticeVO noticeVO);
	
	//게시글 삭제
	void delete(long nnum);
	
	
	
	
	
}
