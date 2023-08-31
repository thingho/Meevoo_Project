package com.java.service;

import java.util.HashMap;

import com.java.dto.PageDto;
import com.java.dto.SListPickDto;

public interface MySBoardService {

	//체육시설 - 찜한 리스트 전체 가져오기
	HashMap<String, Object> selectSportPickAll(PageDto pageDto);

	//체육시설 - 찜하기 취소 버튼
	void cancelSPick(String id, int sfno);

	
	//체육시설 - 최근본 리스트 전체 가져오기
	HashMap<String, Object> selectSportCurrAll(PageDto pageDto);

	
	//체육시설 - 후기 작성한 리스트 전체 가져오기
	HashMap<String, Object> selectSportReviewAll(PageDto pageDto);

	//후기 작성한 리스트 1개 삭제
	void deleteSReview(int sfno);

	


}
