package com.java.mapper;

import java.util.ArrayList;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.SListCurrDto;
import com.java.dto.SportDto;
import com.java.dto.SportPickDto;
import com.java.dto.SportReviewDto;
import com.java.dto.SportReviewReportDto;

@Mapper
public interface SportMapper {
	
	//게시글 전체 가져오기
	ArrayList<SportDto> selectAll(int startRow, int endRow, String slist_word, String sport, String dong_one);
	
	//게시글 1개 가져오기
	SportDto selectOne(int sfno);
	
	//게시글 전체개수
	int selectListCount(String slist_word, String sport, String dong_one);

	
	// 문의글,리뷰신고글 작성으로 인한 시설번호 전체 가져오기
	ArrayList<SportDto> selectSfno();

	
	// 문의글 하단 리뷰 전체 가져오기
	ArrayList<SportReviewDto> selectReAll(int sfno);
	// 문의글 하단 리뷰 저장하기
	void reviewInsert(SportReviewDto sreDto);
	// 문의글 하단 리뷰 1개 가져오기
	SportReviewDto selectReOne(SportReviewDto sreDto);
	// 게시글 하단 리뷰 1개 삭제하기
	void reviewDelete(int sreno);
	//수정한 하단 리뷰 저장
	void reviewUpdateSave(SportReviewDto sreDto);

	
	// 리뷰글에 대한 신고글 1개 작성
	void insertReportOne(SportReviewReportDto srerepDto);


	//1. 시설물 찜하기 등록
	void sportPick(SportPickDto spickDto);
	//찜한 데이터 1개 가져오기
	SportPickDto selectSpOne(SportPickDto spickDto);
	//찜한 데이터 전체 가져오기
	ArrayList<SportPickDto> selectSpAll(int sfno);
	// 2. 시설물 찜하기 취소
	void sportPickCancel(int spickno);
	// 찜 Count(sfno,sessionId)
	int selectSpCount(int sfno, String id);

	// 별점 총 갯수
	int updateStarAll(int sfno);
	// 리뷰 총 갯수
	int updatePeoAll(int sfno);

	//최근본 시설 게시물 데이터 기록하기
	void insertSCurr(SListCurrDto scurrdto);



	
}
