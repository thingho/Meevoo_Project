package com.java.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.java.dto.CListCurrDto;
import com.java.dto.CListJoinDto;
import com.java.dto.PageDto;
import com.java.dto.SListCurrDto;
import com.java.dto.SListPickDto;
import com.java.dto.SListReviewDto;
import com.java.mapper.MySBoardMapper;

@Service
public class MySBoardServiceImpl implements MySBoardService {

	@Autowired MySBoardMapper mySBoardMapper;
	//sessionId를 가져오기 위해 추가 
	@Autowired HttpSession session;
	
	@Override //체육시설 - 찜한 리스트 전체 가져오기
	public HashMap<String, Object> selectSportPickAll(PageDto pageDto) {
		HashMap<String, Object> map = new HashMap<>();
		ArrayList<SListPickDto> list = null;
		
		String id = null;
		if(session.getAttribute("sessionId") !=null) {
			//sessionId를 가져오기 위해 추가 
			id = (String)session.getAttribute("sessionId");
		}
				
	

		
		if(id!=null) {
			//페이지정보 메소드호출
			pageDto = pageMethod1(pageDto, id);
			//게시글 전체 가져오기
			list = mySBoardMapper.selectSportPickAll(pageDto, id);
			
		}
		
		
		map.put("list", list);
		map.put("pageDto", pageDto);

		
		return map;
	}
	
	//체육시설 - 찜한 리스트 페이지정보 메소드
	public PageDto pageMethod1(PageDto pageDto, String id) {
		
		//전체 게시글 수 저장
		pageDto.setListCount(mySBoardMapper.selectListSPick(pageDto, id));
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
	
	@Override //체육시설 - 찜하기 취소 버튼
	public void cancelSPick(String id, int sfno) {
		mySBoardMapper.cancelSPick(id, sfno);
		
	}

	
	@Override //체육시설 - 최근본 리스트 전체 가져오기
	public HashMap<String, Object> selectSportCurrAll(PageDto pageDto) {
		HashMap<String, Object> map = new HashMap<>();
		ArrayList<SListCurrDto> list = null;
		
		
		//sessionId를 가져오기 위해 추가
		String id = (String)session.getAttribute("sessionId");
		
		//페이지 정보 메소드 호출
		pageDto = pageMethod2(pageDto);
		
		if(id!=null) {
			//게시글 전체 가져오기
			list = mySBoardMapper.selectSportCurrAll(pageDto, id);
			map.put("loginCheck", "success");
		}else {
			map.put("loginCheck", "fail");
		}
		
		map.put("list", list);
		map.put("pageDto", pageDto);
		
		return map;
	}
	
	//체육시설 - 찜한 리스트 페이지정보 메소드
	public PageDto pageMethod2(PageDto pageDto) {
	
		//전체 게시글 수 저장
		pageDto.setListCount(mySBoardMapper.selectListSCurr());
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

	
	@Override //체육시설 - 후기 작성한 리스트 전체 가져오기
	public HashMap<String, Object> selectSportReviewAll(PageDto pageDto) {
		HashMap<String, Object> map = new HashMap<>(); 
		ArrayList<SListReviewDto> list = null;		
		
		//sessionId를 가져오기 위해 추가
		String id = (String)session.getAttribute("sessionId");
		
		//페이지 정보 메소드 호출
		pageDto = pageMethod3(pageDto,id);
		
		//System.out.println("MySBoardServiceImpl id : "+id);
		
		if(id!=null) {
			list = mySBoardMapper.selectSportReviewAll(pageDto, id);
			map.put("loginCheck", "success");
		}else {
			map.put("loginCheck", "fail");
		}
		
		map.put("list", list);
		map.put("pageDto", pageDto);
		
		return map;
	}

	//체육시설 - 후기 작성한 리스트 페이지정보 메소드
	public PageDto pageMethod3(PageDto pageDto,String id) {
		
		//전체 게시글 수 저장
		pageDto.setListCount(mySBoardMapper.selectListSReview(pageDto, id));
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

	
	@Override //후기 작성한 리스트 1개 삭제
	public void deleteSReview(int sfno) {
		mySBoardMapper.deleteSReview(sfno);
		
	}



	
}
