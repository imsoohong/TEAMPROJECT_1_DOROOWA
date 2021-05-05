package com.kh.portfolio.video.controller;

import javax.servlet.http.HttpSession;

import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.portfolio.lecture.svc.LectureSVC;
import com.kh.portfolio.member.vo.MemberVO;
import com.kh.portfolio.student.svc.StudentSVC;
import com.kh.portfolio.student.vo.OrdersVO;
import com.kh.portfolio.video.svc.VideoSVC;
import com.kh.portfolio.video.vo.ProgressVO;
import com.kh.portfolio.video.vo.VideoVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

// 2021.3.19
@Controller
@Slf4j
@RequestMapping("/video")
@RequiredArgsConstructor
public class VideoController {
	
	public final VideoSVC videoSVC;
	public final StudentSVC studentSVC;
	public final LectureSVC lectureSVC;

	
	

	
	
	
	
	
	
	@GetMapping("/{lecture_title}/{video_id}")
	public String view(
			@PathVariable String lecture_title,
			@PathVariable long video_id, Model model,
			HttpSession session) {
		
		MemberVO m = (MemberVO)session.getAttribute("member");
		
		//해당 영상이 마지막 영상이라면
		if(video_id == videoSVC.lastVideo(lecture_title).getVideo_id()) {
			model.addAttribute("lastVidYn", true);
		}
		
		model.addAttribute("videoVO", videoSVC.view(video_id));
		//model.addAttribute("videoList", videoSVC.videoList(lecture_title));
		model.addAttribute("chapterList", lectureSVC.chapterList(lecture_title));
		model.addAttribute("curriculum", lectureSVC.curriculum(lecture_title));
		//비공개 강의는 볼 수 없게
		model.addAttribute("openYn", false);
		
		
		
		//영상갯수
		//model.addAttribute("videoCnt", videoSVC.videoList(lecture_title).size());
		model.addAttribute("videoCnt", lectureSVC.curriculum(lecture_title).size());
		model.addAttribute("progressCnt", 0);
		
		

	
		//1)회원이라면
		if(m != null) {
		
		//1-1)구매한 회원이라면
			if(studentSVC.existOrder(m.getMember_id(), lecture_title)) {
				model.addAttribute("openYn", true);
				if(studentSVC.myProgress(lecture_title, m.getMember_id())!=null) {
					model.addAttribute("myProgress", studentSVC.myProgress(lecture_title, m.getMember_id()));
					model.addAttribute("progressCnt", studentSVC.progressCnt(lecture_title, m.getMember_id()));
				}
				studentSVC.updateRecentVideo(video_id, m.getMember_id());
				
		//1-2)구매하지 않은 회원이라면
			}
			
			//2)회원이 아니라면
		}
		
		
		return "/video/video";
	}
	
	
	
	
	@GetMapping("/{lecture_title}/{video_id}/next")
	public String next(
			@PathVariable String lecture_title,
			@PathVariable long video_id, Model model,
			HttpSession session) {
		
		
		MemberVO m = (MemberVO)session.getAttribute("member");
		
		VideoVO nextVideo = videoSVC.nextVideo(video_id, lecture_title);
		
		model.addAttribute("videoVO", nextVideo);
		//해당 영상이 마지막 영상이라면
		if(nextVideo.getVideo_id() == videoSVC.lastVideo(lecture_title).getVideo_id()) {
			model.addAttribute("lastVidYn", true);
		}
		//model.addAttribute("videoList", videoSVC.videoList(lecture_title));
		model.addAttribute("chapterList", lectureSVC.chapterList(lecture_title));
		model.addAttribute("curriculum", lectureSVC.curriculum(lecture_title));
		
		//영상갯수
		//model.addAttribute("videoCnt", videoSVC.videoList(lecture_title).size());
		model.addAttribute("videoCnt", lectureSVC.curriculum(lecture_title).size());
		model.addAttribute("progressCnt", 0);
		
		
			//1-1)구매한 회원이므로
				model.addAttribute("openYn", true);
				if(studentSVC.myProgress(lecture_title, m.getMember_id())!=null) {
					model.addAttribute("myProgress", studentSVC.myProgress(lecture_title, m.getMember_id()));
					model.addAttribute("progressCnt", studentSVC.progressCnt(lecture_title, m.getMember_id()));
					
				}
				studentSVC.updateRecentVideo(video_id, m.getMember_id());
				
			

		
		
		return "/video/video";
	}
	
	
	
	
	
	
	
	@GetMapping("/{lecture_title}/recent")
	public String getRecentVideo(
			@PathVariable String lecture_title, Model model,
			HttpSession session) {
		
		MemberVO m = (MemberVO)session.getAttribute("member");
		
		
		
		
		
		try {
			//1)최근에 본 강의영상이 있다면 그 영상으로 이동
			
			ProgressVO p = (ProgressVO)studentSVC.getRecentVideo(m.getMember_id(), lecture_title);
			
			log.info("p값:"+p);
			
			//해당 영상이 마지막 영상이라면
			if(p.getVideo_id() == videoSVC.lastVideo(lecture_title).getVideo_id()) {
				model.addAttribute("lastVidYn", true);
			}
			
			
			
			model.addAttribute("videoVO", videoSVC.view(p.getVideo_id()));
			studentSVC.updateRecentVideo(p.getVideo_id(), m.getMember_id());
		} catch (EmptyResultDataAccessException e) {
			//e.printStackTrace();
			
			log.info("result 값 오류 생김");
			
			//2)없다면 강의의 첫번째 영상으로 이동
			VideoVO videoVO = videoSVC.firstVideo(lecture_title);
			model.addAttribute("videoVO", videoVO);
			studentSVC.updateRecentVideo(videoVO.getVideo_id(), m.getMember_id());
			
		}
		
		
		model.addAttribute("openYn", true);
		//model.addAttribute("videoList", videoSVC.videoList(lecture_title));
		model.addAttribute("chapterList", lectureSVC.chapterList(lecture_title));
		model.addAttribute("curriculum", lectureSVC.curriculum(lecture_title));
		model.addAttribute("myProgress", studentSVC.myProgress(lecture_title, m.getMember_id()));
		//영상갯수
		//model.addAttribute("videoCnt", videoSVC.videoList(lecture_title).size());
		model.addAttribute("videoCnt", lectureSVC.curriculum(lecture_title).size());
		model.addAttribute("progressCnt", studentSVC.progressCnt(lecture_title, m.getMember_id()));
		
		
		
		
		
		
		return "/video/video";
	}
	
	

	

	
	@PatchMapping("/{lecture_title}/{video_id}")
	@ResponseBody
	public String updateProgress(
			@PathVariable String lecture_title, 
			@PathVariable long video_id,
			HttpSession session) {
		
		
		MemberVO m = (MemberVO)session.getAttribute("member");
		
		log.info("lecture_title="+lecture_title);
		log.info("video_id="+video_id);
		String status = null;
		
		int result = videoSVC.updateProgress(lecture_title, video_id, m.getMember_id());
		
		if(result == 1) {
			status = "ok";
		}else {
			status = "nok";
		}
		return status;
		
	}
	
	
	@PatchMapping("/{lecture_title}/{video_id}/UpdateStudydate")
	@ResponseBody
	public String UpdateStudydate(
			@PathVariable String lecture_title, 
			@PathVariable long video_id,
			HttpSession session) {
		
		
		MemberVO m = (MemberVO)session.getAttribute("member");
		
		String status = null;
		
		int result = studentSVC.updateStudy(video_id, m.getMember_id());
		
		if(result == 1) {
			status = "ok";
		}else {
			status = "nok";
		}
		return status;
		
	}
	
	

	
	
	
	

	

		
	
	
}




