package com.java.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.PageDto;
import com.java.dto.SListCurrDto;
import com.java.dto.SListPickDto;
import com.java.dto.SListReviewDto;

@Mapper
public interface MySBoardMapper {

	//체육시설 - 찜한 리스트 전체 가져오기
	//ArrayList<SListPickDto> selectSportPickAll(PageDto pageDto); <-원래코드
	ArrayList<SListPickDto> selectSportPickAll(PageDto pageDto, String id);

	//체육시설 - 찜한 리스트 전체 게시글 수
	int selectListSPick(PageDto pageDto, String id);

	//체육시설 - 찜하기 취소 버튼
	void cancelSPick(String id, int sfno);

	
	//체육시설 - 최근본 리스트 전체 가져오기
	ArrayList<SListCurrDto> selectSportCurrAll(PageDto pageDto, String id);

	//체육시설 - 최근본 리스트 전체 게시글 수
	int selectListSCurr();

	
	//체육시설 - 후기 작성한 리스트 전체 가져오기
	ArrayList<SListReviewDto> selectSportReviewAll(PageDto pageDto, String id);

	//체육시설 - 후기 작성한 리스트 전체 게시글 수
	int selectListSReview(PageDto pageDto, String id);
	

	//후기 작성한 리스트 1개 삭제
	void deleteSReview(int sfno);




	
}
