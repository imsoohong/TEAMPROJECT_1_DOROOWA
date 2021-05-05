package com.kh.portfolio.lecture.svc;

import java.util.Collections;
import java.util.List;

import org.springframework.stereotype.Service;

import com.kh.portfolio.lecture.dao.OfflineLectureDAO;
import com.kh.portfolio.lecture.vo.LectureVO;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Service
@Slf4j
@RequiredArgsConstructor
public class OfflineLectureSVCImpl implements OfflineLectureSVC{
	
	private final OfflineLectureDAO offlineLectureDAO;

	/**
	 * 강의 조회
	 * @param lecture_title
	 * @return
	 */
	@Override
	public LectureVO view(String lecture_title) {
		
		return offlineLectureDAO.view(lecture_title);
	}
	
	@Override
	public String randomLoca() {
		
		
		String[] locationList = {"부산", "울산", "서울"};
		
		int random = (int)Math.floor(Math.random()*(locationList.length));
		
		
		String location = locationList[random];
		
		return location;
	}
	
//	/**
//	 * 전체 강의 목록 조회
//	 * @return
//	 */
//	@Override
//	public List<LectureVO> list() {
//		log.info("전체강의 목록 조회 =>"+offlineLectureDAO.list());
//		return offlineLectureDAO.list();
//	}

	/**
	 * 지역 선택으로 오프라인 강의 목록 가져오기
	 * @param location
	 * @return
	 */
	@Override
	public List<LectureVO> locationList(String location) {
		List<LectureVO> result = null;
		if(location.equals("전체")) {
			log.info("지역 선택은 전체 선택");
			result = offlineLectureDAO.locationListAll();
			log.info("전체 선택시 결과값 => "+result);
			
			//지역 선택을 전체로 선택시 LectureVO의 sortLocation 값을 전체로 바꿔주는 과정(뷰에 출력하기 위함)
			for (int i = 0; i < result.size(); i++) {
				result.get(i).setSortLocation(location);
				log.info("전체 선택 후 지역 정보 변환 결과 => "+result);
			}
		}
		else if(location.equals("기타")) {
			log.info("지역 선택은 기타 선택");
			result = offlineLectureDAO.locationListEtc(location);
			log.info("기타 선택시 결과값 => "+result);
			
			//지역 선택을 기타로 선택시 LectureVO의 sortLocation 값을 기타로 바꿔주는 과정(뷰에 출력하기 위함)
			for (int i = 0; i < result.size(); i++) {
				result.get(i).setSortLocation(location);
				log.info("기타 선택 후 지역 정보 변환 결과 => "+result);
			}
			
		}else {
			log.info("지역 선택은 서울, 울산, 부산 중 택1");
			log.info(location);
			result = offlineLectureDAO.locationList(location);
			log.info("서울,울산,부산 택1의 결과"+result);

			for (int i = 0; i < result.size(); i++) {
				result.get(i).setSortLocation(location);
				log.info("기타 선택 후 지역 정보 변환 결과 => "+result);
			}
			
		}
		return result;
	}

	
	/**
	 * 정렬 기능 선택 후 높은 순으로 강의 재조회
	 * @return
	 */
	@Override
	public List<LectureVO> ratingList(String location,String option) {
		List<LectureVO> result = null;
		
		if(location.equals("전체")) {
			if(option.equals("rowPrice")) {
				option = "price asc";
				result = offlineLectureDAO.ratingListAll(option);
				
			}else {
				option = option+" desc";
				result = offlineLectureDAO.ratingListAll(option);
//			for (int i = 0; i < result.size(); i++) {
//				result.get(i).setSortLocation("전체");
//				log.info("기타 선택 후 지역 정보 변환 결과 => "+result);
//			}
			}
		}
		
		else if(location.equals("기타")) {
			if(option.equals("rowPrice")) {
				option = "price asc";
				result = offlineLectureDAO.ratingListEtc(location, option);
				
			}else {
				option = option+" desc";
				result = offlineLectureDAO.ratingListEtc(location, option);
//			for (int i = 0; i < result.size(); i++) {
//				result.get(i).setSortLocation("기타");
//				log.info("기타 선택 후 지역 정보 변환 결과 => "+result);
//			}
			}
			
		}else{
			if(option.equals("rowPrice")) {
				option = "price asc";
				result = offlineLectureDAO.ratingList(location,option);
			}else {
				option = option+" desc";
				result = offlineLectureDAO.ratingList(location,option);
			}
		}
		return result;
	}

}
