package com.java.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;

import com.java.dto.CListCurrDto;
import com.java.dto.CListJoinDto;
import com.java.dto.CListPickDto;
import com.java.dto.ClubDto;
import com.java.dto.PageDto;

@Mapper
public interface MyCBoardMapper {

	//운동모임 - 찜한 리스트 전체 가져오기
	ArrayList<CListPickDto> selectClubPickAll(PageDto pageDto, String id);

	//운동모임 - 찜한 리스트 전체 게시글 수
	int selectListCPick(PageDto pageDto, String id);

	//운동모임 - 찜하기 취소 버튼
	void cancelCPick(String id, int cno);

	
	//운동모임 - 최근본 리스트 전체 가져오기
	ArrayList<CListCurrDto> selectClubCurrAll(PageDto pageDto, String id);

	//운동모임 - 최근본 리스트 전체 게시글 수
	int selectListCCurr();
	

	//운동모임 - 참여한 리스트 전체 가져오기
	ArrayList<CListJoinDto> selectClubJoinAll(PageDto pageDto, String id);
	
	//운동모임 - 참여한 리스트 전체 게시글 수
	int selectListCJoin(PageDto pageDto, String id);
	
	
	//참여한 리스트 1개 삭제
	void deleteCJoin(int cno);

	//main에 표시될 가장 많이 찜한 상위 4개 운동 모임
	ArrayList<ClubDto> selectCPickTop4();

}
