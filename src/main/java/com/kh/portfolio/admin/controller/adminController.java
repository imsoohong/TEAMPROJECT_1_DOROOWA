package com.kh.portfolio.admin.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.List;

import javax.mail.Multipart;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartRequest;

import com.kh.portfolio.admin.svc.AdminLectureSVC;
import com.kh.portfolio.lecture.vo.LectureVO;
import com.kh.portfolio.member.vo.MemberVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/admin")
@RequiredArgsConstructor
public class adminController {
	
	
	
	private final AdminLectureSVC lectureSVC;
	
	
	//회원 전체목록
	@GetMapping("/memberList")
	public String memberList(Model model) {
		
		List<MemberVO> list = lectureSVC.memberList();
		model.addAttribute("memberList", list);
		
		return "/admin/memberList";
	}
	
	//온라인강의개설폼
	@GetMapping("/registerOnLectureForm")
	public String onLectureForm(){
		
	return "/admin/registerOnLectureForm";
	}
	//오프라인강의개설폼
	@GetMapping("/registerOffLectureForm")
	public String offLectureForm(){
		
		return "/admin/registerOffLectureForm";
	}
	
	//온라인강의개설
	@PostMapping("/registerOnLecture")
	public String openLecture(
			HttpServletRequest request, HttpServletResponse response) throws Exception 
					{
		
		request.setCharacterEncoding("utf-8");
		String encoding = "utf-8";
		
		
		String path = "D:\\javaedu\\test\\doroowa\\src\\main\\webapp\\WEB-INF\\resources\\img\\thumbnail";
		//String path = "C:\\Dev\\doroowa\\src\\main\\webapp\\WEB-INF\\resources\\img\\thumbnail";
		File currentDirPath = new File(path);
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setRepository(currentDirPath);
		factory.setSizeThreshold(1024*1024);
		ServletFileUpload upload = new ServletFileUpload(factory);
		String fileName = null;
		int result = 0;
		
		LectureVO lectureVO = new LectureVO();
		
		try {
			List items = upload.parseRequest(request);
			
			for(int i=0; i<items.size(); i++) {
				FileItem fileItem = (FileItem) items.get(i);
				if(fileItem.isFormField()) {
					if(fileItem.getFieldName().equals("kinds")) {
						 lectureVO.setKinds(fileItem.getString(encoding));
					}
					if(fileItem.getFieldName().equals("lecture_title")) {
						lectureVO.setLecture_title(fileItem.getString(encoding));
					}
					if(fileItem.getFieldName().equals("member_id")) {
						lectureVO.setMember_id(fileItem.getString(encoding));
					}
					if(fileItem.getFieldName().equals("price")) {
						lectureVO.setPrice(Long.parseLong(fileItem.getString(encoding)));
					}
					if(fileItem.getFieldName().equals("opendate")) {
						lectureVO.setOpendate(Date.valueOf(fileItem.getString(encoding)));
					}
					if(fileItem.getFieldName().equals("teacher_intro")) {
						lectureVO.setTeacher_intro(fileItem.getString(encoding));
					}
					if(fileItem.getFieldName().equals("lecture_intro")) {
						lectureVO.setLecture_intro(fileItem.getString(encoding));
					}

				}else {
					if(fileItem.getSize()>0) {
						int idx = fileItem.getName().lastIndexOf("\\");
						if(idx==-1) {
							idx=fileItem.getName().lastIndexOf("/");
						}
						fileName = fileItem.getName().substring(idx+1);
						//File uploadFile = new File(currentDirPath+"\\"+lecture_title+"\\"+fileName);
						File uploadFile = new File(currentDirPath+"\\"+fileName);
						fileItem.write(uploadFile);
						lectureVO.setThumbnail(fileName);
						
					}
					
				}
			}
			result = lectureSVC.registerOnLecture(lectureVO);
			
		} catch (FileUploadException e) {
			e.printStackTrace();
		}
		
		String viewName = null;
		
		
		if(result == 1) {
			viewName = "redirect:/";
			
		}else {
			viewName = "/admin/registerOnLectureForm";
		}
		
		return viewName;
	}
	
	

	
	
	//강의소개수정
	@PostMapping("/modifyIntro")
	public String modifyIntro(
			LectureVO lectureVO,
			Model model) {
		
		log.info("lecture: "+lectureVO.getIntro());
		log.info("lecture2: "+lectureVO.getLecture_title());
		int result = lectureSVC.modifyIntro(lectureVO);
		
		String viewName = null;
		if(result==1) {
			log.info("테스트: "+lectureVO.getLecture_title());
			viewName = "redirect:/";
		}else {
			viewName = "/admin/registerOnLectureForm";
		}
		return viewName;
	}
	
	//통합 마커
	//오프라인 강의 개설
	@PostMapping("/registerOffLecture")
	public String openOfflineLecture(@Valid LectureVO lectureVO,
			BindingResult errResult) {
		
		String viewName = null;
		
		int result = 0;
		
		result = lectureSVC.registerOffLecture(lectureVO);
		
		if(result == 1) {
			viewName = "redirect:/";
			
		}else {
			viewName = "/admin/registerOffLectureForm";
		}
		
		return viewName;
	}
	
}





