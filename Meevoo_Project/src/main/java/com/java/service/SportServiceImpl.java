package com.java.service;

import java.util.ArrayList;


import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.SListCurrDto;
import com.java.dto.SportDto;
import com.java.dto.SportPickDto;
import com.java.dto.SportReviewDto;
import com.java.dto.SportReviewReportDto;
import com.java.mapper.SportMapper;

@Service
public class SportServiceImpl implements SportService {

	@Autowired
	SportMapper sportMapper;

	@Override
	public HashMap<String, Object> selectAll(int page, String slist_word,
			SportDto sportDto) {
		
		//게시글 전체 가져오기
		
		HashMap<String, Object> map = new HashMap<>();
		
		//게시글 전체개수
		int listCount = sportMapper.selectListCount(slist_word,sportDto.getSport(),sportDto.getDong_one());

		//최대페이지
		int maxPage = (int)Math.ceil((double)listCount/10); // 최대페이지(전체 게시물/10 -> 4개page)
		int startPage = (int)((page-1)/10)*10 + 1; // 시작페이지 1
		int endPage = startPage+10-1; // 마지막페이지
		
		int startRow = (page-1)*10+1; //1page : 1-10, 2page : 11-20
		int endRow = startRow+10-1;
		
		//endPage가 maxPage보다 더 크면 maxPage만 노출
		if(endPage>maxPage) endPage=maxPage;
		ArrayList<SportDto> list = sportMapper.selectAll(startRow,endRow, slist_word,sportDto.getSport(),sportDto.getDong_one());
		
		map.put("list", list);
		map.put("listCount", listCount);
		map.put("maxPage", maxPage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("page", page);
		
		// 검색필터
		map.put("slist_word", slist_word);
		map.put("sportDto", sportDto);
		
		System.out.println(slist_word);
		System.out.println("Impl sportDto : "+sportDto);
		System.out.println("Impl sportDto sport : "+sportDto.getSport());
		System.out.println("Impl sportDto Dong_one : "+sportDto.getDong_one());
		
		return map;
	}

	@Override
	public HashMap<String, Object> selectOne(int sfno) {

		HashMap<String, Object> map = new HashMap<>();
		
		//게시글 1개 가져오기
		SportDto sdto = sportMapper.selectOne(sfno);
		map.put("sdto", sdto);
		
		return map;
	}

	@Override
	public ArrayList<SportReviewDto> selectReAll(int sfno) {
		// 게시글 하단 리뷰 전체 가져오기
		ArrayList<SportReviewDto> sreList = sportMapper.selectReAll(sfno);
		return sreList;
	}

	@Override
	public SportReviewDto reviewInsert(SportReviewDto sreDto) {
		// 게시글 하단 리뷰저장 후
		sportMapper.reviewInsert(sreDto);
		
		//하단리뷰 1개 가져오기
		SportReviewDto sreviewdto = sportMapper.selectReOne(sreDto);
		return sreviewdto;
	}

	@Override
	public void reviewDelete(int sreno) {
		// 게시글 하단 리뷰 1개 삭제하기
		sportMapper.reviewDelete(sreno);
	}

	@Override //수정한 하단 리뷰 저장
	public SportReviewDto reviewUpdateSave(SportReviewDto sreDto) {
		// 1개 수정
		sportMapper.reviewUpdateSave(sreDto);
		
		//1개 가져오기
		SportReviewDto sreviewdto = sportMapper.selectReOne(sreDto);
		return sreviewdto;
	}

	@Override
	public void insertReportOne(SportReviewReportDto srerepDto) {
		
		// 리뷰글에 대한 신고글 1개 작성
		sportMapper.insertReportOne(srerepDto);
		System.out.println("SportServiceImpl 리뷰 작성자 : "+srerepDto.getId());
		System.out.println("SportServiceImpl 리뷰 번호 : "+srerepDto.getSreno());
		System.out.println("SportServiceImpl 리뷰 신고 유형 : "+srerepDto.getSrerepcontent());
		System.out.println("SportServiceImpl 리뷰 신고글 이미지 : "+srerepDto.getSrerepimg());
	}


	@Override
	public SportPickDto sportPick(SportPickDto spickDto) {
		// 1. 시설물 찜하기 등록
		sportMapper.sportPick(spickDto);
		
		//찜하기 1개 가져오기
		SportPickDto pickdto = sportMapper.selectSpOne(spickDto);
		
		System.out.println("찜한 id : "+spickDto.getId());
		System.out.println("찜한 sfno : "+spickDto.getSfno());
		System.out.println("찜한 spickyn : "+spickDto.getSpickyn());
		
		return pickdto;
	}
	
	@Override
	public void sportPickCancel(int spickno) {
		// 2. 시설물 찜하기 취소
		sportMapper.sportPickCancel(spickno);
		System.out.println("impl : "+spickno);
		
	}

	
	@Override
	public ArrayList<SportPickDto> selectSpAll(int sfno) {
		// 찜하기 전체 가져오기
		ArrayList<SportPickDto> spickList = sportMapper.selectSpAll(sfno);
		return spickList;
	}

	@Override
	public int selectSpCount(int sfno, String id) {
		// 찜 Count(sfno,sessionId)
		
		int spickcount = sportMapper.selectSpCount(sfno,id);
		System.out.println(spickcount);
		return spickcount;
	}

	@Override
	public int updateStarAll(int sfno) {
		// 별점 총 갯수
		int srestarTotal = sportMapper.updateStarAll(sfno); 
		return srestarTotal;
	}

	@Override
	public int updatePeoAll(int sfno) {
		// 리뷰 총 갯수
		int srepeoTotal = sportMapper.updatePeoAll(sfno); 
		return srepeoTotal;
	}

	@Override //최근본 시설 게시물 데이터 기록하기
	public void insertSCurr(SListCurrDto scurrdto) {
		sportMapper.insertSCurr(scurrdto);
		
	}

	

}
