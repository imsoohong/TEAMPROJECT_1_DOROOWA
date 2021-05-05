package com.kh.portfolio.notice;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.portfolio.common.paging.PageCriteria;
import com.kh.portfolio.notice.svc.NoticeSVC;
import com.kh.portfolio.notice.vo.NoticeVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@RequestMapping("/notice")
@RequiredArgsConstructor
@Slf4j
public class NoticeController {
	
	private final NoticeSVC noticeSVC;
	private final NoticeVO noticeVO = new NoticeVO();
	
	//공지사항 목록
	@GetMapping({"/",
		"/{reqPage}",
		"/{reqPage}/{searchType}/{keyword}"
		
	})
	public String notice(
			Model model,
			@PathVariable(required = false) Optional<Integer> reqPage,
			@PathVariable(required = false) String searchType,
			@PathVariable(required = false) String keyword
			) {
		
		//model.addAttribute("adminMemu", attributeValue)
//		log.info("reqPage="+reqPage);
//		log.info("searchType="+searchType);
//		log.info("keyword="+keyword);
		
		
		Map<String,Object> map = null;
		if(searchType != null && keyword !=null) {
			//검색어 있는 경우
			log.info("검색어 있는 경우");
			map	= noticeSVC.list(reqPage.orElse(1), searchType, keyword);
		}else {
			//검색어 없는 경우
			log.info("검색어 없는 경우");
			map = noticeSVC.list(reqPage.orElse(1));
			
		}
		
		//게시글 목록
		model.addAttribute("noticeList", (List<NoticeVO>)(map.get("noticeList")));		
		//페이징 정보
		model.addAttribute("pc", (PageCriteria)(map.get("pc")));

		return "/notice/Notice";
	}
	//이벤트 목록
	@GetMapping({"/event",
		"/event/{reqPage}",
		"/event/{reqPage}/{searchType}/{keyword}"
		
	})
	public String event(
			Model model,
			@PathVariable(required = false) Optional<Integer> reqPage,
			@PathVariable(required = false) String searchType,
			@PathVariable(required = false) String keyword
			) {
		Map<String,Object> map = null;
		if(searchType != null && keyword !=null) {
			//검색어 있는 경우
			log.info("검색어 있는 경우");
			map	= noticeSVC.eventlist(reqPage.orElse(1), searchType, keyword);
		}else {
			//검색어 없는 경우
			log.info("검색어 없는 경우");
			map = noticeSVC.eventlist(reqPage.orElse(1));
			
		}
		
		//게시글 목록
		model.addAttribute("eventList", (List<NoticeVO>)(map.get("eventList")));		
		//페이징 정보
		model.addAttribute("pc", (PageCriteria)(map.get("pc")));
		
		
		return "/notice/Event";
	}
	
	
	
	
	
	
	
	//게시글 읽기
	@GetMapping("/view/{nnum}")
	public String readForm(	
			@PathVariable(name="nnum") long nnum,
			Model model
			) {
		noticeSVC.updateNhit(nnum); //조회수 증가
		model.addAttribute("selectNid", noticeSVC.selectNid(nnum));
		model.addAttribute("Noticeview",noticeSVC.view(nnum));
		
		return "notice/NoticeView";
	}
	//게시글 수정
	@GetMapping("/replyForm/{nnum}")
	public String replyForm(
			@PathVariable(name="nnum") long nnum,
			Model model
			) {

		model.addAttribute("NoticeVO",noticeSVC.view(nnum));
		model.addAttribute("selectNid", noticeSVC.selectNid(nnum));
		return "notice/NoticeReply";
	}
	//게시글 수정처리
	@PostMapping("modify")
	public String modify(
			NoticeVO noticeVO
			) {
		
		noticeSVC.modify(noticeVO);
		
		return "redirect:/notice/view/"+noticeVO.getNnum();
	}
	//게시글 삭제
	@GetMapping("/delete/{nnum}")
	public String delete(
			@PathVariable(name="nnum") long nnum
			) {
		
		noticeSVC.delete(nnum);
		return "redirect:/notice/";
	}
	
	//글쓰기폼
	@GetMapping("/writeForm")
	public String writeForm() {
		
		return "notice/NoticeWrite";
	}
	//공지사항글쓰기
	@PostMapping("/write")
	public String write(
			NoticeVO noticeVO
			) {

		noticeSVC.write(noticeVO);
		return "redirect:/notice/";
		 
	}
	
	
	
}
