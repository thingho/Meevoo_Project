package com.java.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import org.springframework.web.multipart.MultipartFile;

import com.java.dto.CListCurrDto;
import com.java.dto.ClubDto;
import com.java.dto.ClubDto2;
import com.java.dto.ClubDto2;
import com.java.dto.ClubJoinUserDto;
import com.java.dto.ClubPickDto;
import com.java.dto.PageDto;

@Repository
@Mapper
public interface ClubMapper {
	
	//모임목록 전체 가져오기
	public ArrayList<ClubDto2> selectClubAll(PageDto pageDto);

	//전체 모임목록 글 수
	public int selectListCount();
	
	//모임목록 추천 가져오기 1. 로그인 전, 찜하기 많고, 최근 게시글 중 모집중인 모임목록 2개
	public ArrayList<ClubDto2> selectClubRecsLogout(); 
	
	//모임목록 추천 가져오기 2. 로그인한 사람의 관심지역, 관심종목과 일치하는 모집중인 모임목록 2개
	public ArrayList<ClubDto2> selectClubRecsLogin(String id);

	// 모임목록 1개 가져오기
	public ClubDto2 selectClubOne(int cno);
	
	// 모임글 1개 가져오기 (update)
	public ClubDto2 selectOne(int cno);
	
	// 필터 input 반영해서 모임목록 가져오기 (필터검색)
	public ArrayList<ClubDto2> selectClubFilter(ClubDto2 clubDto2);

	//모임목록 글 1개 저장
	void insertClub(ClubDto2 cdto);
	
	//모임글 1개 삭제
	public void deleteOne(int cno);

	//모임글 1개 수정
	public void updateClub(ClubDto2 cdto);
	
	
	// 클럽 가입한 아이디 Count(cno,sessionId)
	public int selectcjCount(int cno, String id);
	
	// 클럽 가입 목록 전체 가져오기
	public ArrayList<ClubJoinUserDto> selectcjAll(int cno);
	
	// 해당 클럽에 가입 한 총 인원수
	public int updateClubAll(int cno);
	
	// 모임 신청하기
	public void cjoinUser(ClubJoinUserDto cjoinuserDto);
	// 모임 신청한거 1개 가져오기
	public ClubJoinUserDto selectCjuOne(ClubJoinUserDto cjoinuserDto);
	

	//지원---------------------------------------
	//최근본 모임 게시물 데이터 기록하기
	public void insertCCurr(CListCurrDto ccurrdto);

	//운동모임 찜하기
	public void clubPick(ClubPickDto cpickdto);

	//운동모임 찜하기 취소(삭제)하기
	void clubPickCancel(int cno, String id);

	//data_value 변수 값 가져오기 0:찜을 하지 않은 경우, 1:찜을 한경우
	public int countCPick(int cno, String id);

	//Clublist 총 찜 개수 수정
	void updateCTotalPick(int cno);
	//---------------------------------------지원



}
