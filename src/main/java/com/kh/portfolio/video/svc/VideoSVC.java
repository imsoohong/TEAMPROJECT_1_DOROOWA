package com.kh.portfolio.video.svc;

import java.util.List;

import com.kh.portfolio.video.vo.VideoVO;

public interface VideoSVC {
	
	/**
	 * 강의영상 리스트
	 * @param lecture_title
	 * @return
	 */
	List<VideoVO> videoList(String lecture_title);
	
	/**
	 * 강의영상 보기
	 * @param video_id
	 * @return
	 */
	VideoVO view(long video_id);
	
	/**
	 * 강의영상 진행도 업데이트
	 * @param lecture_title
	 * @param video_id
	 * @param member_id
	 * @return
	 */
	int updateProgress(String lecture_title, long video_id, String member_id);
	
	/**
	 * 강의 첫영상 불러오기
	 * @param lecture_title
	 * @return
	 */
	VideoVO firstVideo(String lecture_title);
	
	
//2021-3-19
	/**
	 * 강의 마지막영상 불러오기
	 * @param lecture_title
	 * @return
	 */
	VideoVO lastVideo(String lecture_title);

	
	/*
	 * 다음 영상
	 */
	VideoVO nextVideo(long video_id, String lecture_title);
	
	
	

}
