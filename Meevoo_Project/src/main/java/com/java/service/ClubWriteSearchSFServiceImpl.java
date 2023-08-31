package com.java.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.PageDto;
import com.java.dto.SportDto;
import com.java.mapper.ClubWriteSearchSFMapper;

@Service
public class ClubWriteSearchSFServiceImpl implements ClubWriteSearchSFService {
	
	@Autowired ClubWriteSearchSFMapper clubWriteSearchSFMapper;

	@Override
	public HashMap<String, Object> selectClubSearchSFAll(PageDto pageDto) {
		HashMap<String, Object> map = new HashMap<>();
		
		//페이지 정보 메소드 호출
		pageDto = pageMethod(pageDto);
		
		// 운동모임장소 찾기 체육시설 목록 전체 가져오기
		ArrayList<SportDto> list = clubWriteSearchSFMapper.selectClubSearchSFAll(pageDto);
		
		//endPage가 최대페이지보다 더 크면 최대페이지까지만 노출
		if(pageDto.getEndPage()>pageDto.getMaxPage()) pageDto.setEndPage(pageDto.getMaxPage());
		
		map.put("list", list);
		map.put("pageDto", pageDto);
		
		
		return map;
	}
	
	//페이지 정보 메소드
	public PageDto pageMethod(PageDto pageDto) {
		
		// 전체 모임목록 수 저장
		pageDto.setListCount(clubWriteSearchSFMapper.selectListCount());
		// 최대 페이지
		pageDto.setMaxPage((int)Math.ceil((double)pageDto.getListCount()/10));
		// 처음 넘버링 페이지
		pageDto.setStartPage((int)((pageDto.getPage()-1)/10)*10 + 1);
		// 마지막 넘버링 페이지
		pageDto.setEndPage(pageDto.getStartPage()+10-1);
		// 페이지 최초 모임목록글 번호
		pageDto.setStartRow((pageDto.getPage()-1)*10+1);
		// 페이지 마지막 모임목록글 번호
		pageDto.setEndRow(pageDto.getStartRow()+10-1);
		
		return pageDto;
		
	}

}
