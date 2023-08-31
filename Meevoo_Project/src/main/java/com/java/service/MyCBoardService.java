package com.java.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.java.dto.CListCurrDto;
import com.java.dto.CListJoinDto;
import com.java.dto.CListPickDto;
import com.java.dto.ClubDto;
import com.java.dto.PageDto;

public interface MyCBoardService {

	//운동모임 - 찜한 리스트 전체, 전체 리스트 개수 가져오기
	HashMap<String, Object> selectClubPickAll(PageDto pageDto);

	//운동모임 - 찜하기 취소 버튼
	void cancelCPick(String id, int cno);

	
	//운동모임 - 최근본 리스트 전체, 전체 리스트 개수 가져오기
	HashMap<String, Object> selectClubCurrAll(PageDto pageDto);

	
	//운동모임 - 참여한 리스트 전체, 전체 리스트 개수 가져오기
	HashMap<String, Object> selectClubJoinAll(PageDto pageDto);

	//참여한 리스트 1개 삭제
	void deleteCJoin(int cno);

	
	//main에 표시될 가장 많이 찜한 상위 4개 운동 모임
	ArrayList<ClubDto> selectCPickTop4();



	

}
