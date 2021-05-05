package com.kh.portfolio.notice.dao;

import java.util.List;

import com.kh.portfolio.notice.vo.NoticeCategoryVO;
import com.kh.portfolio.notice.vo.NoticeVO;

public interface NoticeDAO {
	
	//공지사항 카테고리 읽어오기
	List<NoticeCategoryVO> getCategory();
	
	//공지사항 목록 불러오기
	List<NoticeVO> noticeList(int startRec, int endRec);
	//공지사항 목록+검색
	List<NoticeVO> noticeList(int startRec, int endRec, String searchType, String keyWord);
	
	//이벤트 목록 불러오기
	List<NoticeVO> eventList(int startRec, int endRec);
	//이벤트 목록+검색
	List<NoticeVO> eventList(int startRec, int endRec, String searchType, String keyWord);
	
	
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
	
	//게시글 총 레코드 수
	long totalRecordCount();
	//게시글 총 레코드 수(검색어포함)
	long totalRecordCount(String searchType, String keyWord);
}
