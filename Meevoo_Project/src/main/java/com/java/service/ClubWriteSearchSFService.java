package com.java.service;

import java.util.HashMap;

import com.java.dto.PageDto;

public interface ClubWriteSearchSFService {

	// 운동모임장소 찾기 체육시설 목록 전체 가져오기
	HashMap<String, Object> selectClubSearchSFAll(PageDto pageDto);

}
