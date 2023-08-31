package com.java.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.PageDto;
import com.java.dto.SportDto;

@Mapper
public interface ClubWriteSearchSFMapper {

	// 운동모임장소 찾기 체육시설 목록 전체 가져오기
	public ArrayList<SportDto> selectClubSearchSFAll(PageDto pageDto);

	//운동모임장소 찾기 체육시설 목록 글 수
	public int selectListCount();

}
