package com.kh.portfolio.notice.svc;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;


import com.kh.portfolio.common.paging.PageCriteria;
import com.kh.portfolio.notice.dao.NoticeDAO;
import com.kh.portfolio.notice.vo.NoticeCategoryVO;
import com.kh.portfolio.notice.vo.NoticeVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NoticeSVCImpl implements NoticeSVC {
	
	private final NoticeDAO noticeDAO;
	private final PageCriteria pc;
	
	//카테고리 읽기
	@Override
	public List<NoticeCategoryVO> getCategory() {
		
		return noticeDAO.getCategory();
	}

//	@Override
//	public List<NoticeVO> noticeList() {
//		
//		return noticeDAO.noticeList();
//	}
	//공지사항 목록
	@Override
	public Map<String, Object> list(int reqPage) {
		Map<String,Object> map = new HashMap<>();
		
		//1)요청페이지
		pc.getRc().setReqPage(reqPage);
		//2)총레코드정보
		pc.setTotalRec(noticeDAO.totalRecordCount());
		//3)페이징계산
		pc.calculatePaging();
		
		//4)목록가져오기
		int startRec  = pc.getRc().getStartRec();
		int endRec 		= pc.getRc().getEndRec();
		List<NoticeVO> list = noticeDAO.noticeList(startRec, endRec);
		
		//5)map객체에 게시글 목록, pc담기
		map.put("noticeList", list);
		map.put("pc",pc);
		
		return map;
	}
	
	//공지사항 목록(검색어 포함)
	@Override
	public Map<String, Object> list(int reqPage, String searchType, String keyword) {
		Map<String,Object> map = new HashMap<>();
		
		//1)요청페이지
		pc.getRc().setReqPage(reqPage);
		//2)총레코드정보
		pc.setTotalRec(noticeDAO.totalRecordCount(searchType, keyword));
		//3)페이징계산
		pc.calculatePaging();
		
		//4)목록가져오기
		int startRec  = pc.getRc().getStartRec();
		int endRec 		= pc.getRc().getEndRec();
		List<NoticeVO> list = noticeDAO.noticeList(startRec, endRec, searchType, keyword);
		
		//5)map객체에 게시글 목록, pc담기
		map.put("noticeList", list);
		map.put("pc",pc);
		
		return map;
	}
	//이벤트 목록
	@Override
	public Map<String, Object> eventlist(int reqPage) {
		Map<String,Object> map = new HashMap<>();
		
		//1)요청페이지
		pc.getRc().setReqPage(reqPage);
		//2)총레코드정보
		pc.setTotalRec(noticeDAO.totalRecordCount());
		//3)페이징계산
		pc.calculatePaging();
		
		//4)목록가져오기
		int startRec  = pc.getRc().getStartRec();
		int endRec 		= pc.getRc().getEndRec();
		List<NoticeVO> list = noticeDAO.eventList(startRec, endRec);
		
		//5)map객체에 게시글 목록, pc담기
		map.put("eventList", list);
		map.put("pc",pc);
		
		return map;
	}
	//이벤트 목록(검색 포함)
	@Override
	public Map<String, Object> eventlist(int reqPage, String searchType, String keyword) {
		Map<String,Object> map = new HashMap<>();
		
		//1)요청페이지
		pc.getRc().setReqPage(reqPage);
		//2)총레코드정보
		pc.setTotalRec(noticeDAO.totalRecordCount(searchType, keyword));
		//3)페이징계산
		pc.calculatePaging();
		
		//4)목록가져오기
		int startRec  = pc.getRc().getStartRec();
		int endRec 		= pc.getRc().getEndRec();
		List<NoticeVO> list = noticeDAO.eventList(startRec, endRec, searchType, keyword);
		
		//5)map객체에 게시글 목록, pc담기
		map.put("eventList", list);
		map.put("pc",pc);
		
		return map;
	}
	
	//공지사항 게시물 읽기
	@Override
	public NoticeVO view(long nnum) {
		
		return noticeDAO.view(nnum);
	}
	//게시물 아이디 읽기
	@Override
	public String selectNid(long nnum) {
		
		return noticeDAO.selectNid(nnum);
	}

	//공지사항 게시물 작성
	@Override
	public int write(NoticeVO noticeVO) {
		
		return noticeDAO.write(noticeVO);
	}
	//게시물 조회수
	@Override
	public int updateNhit(long nnum) {
		
		return noticeDAO.updateNhit(nnum);
	}
	
	//게시물 수정
	@Override
	public int modify(NoticeVO noticeVO) {
		
		return noticeDAO.modify(noticeVO);
	}
	
	//게시글 삭제
	public void delete(long nnum) {
		
		noticeDAO.delete(nnum);
	}
	
}
