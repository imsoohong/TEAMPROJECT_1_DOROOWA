package com.kh.portfolio.video.svc;

import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.portfolio.video.dao.VideoDAO;
import com.kh.portfolio.video.vo.VideoVO;

import lombok.RequiredArgsConstructor;


@Service
@RequiredArgsConstructor
public class VideoSVCImpl implements VideoSVC {
	
	private final VideoDAO videoDAO;
	
	/**
	 * 강의영상 리스트
	 * @param lecture_title
	 * @return
	 */
	@Override
	public List<VideoVO> videoList(String lecture_title) {
		return videoDAO.videoList(lecture_title);
	}
	
	/**
	 * 강의영상 보기
	 * @param video_id
	 * @return
	 */
	@Override
	public VideoVO view(long video_id) {
		
		return videoDAO.view(video_id);
	}
	
	
	/**
	 * 강의영상 진행도 업데이트
	 * @param lecture_title
	 * @param video_id
	 * @param member_id
	 * @return
	 */
	@Override
	public int updateProgress(String lecture_title, long video_id, String member_id) {
		return videoDAO.updateProgress(lecture_title, video_id, member_id);
	}
	
	
	/**
	 * 강의 첫영상 불러오기
	 * @param lecture_title
	 * @return
	 */
	@Override
	public VideoVO firstVideo(String lecture_title) {
		return videoDAO.firstVideo(lecture_title);
	}
	
	
//2021-3-19
	
	@Override
	public VideoVO lastVideo(String lecture_title) {
		return videoDAO.lastVideo(lecture_title);
	}
	
	
	
	
	@Override
	public VideoVO nextVideo(long video_id, String lecture_title) {
		VideoVO lastVideo = videoDAO.lastVideo(lecture_title);
	
		long lastVideoId = lastVideo.getVideo_id();
		
//		if(video_id<lastVideoId) {
//			System.out.println("현재 영상id:"+video_id);
//			long nextVideoId = video_id;
//			do{
//				System.out.println("if문 실행됨");
//				++nextVideoId;
//				System.out.println("다음 영상id:"+nextVideoId);
//			}while(videoDAO.existVideo(nextVideoId, lecture_title));
//			System.out.println("lastVideoId:"+lastVideoId+"nextVideoId:"+nextVideoId);
//			return  videoDAO.view(nextVideoId);
//		}
//		if(video_id<lastVideoId) {
//			System.out.println("현재video_id:"+video_id);
//			++video_id;
//			System.out.println("증가됨");
//			while(videoDAO.existVideo(video_id, lecture_title)) {
//				System.out.println("while문 실행");
//				++video_id;
//			}
//		}
		

		
		
		if(video_id<lastVideoId){
			System.out.println("현재 video_id:"+video_id);
			
			while(true) {
				++video_id;
				if(videoDAO.existVideo(video_id, lecture_title)) break;
			}
		}
		
		System.out.println("증가된 video_id:"+video_id);
		System.out.println("lastVideoId:"+lastVideoId);
		
		
		return videoDAO.view(video_id);
	}
	
	
	
	


}
