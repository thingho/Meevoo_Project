package com.java.service;

import java.util.ArrayList;



import java.util.HashMap;
import java.util.List;

import com.java.dto.SListCurrDto;
import com.java.dto.SportDto;
import com.java.dto.SportPickDto;
import com.java.dto.SportReviewDto;
import com.java.dto.SportReviewReportDto;

public interface SportService {
	
	// 1. 게시글 전체 가져오기
	HashMap<String, Object> selectAll(int page, String slist_word, SportDto sportDto);
	// 2. 게시글 1개 가져오기
	HashMap<String, Object> selectOne(int sfno);

	
	// 1. 게시글 하단 리뷰 전체 가져오기
	ArrayList<SportReviewDto> selectReAll(int sfno);
	// 2. 게시글 리뷰 저장하기
	SportReviewDto reviewInsert(SportReviewDto sreDto);
	// 3. 게시글 하단 리뷰 1개 삭제하기
	void reviewDelete(int sreno);
	// 4. 수정한 하단 리뷰 저장
	SportReviewDto reviewUpdateSave(SportReviewDto sreDto);
	
	
	// 리뷰글에 대한 신고글 1개 작성
	void insertReportOne(SportReviewReportDto srerepDto);
	
	
	// 찜하기 목록 전체 가져오기
	ArrayList<SportPickDto> selectSpAll(int sfno);
	// 1. 시설물 찜하기 등록
	SportPickDto sportPick(SportPickDto spickDto);
	// 2. 시설물 찜하기 취소
	void sportPickCancel(int spickno);
	// 찜 Count(sfno,sessionId)
	int selectSpCount(int sfno, String id);
	
	// 별점 총 갯수
	int updateStarAll(int sfno);
	// 리뷰 총 갯수
	int updatePeoAll(int sfno);
	
	//최근본 시설 게시물 데이터 기록하기
	//아이디 있을때 Dto에 저장
	void insertSCurr(SListCurrDto scurrdto);
	


}
