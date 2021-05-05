package com.kh.portfolio.video.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;

import com.kh.portfolio.teacher.svc.TeacherSVC;
import com.kh.portfolio.video.vo.VideoVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;


@Controller
@Slf4j
@RequiredArgsConstructor
public class VideoUpload extends HttpServlet{
	
	
	private final TeacherSVC teacherSVC;
	


	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException{
		doHandle (request, response);
		modifyVid (request, response);
	}
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
	throws ServletException, IOException{
		doHandle (request, response);
		modifyVid (request, response);
	}

	@PostMapping("/upload")
	public String doHandle(HttpServletRequest request, HttpServletResponse response) 
	throws ServletException, IOException{
		request.setCharacterEncoding("utf-8");
		String encoding = "utf-8";
		String path = "D:\\javaedu\\test\\doroowa\\src\\main\\webapp\\WEB-INF\\resources\\video";
		//String path = "C:\\Dev\\doroowa\\src\\main\\webapp\\WEB-INF\\resources\\video";
		File currentDirPath = new File(path);
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setRepository(currentDirPath);
		factory.setSizeThreshold(1024*1024);
		ServletFileUpload upload = new ServletFileUpload(factory);
		
		String title = null;
		String content = null;
		String lecture_title = null;
		String fileName = null;
		String secret = null;
		Long chapter_id = null;
		try {
			List items = upload.parseRequest(request);

			for(int i=0; i<items.size(); i++) {
				FileItem fileItem = (FileItem) items.get(i);
				if(fileItem.isFormField()) {
					//System.out.println(fileItem.getFieldName()+"="+fileItem.getString(encoding));

					if(fileItem.getFieldName().equals("title")) {
						 title = fileItem.getString(encoding);
					}
					if(fileItem.getFieldName().equals("content")) {
						content = fileItem.getString(encoding);
					}
					if(fileItem.getFieldName().equals("lecture_title")) {
						lecture_title = fileItem.getString(encoding);
					}
					if(fileItem.getFieldName().equals("secret")) {
						secret = fileItem.getString(encoding);
					}
					if(fileItem.getFieldName().equals("chapter_id")) {
						chapter_id = Long.parseLong(fileItem.getString(encoding));
					}
					
				}else {
					System.out.println("매개변수 이름:"+fileItem.getFieldName());
					log.info("name감지!"+fileItem.getName());
					//System.out.println("파일이름:"+fileItem.getName());
					log.info("파일크기:"+fileItem.getSize()+"bytes");
					if(fileItem.getSize()>0) {
						int idx = fileItem.getName().lastIndexOf("\\");
						if(idx==-1) {
							idx=fileItem.getName().lastIndexOf("/");
						}
						fileName = fileItem.getName().substring(idx+1);
						//File uploadFile = new File(currentDirPath+"\\"+lecture_title+"\\"+fileName);
						File uploadFile = new File(currentDirPath+"\\"+fileName);
						fileItem.write(uploadFile);
					}
				}
			}
			
			
			log.info("title:"+title+", content:"+content+", lecture_title:"+lecture_title+", fileName:"+fileName);
			teacherSVC.uploadVideo(title, content, lecture_title, fileName, secret, chapter_id);
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/teacher/studio";
		
		
	}
	
	
	@PostMapping("/modifyVid")
	public String modifyVid(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException{
		request.setCharacterEncoding("utf-8");
		String encoding = "utf-8";
		//String path = "D:\\javaedu\\test\\doroowa\\src\\main\\webapp\\WEB-INF\\resources\\video";
		String path = "C:\\Dev\\doroowa\\src\\main\\webapp\\WEB-INF\\resources\\video";
		File currentDirPath = new File(path);
		DiskFileItemFactory factory = new DiskFileItemFactory();
		factory.setRepository(currentDirPath);
		factory.setSizeThreshold(1024*1024);
		ServletFileUpload upload = new ServletFileUpload(factory);
		
		String title = null;
		String content = null;
		String lecture_title = null;
		String fileName = null;
		String secret = null;
		String currentVid = null;
		Long chapter_id = null;
		Long video_id = null;
		try {
			List items = upload.parseRequest(request);
			
			for(int i=0; i<items.size(); i++) {
				FileItem fileItem = (FileItem) items.get(i);
				if(fileItem.isFormField()) {
					//System.out.println(fileItem.getFieldName()+"="+fileItem.getString(encoding));
					
					if(fileItem.getFieldName().equals("title")) {
						title = fileItem.getString(encoding);
					}
					if(fileItem.getFieldName().equals("lecture_title")) {
						title = fileItem.getString(encoding);
					}
					if(fileItem.getFieldName().equals("content")) {
						content = fileItem.getString(encoding);
					}
					if(fileItem.getFieldName().equals("lecture_title")) {
						lecture_title = fileItem.getString(encoding);
					}
					if(fileItem.getFieldName().equals("secret")) {
						secret = fileItem.getString(encoding);
					}

					if(fileItem.getFieldName().equals("chapter_id")) {
						chapter_id = Long.parseLong(fileItem.getString(encoding));
					}
					if(fileItem.getFieldName().equals("video_id")) {
						video_id = Long.parseLong(fileItem.getString(encoding));
					}
					if(fileItem.getFieldName().equals("currentVid")) {
						currentVid = fileItem.getString(encoding);
					}
					
				}else {
					System.out.println("매개변수 이름:"+fileItem.getFieldName());
					log.info("name감지!"+fileItem.getName());
					//System.out.println("파일이름:"+fileItem.getName());
					log.info("파일크기:"+fileItem.getSize()+"bytes");
					if(fileItem.getSize()>0) {
						int idx = fileItem.getName().lastIndexOf("\\");
						if(idx==-1) {
							idx=fileItem.getName().lastIndexOf("/");
						}
						fileName = fileItem.getName().substring(idx+1);
						//File uploadFile = new File(currentDirPath+"\\"+lecture_title+"\\"+fileName);
						File uploadFile = new File(currentDirPath+"\\"+fileName);
						fileItem.write(uploadFile);
					}
				}
			}
			
			
			
			log.info("title:"+title+", content:"+content+", lecture_title:"+lecture_title+", fileName:"+fileName+", chapter_id:"+chapter_id);
			
			if(fileName == null) {
				//fileName = currentVid;
				teacherSVC.modifyVideo(title, content, currentVid, secret, chapter_id, video_id);
				
			}else {
				teacherSVC.modifyVideo(title, content, fileName, secret, chapter_id, video_id);
				
			}
			
			
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return "redirect:/teacher/studio";
		
		
	}

}