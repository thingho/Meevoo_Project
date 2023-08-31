package com.java.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.web.multipart.MultipartFile;

import com.java.dto.CListCurrDto;
import com.java.dto.ClubDto;
import com.java.dto.ClubDto2;
import com.java.dto.ClubJoinUserDto;
import com.java.dto.ClubPickDto;
import com.java.dto.PageDto;

public interface ClubService {

	//모임목록 전체 가져오기
	HashMap<String, Object> selectClubAll(PageDto pageDto);

	//모임목록 추천 가져오기 1. 로그인 전, 찜하기 많고, 최근 게시글 중 모집중인 모임목록 2개
	ArrayList<ClubDto2> selectClubRecsLogout();
	
	//모임목록 추천 가져오기 2. 로그인한 사람의 관심지역, 관심종목과 일치하는 모집중인 모임목록 2개
	ArrayList<ClubDto2> selectClubRecsLogin(String id);

	// 모임목록 1개 가져오기
	HashMap<String, Object> selectClubOne(int cno);
	
	// 모임글 1개 가져오기 (update)
	ClubDto2 selectOne(int cno);
	
	// 필터 input 반영해서 모임목록 가져오기 (필터검색)
	ArrayList<ClubDto2> selectClubFilter(ClubDto2 clubDto2);

	//모임목록 글 1개 저장
	void insertClub(ClubDto2 cdto);
	
	//모임글 1개 삭제
	void deletOne(int cno);
	
	//모임목록 1개 수정
	void updateClub(ClubDto2 cdto);
	
	// 클럽 가입한 아이디 Count(cno,sessionId)
	int selectcjCount(int cno, String id);
	
	// 클럽 가입 목록 전체 가져오기
	ArrayList<ClubJoinUserDto> selectcjAll(int cno);
	
	// 해당 클럽에 가입 한 총 인원수
	int updateClubAll(int cno);
	
	// 모임 신청하기
	ClubJoinUserDto cjoinUser(ClubJoinUserDto cjoinuserDto);

	
	//지원--------------------------------------------------
	//최근본 모임 게시물 데이터 기록하기
	void insertCCurr(CListCurrDto ccurrdto);

	//운동모임 찜하기
	int clubPick(ClubPickDto cpickdto);

	//운동모임 찜하기 취소(삭제)하기
	void clubPickCancel(int cno,String id);

	//data_value 변수 값 가져오기 0:찜을 하지 않은 경우, 1:찜을 한경우
	int countCPick(int cno, String id);
	//--------------------------------------------------지원
}
