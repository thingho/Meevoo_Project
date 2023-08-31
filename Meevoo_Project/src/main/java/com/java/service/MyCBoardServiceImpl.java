package com.java.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.CListCurrDto;
import com.java.dto.CListJoinDto;
import com.java.dto.CListPickDto;
import com.java.dto.ClubDto;
import com.java.dto.PageDto;
import com.java.mapper.MyCBoardMapper;

@Service
public class MyCBoardServiceImpl implements MyCBoardService {

	@Autowired MyCBoardMapper myCBoardMapper;
	//sessionId를 가져오기 위해 추가 
	@Autowired HttpSession session;
	
	@Override //운동모임 - 찜한 리스트 전체 가져오기
	public HashMap<String, Object> selectClubPickAll(PageDto pageDto) {
		HashMap<String, Object> map = new HashMap<>();
		ArrayList<CListPickDto> list = null;
		
		
		//sessionId를 가져오기 위해 추가 
		String id = (String)session.getAttribute("sessionId");
		
		//페이지정보 메소드호출
		pageDto = pageMethod1(pageDto, id);
		
		//System.out.println("MyCBoardServiceImpl id : "+id);
		
		if(id!=null) {
			//게시글 전체 가져오기
			list = myCBoardMapper.selectClubPickAll(pageDto, id);
			map.put("loginCheck", "success");		
		}else {
			map.put("loginCheck", "fail");
		}
		
		map.put("list", list);
		map.put("pageDto", pageDto);
		/* map.put("id", id); */
		
		return map;
	}
	
	//운동모임 - 찜한 리스트 페이지정보 메소드
	public PageDto pageMethod1(PageDto pageDto,String id) {
		
		//전체 게시글 수 저장
		pageDto.setListCount(myCBoardMapper.selectListCPick(pageDto,id));
		//최대 넘버링 페이지
		pageDto.setMaxPage((int)Math.ceil((double)pageDto.getListCount()/10));
		//시작 넘버링 페이지
		pageDto.setStartPage((int)((pageDto.getPage()-1)/10)*10+1);
		//끝 넘버링 페이지
		pageDto.setEndPage(pageDto.getStartPage()+10-1);
		//시작번호
		pageDto.setStartRow((pageDto.getPage()-1)*10+1);
		//끝나는번호
		pageDto.setEndRow(pageDto.getStartRow()+10-1);
		
		//endPage가 최대페이지 보다 더 크면 최대페이지까지만 노출
		if(pageDto.getEndPage()>=pageDto.getMaxPage()) pageDto.setEndPage(pageDto.getMaxPage());
		
		//System.out.println("getEndPage : "+pageDto.getEndPage());
		//System.out.println("getMaxPage : "+pageDto.getMaxPage());
				
		return pageDto;
	}
	
	@Override //운동모임 - 찜하기 취소 버튼
	public void cancelCPick(String id, int cno) {
		myCBoardMapper.cancelCPick(id, cno);
		
	}

	
	@Override //운동모임 - 최근본 리스트 전체 가져오기
	public HashMap<String, Object> selectClubCurrAll(PageDto pageDto) {
		HashMap<String, Object> map = new HashMap<>();
		ArrayList<CListCurrDto> list = null;
		
		//페이지 정보 메소드 호출
		pageDto = pageMethod2(pageDto);
		
		//sessionId를 가져오기 위해 추가
		String id = (String)session.getAttribute("sessionId");
		
		//System.out.println("MyCBoardServiceImpl id : "+id);
		
		if(id!=null) {
			//게시글 전체 가져오기
			list = myCBoardMapper.selectClubCurrAll(pageDto, id);
			map.put("loginCheck", "success");
		}else {
			map.put("loginCheck", "fail");
		}
		
		
		map.put("list", list);
		map.put("pageDto", pageDto);
		
		return map;
	}
	
	//운동모임 - 찜한 리스트 페이지정보 메소드
	public PageDto pageMethod2(PageDto pageDto) {
	
		//전체 게시글 수 저장
		pageDto.setListCount(myCBoardMapper.selectListCCurr());
		//최대 넘버링 페이지
		pageDto.setMaxPage((int)Math.ceil((double)pageDto.getListCount()/10));
		//시작 넘버링 페이지
		pageDto.setStartPage((int)((pageDto.getPage()-1)/10)*10+1);
		//끝 넘버링 페이지
		pageDto.setEndPage(pageDto.getStartPage()+10-1);
		//시작번호
		pageDto.setStartRow((pageDto.getPage()-1)*10+1);
		//끝나는번호
		pageDto.setEndRow(pageDto.getStartRow()+10-1);
		
		return pageDto;
	}

	
	@Override //운동모임 - 참여한 리스트 전체 가져오기
	public HashMap<String, Object> selectClubJoinAll(PageDto pageDto) {
		HashMap<String, Object> map = new HashMap<>();
		ArrayList<CListJoinDto> list = null;
		
		
		//sessionId 를 가져오기 위해 추가
		String id = (String)session.getAttribute("sessionId");
		//System.out.println("MyCBoardServiceImpl : "+id);
		
		pageDto = pageMethod3(pageDto,id);
		
		if(id!=null) {
			//게시글 전체 가져오기
			list = myCBoardMapper.selectClubJoinAll(pageDto, id);
			map.put("loginCheck", "success");
		}else {
			map.put("loginCheck", "fail");
		}
		
		map.put("list", list);
		map.put("pageDto", pageDto);
		
		return map;
	}

	//운동모임 - 찜한 리스트 페이지정보 메소드
	public PageDto pageMethod3(PageDto pageDto,String id) {
		//System.out.println("MyCBoardServiceImpl count :"+pageDto.getListCount());
		//System.out.println("MyCBoardServiceImpl count :"+pageDto.getMaxPage());
		//System.out.println("MyCBoardServiceImpl count :"+pageDto.getStartPage());
		//System.out.println("MyCBoardServiceImpl count :"+pageDto.getStartRow());
		//System.out.println("MyCBoardServiceImpl getPage :"+pageDto.getPage());
		//전체 게시글 수 저장
		pageDto.setListCount(myCBoardMapper.selectListCJoin(pageDto,id));
		//최대 넘버링 페이지
		pageDto.setMaxPage((int)Math.ceil((double)pageDto.getListCount()/10));
		//시작 넘버링 페이지
		pageDto.setStartPage((int)((pageDto.getPage()-1)/10)*10+1);
		//끝 넘버링 페이지
		pageDto.setEndPage(pageDto.getStartPage()+10-1);
		//시작번호
		pageDto.setStartRow((pageDto.getPage()-1)*10+1);
		//끝나는번호
		pageDto.setEndRow(pageDto.getStartRow()+10-1);
		
		//endPage가 최대페이지 보다 더 크면 최대페이지까지만 노출
		if(pageDto.getEndPage()>=pageDto.getMaxPage()) pageDto.setEndPage(pageDto.getMaxPage());
		
		//System.out.println("getEndPage : "+pageDto.getEndPage());
		//System.out.println("getMaxPage : "+pageDto.getMaxPage());
		
		return pageDto;
	}

	@Override //참여한 리스트 1개 삭제
	public void deleteCJoin(int cno) {
		myCBoardMapper.deleteCJoin(cno);
		
	}

	
	@Override //main에 표시될 가장 많이 찜한 상위 4개 운동 모임
	public ArrayList<ClubDto> selectCPickTop4() {
		ArrayList<ClubDto> list = myCBoardMapper.selectCPickTop4();
		
		return list;
	}


	

}
