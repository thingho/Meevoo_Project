package com.java.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.java.dto.CListCurrDto;
import com.java.dto.CListJoinDto;
import com.java.dto.CListPickDto;
import com.java.dto.ClubDto;
import com.java.dto.ClubPickDto;
import com.java.dto.PageDto;
import com.java.service.MyCBoardService;

@Controller
public class MyCBoardController {

	@Autowired MyCBoardService myCBoardService;
	//sessionId를 가져오기 위해 추가
	@Autowired HttpSession session;
	
	//운동모임 - 찜한 리스트 전체 가져오기
	@RequestMapping("/mypage/myClubPick")
	public String myClubPick(String id,PageDto pageDto, Model model) {

		/* System.out.println("MyCBoardController page"+pageDto.getPage()); */
		
		HashMap<String, Object> map = myCBoardService.selectClubPickAll(pageDto);
		String loginCheck = (String)(map.get("loginCheck"));
		//System.out.println("loginCheck : "+loginCheck);
		
		if(loginCheck.equals("fail")) {
			return "member/login";
		}
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("pageDto", map.get("pageDto"));
		
		
		//System.out.println("MyCBoardController list : "+list.get(0).getCno());
		
		return "mypage/myClubPick";
	}
	
	//운동모임 - 찜하기 취소 버튼
	@RequestMapping("/mypage/cPickCancel")
	public String cPickCancel(int cno, CListPickDto cListPickDto, Model model) {
		//System.out.println("MyCBoardController cno : "+cListPickDto.getCno());
		//System.out.println("MyCBoardController cno : "+cno);
		String id="";
		if(session.getAttribute("sessionId")!=null || session.getAttribute("sessionId")!="") {
			id=(String) session.getAttribute("sessionId");
		}
		
		//System.out.println("MyCBoardController id : "+id);
		
		myCBoardService.cancelCPick(id, cno);
		
		return "redirect:/mypage/myClubPick";
	}
	
	
	//운동모임 - 최근본 리스트 전체 가져오기
	@RequestMapping("/mypage/myClubCurr")
	public String myClubCurr(PageDto pageDto, Model model) {
		
		HashMap<String, Object> map = myCBoardService.selectClubCurrAll(pageDto);
		String loginCheck = (String)(map.get("loginCheck"));
		//System.out.println("loginCheck : "+loginCheck);
		
		if(loginCheck.equals("fail")) {
			
			return "member/login";
		}
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("pageDto", map.get("pageDto"));
		
		
		return "mypage/myClubCurr";
	}
	
	//운동모임 - 참여한 리스트 전체 가져오기
	@RequestMapping("/mypage/myClubJoin")
	public String myClubJoin(PageDto pageDto, Model model) {
		
		//System.out.println("MyCBoardController list : "+list.get(0).getid());
		//System.out.println("MyCBoardController page"+pageDto.getPage());
		HashMap<String, Object> map = myCBoardService.selectClubJoinAll(pageDto);
		
		String loginCheck= (String)(map.get("loginCheck"));
		//System.out.println("loginCheck : "+loginCheck);
		
		if(loginCheck.equals("fail")) {
			return "member/login";
		}
		
		
		model.addAttribute("list", map.get("list"));
		model.addAttribute("pageDto", map.get("pageDto"));
		
		return "mypage/myClubJoin";
	}
	
	//참여한 리스트 1개 삭제
	@RequestMapping("/member/deleteCJoin")
	public String deleteCJoin(int cno) {
		//System.out.println("MemberController cno : "+cno);
		//참여한 리스트 1개 삭제
		myCBoardService.deleteCJoin(cno);
		
		return "redirect:/mypage/myClubJoin";
	}

	//main에 표시될 가장 많이 찜한 상위 4개 운동 모임
	@GetMapping("/main")
	public String mainCPickTop4(Model model) {
		
		ArrayList<ClubDto> list = myCBoardService.selectCPickTop4();
		
		model.addAttribute("list", list);
		
		return "main";
	}
	
	
}
