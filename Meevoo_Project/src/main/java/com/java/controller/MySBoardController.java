package com.java.controller;

import java.util.HashMap;

import javax.mail.Session;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.java.dto.PageDto;
import com.java.dto.SListPickDto;
import com.java.service.MySBoardService;

@Controller
public class MySBoardController {

	@Autowired MySBoardService mySBoardService;
	//sessionId를 가져오기 위해 추가 
	@Autowired HttpSession session;
	
	//체육시설 - 찜한 리스트 전체 가져오기
	@RequestMapping("/mypage/mySportPick")
	public String mySportPick(PageDto pageDto, Model model) {
		
		if(session.getAttribute("sessionId") == null) {
			return "member/login";
		}
		
		HashMap<String, Object> map = mySBoardService.selectSportPickAll(pageDto);
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("pageDto", map.get("pageDto"));
		
		return "mypage/mySportPick";
	}
	
	//체육시설 - 찜하기 취소 버튼
	@RequestMapping("/mypage/sPickCancel")
	public String sPickCancel(int sfno, SListPickDto sListPickDto, Model model) {		
		//System.out.println("MySBoardController sfno : "+sListPickDto.getSfno());
		//System.out.println("MySBoardController sfno : "+sfno);
		
		String id="";
		if(session.getAttribute("sessionId")!=null || session.getAttribute("sessionId")!="") {
			id=(String) session.getAttribute("sessionId");
		}
		//System.out.println("MySBoardController id : "+id);
		
		mySBoardService.cancelSPick(id, sfno);
		
		return "redirect:/mypage/mySportPick";
	}
	
	//체육시설 - 최근본 리스트 전체 가져오기
	@RequestMapping("/mypage/mySportCurr")
	public String mySportCurr(PageDto pageDto, Model model) {
		
		HashMap<String, Object> map = mySBoardService.selectSportCurrAll(pageDto);
		String loginCheck = (String)(map.get("loginCheck"));
		
		if(loginCheck.equals("fail")) {
			
			return "member/login";
		}
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("pageDto", map.get("pageDto"));
		
		
		return "mypage/mySportCurr";
	}
	
	//체육시설 - 후기 작성한 리스트 전체 가져오기
	@RequestMapping("/mypage/mySportReview")
	public String mySportReview(PageDto pageDto, Model model) {
		
		if(session.getAttribute("sessionId") == null) {
			return "member/login";
		}
		
		HashMap<String, Object> map = mySBoardService.selectSportReviewAll(pageDto);
		
		String loginCheck = (String)(map.get("loginCheck"));
				
		if(loginCheck.equals("fail")) {
			return "member/login";
		}
		
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("pageDto", map.get("pageDto"));
		
		return "mypage/mySportReview";
	}
	
	//후기 작성한 리스트 1개 삭제
	@RequestMapping("/mypage/deleteSReview")
	public String deleteSReview(int sfno) {
		//System.out.println("MySBoardController sfno : "+sfno);
		//후기 작성한 리스트 1개 삭제
		mySBoardService.deleteSReview(sfno);
		
		return "redirect:/mypage/mySportReview";
	}
}
