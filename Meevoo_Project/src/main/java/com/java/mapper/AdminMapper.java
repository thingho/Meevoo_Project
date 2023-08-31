package com.java.mapper;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import com.java.dto.ClubDto;
import com.java.dto.ClubReportDto;
import com.java.dto.DonutChartsClubDto;
import com.java.dto.MemberDto;
import com.java.dto.PageDto;
import com.java.dto.SearchDto;
import com.java.dto.SportDto;
import com.java.dto.SportReportDto;
import com.java.dto.StaticHeadOneDto;
import com.java.dto.StaticHeadTwoDto;
import com.java.dto.UserGraphDto;
import com.java.dto.WriteGraphDto;

@Mapper
public interface AdminMapper {
	
	
	//회원 그래프 데이터 생성하기
	List<UserGraphDto> selectUserGraphAll();
	
	//게시물 그래프 데이터 생성하기
	List<WriteGraphDto> selectWriteGraphAll();
	
	//스포츠 시설 신고 게시물 1개 가져오기
	SportReportDto selectSROne(int srepno);
	
	//스포츠 신고 게시물 상위 5개
	ArrayList<SportReportDto> selectSFive();
	
	//모임 신고 게시물 1개 가져오기
	ClubReportDto selectCROne(int crepno);
	
	//모임 신고 게시물 상위 5개
	ArrayList<ClubReportDto> selectCFive();
	
	//1) 신규가입자, 최근 게시물, 최근리뷰 값을 리스트에 채워서 데려오기
	ArrayList<StaticHeadOneDto> selectSHOne();
	
	//2) 접속자 수 리스트에 채워서 데려오기
	ArrayList<StaticHeadTwoDto> selectSHTwo();
	
	//1) 모임 - 스포츠 종류별 count
	ArrayList<DonutChartsClubDto> selectDonutChartClub();


	//전체 회원 하단 넘버링 
	ArrayList<MemberDto> selectAll(int startRow, int endRow,@Param("search") SearchDto search);

	//전체 회원 가져오기
	int selectMemberListCount(SearchDto search);

	//회원 추가하기
	void insertMember(MemberDto memberDto);

	//수정할 회원 가져오기
	MemberDto selectTUMOne(String id);

	//회원 수정사항 저장하기
	void updateTUMOne(MemberDto mdto);

	//회원 탈퇴처리
	void deleteTUMOne(MemberDto mdto);
	
	
	
	
	
	
	//전체 모임 하단 넘버링 
	ArrayList<ClubDto> selectClubAll(PageDto pageDto1,SearchDto search);
	
	//전체 모임 가져오기
	int selectClubListCount(SearchDto search);
	
	//새로 모임 추가할때 시설 리스트중에서 선택하게 리스트 가져오기
	ArrayList<SportDto> selectSportList();

	//모임 추가하기
	void insertClub(ClubDto cdto);


	//수정할 모임 정보 가져오기
	ClubDto selectTCMOne(int cno);
	
	// 수정하기 - 시설번호 전체 가져오기
	ArrayList<SportDto> selectSportModifyList();

	//수정한 모임 정보 저장하기
	void updateTCMOne(ClubDto cdto);

	//모임 삭제하기
	void deleteTCMOne(ClubDto cdto);



	










	

	
}
