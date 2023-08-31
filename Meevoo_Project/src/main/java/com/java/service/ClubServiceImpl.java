package com.java.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.java.dto.CListCurrDto;
import com.java.dto.ClubDto;
import com.java.dto.ClubDto2;
import com.java.dto.ClubJoinUserDto;
import com.java.dto.ClubPickDto;
import com.java.dto.PageDto;
import com.java.mapper.ClubMapper;

@Service
public class ClubServiceImpl implements ClubService {
	
	@Autowired ClubMapper clubMapper; //객체선언
	@Autowired HttpSession session;

	@Override //모임목록 전체 가져오기 - 현재페이지
	public HashMap<String, Object> selectClubAll(PageDto pageDto) {
		HashMap<String, Object> map = new HashMap<>();
		
		//페이지 정보 메소드 호출
		pageDto = pageMethod(pageDto);
		
		//모임목록 전체 가져오기
		ArrayList<ClubDto2> list = clubMapper.selectClubAll(pageDto);
		
		//endPage가 최대페이지보다 더 크면 최대페이지까지만 노출
		if(pageDto.getEndPage()>pageDto.getMaxPage()) pageDto.setEndPage(pageDto.getMaxPage());
		
		map.put("list", list);
		map.put("pageDto", pageDto);
		
		return map;
	}
	
	//페이지 정보 메소드
	public PageDto pageMethod(PageDto pageDto) {
		
		// 전체 모임목록 수 저장
		pageDto.setListCount(clubMapper.selectListCount());
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

	@Override //모임목록 추천 가져오기 1. 로그인 전, 찜하기 많고, 최근 게시글 중 모집중인 모임목록 2개
	public ArrayList<ClubDto2> selectClubRecsLogout() {
		
		//모임목록 추천 가져오기 2. 로그인 전, 찜하기 많고, 최근 게시글 중 모집중인 모임목록 2개
		ArrayList<ClubDto2> recsLogoutList = clubMapper.selectClubRecsLogout();
		return recsLogoutList;
	}
	
	@Override //모임목록 추천 가져오기 2. 로그인한 사람의 관심지역, 관심종목과 일치하는 모집중인 모임목록 2개
	public ArrayList<ClubDto2> selectClubRecsLogin(String id) { // java에서 함수의 매개변수를 실어서 보내는건데 (값) 거기에는 type이 필요함
		
		//모임목록 추천 가져오기 1. 로그인한 사람의 관심지역, 관심종목과 일치하는 모집중인 모임목록 2개
		ArrayList<ClubDto2> recsLoginList = clubMapper.selectClubRecsLogin(id); //위에서 변수가 선언 되었기 때문에 id만쓰는것 
		return recsLoginList;
	}

	@Override // 모임목록 1개 가져오기
	public HashMap<String, Object> selectClubOne(int cno) {
		HashMap<String, Object> map = new HashMap<>();
		
		ClubDto2 cdto = clubMapper.selectClubOne(cno);
		map.put("cdto", cdto);
		
		//지원---------------------------------------
		//Clublist 총 찜 개수 수정
		clubMapper.updateCTotalPick(cno);
		//---------------------------------------지원
		
		return map;
	}
	
	@Override // 모임목록 1개 가져오기 (update)
	public ClubDto2 selectOne(int cno) {
		ClubDto2 cdto = clubMapper.selectOne(cno);
		return cdto;
	}
	
	@Override // 필터 input 반영해서 모임목록 가져오기 (필터검색)
	public ArrayList<ClubDto2> selectClubFilter(ClubDto2 clubDto2) {
		ArrayList<ClubDto2> filterList = clubMapper.selectClubFilter(clubDto2); 
		return filterList;
	}


	@Override //모임목록 글 1개 저장
	public void insertClub(ClubDto2 cdto) {
		
		//mapper로 전송 - 모임목록 글 1개 저장
		clubMapper.insertClub(cdto);
		
	}//모임목록 글 1개 저장
	
	@Override //모임글 1개 삭제
	public void deletOne(int cno) {

		clubMapper.deleteOne(cno);
		
	}
	
	@Override //모임글 1개 수정
	public void updateClub(ClubDto2 cdto) {
		clubMapper.updateClub(cdto);
		
	}

	
	
	@Override
	public int selectcjCount(int cno, String id) {
		// 클럽 가입한 아이디 Count(cno,sessionId)
		int cjoincount = clubMapper.selectcjCount(cno,id);
		System.out.println(cjoincount);
		return cjoincount;
	}

	@Override
	public ArrayList<ClubJoinUserDto> selectcjAll(int cno) {
		// 클럽 가입 목록 전체 가져오기
		ArrayList<ClubJoinUserDto> cjoinList = clubMapper.selectcjAll(cno); 
		return cjoinList;
	}

	@Override
	public int updateClubAll(int cno) {
		// 해당 클럽에 가입 한 총 인원수
		int cnowTotal = clubMapper.updateClubAll(cno);
		return cnowTotal;
	}

	@Override
	public ClubJoinUserDto cjoinUser(ClubJoinUserDto cjoinuserDto) {
		// 모임 신청하기
		clubMapper.cjoinUser(cjoinuserDto);
		
		// 모임 신청한거 1개 가져오기
		ClubJoinUserDto cjoindto = clubMapper.selectCjuOne(cjoinuserDto);
		return cjoindto;
	}

	
	//지원---------------------------------------
	@Override //최근본 모임 게시물 데이터 기록하기
	public void insertCCurr(CListCurrDto ccurrdto) {
		clubMapper.insertCCurr(ccurrdto);
		
	}

	@Override //운동모임 찜하기
	public int clubPick(ClubPickDto cpickdto) {
		clubMapper.clubPick(cpickdto);
		System.out.println("ClubServiceImpl cpickdto.getCpickno() : "+cpickdto.getCpickno());
		
		return cpickdto.getCpickno();
	}

	@Override //운동모임 찜하기 취소(삭제)하기
	public void clubPickCancel(int cno, String id) {
		clubMapper.clubPickCancel(cno, id);
		
	}

	@Override //data_value 변수 값 가져오기 0:찜을 하지 않은 경우, 1:찜을 한경우
	public int countCPick(int cno, String id) {
		int data_value = clubMapper.countCPick(cno, id);
		
		return data_value;
	}
	
	//---------------------------------------지원
	 

	

	
}
