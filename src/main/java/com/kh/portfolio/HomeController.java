package com.kh.portfolio;

import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.kh.portfolio.lecture.svc.LectureSVC;
import com.kh.portfolio.lecture.svc.OfflineLectureSVC;
import com.kh.portfolio.lecture.vo.LectureVO;
import com.kh.portfolio.lecture.vo.ReviewVO;
import com.kh.portfolio.member.vo.MemberVO;

@Controller
public class HomeController {
	
	private static final Logger logger 
		= LoggerFactory.getLogger(HomeController.class);
	
	@Autowired
	LectureSVC lectureSVC;
	
	@Autowired
	OfflineLectureSVC offLectureSVC;
	
	//메인페이지
	@GetMapping("/")
	public String welcomePage(Model model, HttpSession session) {
		
		MemberVO memberVO = (MemberVO) session.getAttribute("member");
		String location = null;
		
		if (memberVO != null) {
			location = memberVO.getRegion().substring(0, 2);

		} else {
			location = offLectureSVC.randomLoca();
		}
		
		List<LectureVO> offLecture = offLectureSVC.locationList(location);
		Collections.shuffle(offLecture);
		model.addAttribute("location", offLecture.get(0).getLocation());
		model.addAttribute("offLecture", offLecture);
		
		List<LectureVO> list = lectureSVC.getOnNewLecture();
		model.addAttribute("onNewLecture", list);
		
		List<LectureVO> list2 = lectureSVC.getOnBestLecture();
		model.addAttribute("onBestLecture", list2);
		
		List<LectureVO> list3 = lectureSVC.getOnRecommendLecture();
		model.addAttribute("onRecommendLecture", list3);
		
		List<ReviewVO> list4 = lectureSVC.newReviewList();
		model.addAttribute("newReviewList", list4);
		model.addAttribute("newReviewCnt", list4.size());
		
		
		return "main3";
	}
	
	//코비드현황
//	@GetMapping("/openapi/covidStatus")
//	public String covidStatus() {
//		return "/openapi/covid";
//	}	
	
	//bootstrap
//	@GetMapping("/bootstrap")
//	public String bootstrap() {
//		
//		return "/test/bootstrap";
//	}
//	
//	@GetMapping("/webcam")
//	public String webcam() {
//		return "/test/webcam";
//	}
//	
//	@GetMapping("/uploadForm")
//	public String uploadForm() {
//		return "test/fileUpload";
//	}
	
//	@PostMapping("/upload")
//	public void upload(@RequestParam("data") MultipartFile multipartFile, HttpSession session, HttpServletRequest req, HttpServletResponse res) {
//	// 다운로드할 경로는 d:\work 폴더입니다.
//	File targetFile = new File("c:\\Dev\\" + multipartFile.getOriginalFilename());
//	try {
//	InputStream fileStream = multipartFile.getInputStream();
//	FileUtils.copyInputStreamToFile(fileStream, targetFile);
//	} catch (IOException e) {
//	FileUtils.deleteQuietly(targetFile);
//	e.printStackTrace();
//	}
//	}

}







