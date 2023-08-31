package com.java.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.SportDto;
import com.java.dto.SportReportDto;
import com.java.dto.SportReviewAnswerDto;

@Mapper
public interface SportReportMapper {

	// 문의글 전체 가져오기
	ArrayList<SportReportDto> selectAll(int startRow, int endRow, String category, String srep_word);
	//문의글 전체개수
	int selectListCount(String category, String srep_word);

	// 문의글 1개 가져오기
	SportReportDto selectOne(int srepno);
	
	
//	// 문의글 이전글 가져오기
//	SportReportDto selectPrevOne(int srepno);
//	// 문의글 다음글 가져오기
//	SportReportDto selectNextOne(int srepno);


	// 문의글 작성으로 인한 시설번호 전체 가져오기
	ArrayList<SportDto> selectSfno();
	// 문의글 1개 저장하기
	void insertOne(SportReportDto srdto);

	// 문의글 수정하기
	void updateOne(SportReportDto srDto);
	
	// 문의글 삭제하기
	void deleteOne(int srepno);

	// 문의글 답변 전체 가져오기
	ArrayList<SportReviewAnswerDto> selectAnAll(int srepno);
	//답변 저장
	void answerInsert(SportReviewAnswerDto srepanDto);
	//답변 1개 가져오기
	SportReviewAnswerDto selectAnOne(SportReviewAnswerDto srepanDto);
	// 답변 1개 삭제하기
	void answerDelete(int srepanno);
	
	

}
