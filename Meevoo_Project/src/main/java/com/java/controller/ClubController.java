package com.java.controller;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.java.dto.CListCurrDto;
import com.java.dto.ClubDto;
import com.java.dto.ClubDto2;
import com.java.dto.ClubJoinUserDto;
import com.java.dto.ClubPickDto;
import com.java.dto.PageDto;
import com.java.service.ClubService;
import com.java.service.ClubWriteSearchSFService;

@Controller
public class ClubController {

	@Autowired ClubService clubService;
	@Autowired ClubWriteSearchSFService clubWriteSearchSFService;
	@Autowired HttpSession session;

	@RequestMapping("/club/club")
	public String club(@RequestParam(defaultValue = "none") String result,  //저장값이 없으면 none, 성공하면 1
			PageDto pageDto, ClubDto2 clubDto2, Model model) {
		String id = (String) session.getAttribute("sessionId");
		System.out.println("/club/club 페이지 방문");

		// 모임목록 전체 가져오기
		HashMap<String, Object> map = clubService.selectClubAll(pageDto);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("pageDto", map.get("pageDto"));
		model.addAttribute("result", result); //파일저장 결과변수
		if (id == null) {
			// 모임목록 추천 가져오기 1. 로그인 전, 찜하기 많고, 최근 게시글 중 모집중인 모임목록 2개
			ArrayList<ClubDto2> recsLogoutList = clubService.selectClubRecsLogout();
			model.addAttribute("recsList", recsLogoutList);
		} else {
			// 모임목록 추천 가져오기 2. 로그인한 사람의 관심지역, 관심종목과 일치하는 모집중인 모임목록 2개
			ArrayList<ClubDto2> recsLoginList = clubService.selectClubRecsLogin(id);
			model.addAttribute("recsList", recsLoginList);
		}
		return "club/club";
	}
	
	@PostMapping("/club/cFilterAjax")
	@ResponseBody //데이터로 넘겨줌
	public ArrayList<ClubDto2>  cFilterAjax(ClubDto2 clubDto2, PageDto pageDto, int dateDifference, Model model) {
		
		//필터 input 반영해서 모임목록 가져오기 (필터검색)
		ArrayList<ClubDto2> filterList = clubService.selectClubFilter(clubDto2);
		model.addAttribute("filteredClubList", filterList);
		
		return filterList;
	}
	

	@RequestMapping("/club/cView")
	public String cView(@RequestParam(defaultValue = "1")int cno, @RequestParam(defaultValue = "1")int page,
			CListCurrDto ccurrdto, PageDto pageDto,Model model) {
		
		// 모임목록 1개 가져오기
		HashMap<String, Object> map = clubService.selectClubOne(cno);
		model.addAttribute("cdto", map.get("cdto"));
		// pageDto 설정
		model.addAttribute("pageDto", map.get("pageDto"));
		
		// 클럽 가입 목록 전체 가져오기
		ArrayList<ClubJoinUserDto> cjoinList = clubService.selectcjAll(cno); 
		model.addAttribute("cjoinList", cjoinList);
		
		// 해당 클럽에 가입 한 총 인원수
		int cnowTotal = clubService.updateClubAll(cno);
		model.addAttribute("cnowTotal", cnowTotal);
		
		// 클럽 가입한 아이디 Count(cno,sessionId)
		String id = (String)session.getAttribute("sessionId");
		if(id != null) {
			int cjoincount = clubService.selectcjCount(cno,id); 
			model.addAttribute("cjoincount", cjoincount);
		}
		System.out.println("controller id :"+id);
		System.out.println("controller cno :"+cno);
		
		//지원----------------------------------
		
		//최근본 모임 게시물 데이터 기록하기
		//세션 아이디 저장
		//id = (String)session.getAttribute("sessionId");
		System.out.println("ClubController id : "+id);
		
		//아이디 있을때 Dto에 저장
		if(id!=null) {
			session.setAttribute("sessionId", id);
			ccurrdto.setId(id);
		}else {
			return "member/login";
		}
		
		clubService.insertCCurr(ccurrdto);
		
		//data_value 변수 값 가져오기 0:찜을 하지 않은 경우, 1:찜을 한경우
		// 찜 변수 select count(*) as data_value from clubpick where id='born' and cno=500
		if(id!=null) {
			int data_value = clubService.countCPick(cno, id);
			model.addAttribute("data_value", data_value);
		}
		//----------------------------------지원
		
		return "club/cView";
	}
	
	//지원--------------------------------------------------
	//운동모임 찜하기
	@RequestMapping("/club/clubPick")
	@ResponseBody
	public int clubPick(ClubPickDto cpickdto, Model model) {
		
		clubService.clubPick(cpickdto);
		
		System.out.println("등록 ajax에서 넘어온 cpickno : "+cpickdto.getCpickno());
		
		return cpickdto.getCpickno();
	}
	
	//운동모임 찜하기 취소(삭제)하기
	@RequestMapping("/club/clubPickCancel")
	@ResponseBody
	public ClubPickDto clubPickCancel(@Param(value = "none") ClubPickDto cpickdto, int cno, String id) {
		
		//System.out.println("등록 ajax에서 넘어온 cpickno : "+cno);
		clubService.clubPickCancel(cno,id);
		
		return cpickdto;
	}
	
	//Clublist 총 찜 개수 수정
	@RequestMapping("/club/updateCTotalPick")
	public String updateCTotalPick() {
		return "club/updateCTotalPick";
	}
	
	//--------------------------------------------------지원
	
	
	@RequestMapping("/club/clubJoinUser")
	@ResponseBody //데이터로 리턴해서 가져와라
	public ClubJoinUserDto cjoinUser(ClubJoinUserDto cjoinuserDto,Model model) {
		// 모임 신청하기
		ClubJoinUserDto cjudto = clubService.cjoinUser(cjoinuserDto);
		return cjudto;
	}
	

	
	@GetMapping("/club/cWrite")
	public String cWrite() {
		
		return "club/cWrite";
	}
	
	
	@PostMapping("/club/cWrite") 
	public String doCWrite(ClubDto2 cdto, @RequestPart MultipartFile file, Model model) throws Exception { 
		//String id = (String)session.getAttribute("sessionId");
		
		//사진 1개 저장
		String fileName="";
		
		System.out.println("doCWrite getCdodate_date2 : "+cdto.getCdodate_date2());
		System.out.println("doCWrite getCdodate_time2 : "+cdto.getCdodate_time2()); //String타입으로 받음.
		
		//String타입 -> 날짜타입으로 변경
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
		Date date = formatter.parse(cdto.getCdodate_date2());
		cdto.setCdodate_date(date);
		System.out.println("doCWrite setCdodate_date : "+cdto.getCdodate_date()); //String타입으로 받음.
		
		//String타입 -> 날짜와 시간타입으로 변경
		SimpleDateFormat formatter2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date dateTime = formatter2.parse(cdto.getCdodate_date2()+" "+cdto.getCdodate_time2()+":00");
		cdto.setCdodate_time(dateTime); //String타입으로 받은 것을 Date 타입으로 변환 (yyyy-MM-dd HH:mm:ss)
		System.out.println("doCWrite setCdodate_time : "+cdto.getCdodate_time()); //String타입으로 받음.
		
		System.out.println(date); //
		
		//파일이 있을경우 파일저장
		if(!file.isEmpty()) {
			String ori_fileName = file.getOriginalFilename();//실제파일이름
			UUID uuid = UUID.randomUUID(); //랜덤숫자생성
			fileName = uuid+"_"+ori_fileName; //변경파일이름 - 중복방지
			String uploadUrl = "c:/upload/"; //파일업로드위치
			File f = new File(uploadUrl+fileName);
			file.transferTo(f); //파일저장시킴
		}//if
		
		cdto.setCimg(fileName); //cdto에 fileName이름 저장
		//모임목록 글 1개 저장
		clubService.insertClub(cdto);
		return "redirect:/club/club"; 
	}
	 
	
	@RequestMapping("/club/cWriteSearchSF")
	public String cWriteSearchSF(PageDto pageDto, ClubDto clubDto, Model model) {
		
		//운동모임장소 찾기 체육시설 목록 전체 가져오기
		HashMap<String,Object> map = clubWriteSearchSFService.selectClubSearchSFAll(pageDto);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("pageDto", map.get("pageDto"));
		
		return "club/cWriteSearchSF";
	}
	
	@RequestMapping("/club/cWriteSearchSF_update")
	public String cWriteSearchSF_update(PageDto pageDto, ClubDto clubDto, Model model) {
		
		//운동모임장소 찾기 체육시설 목록 전체 가져오기
		HashMap<String,Object> map = clubWriteSearchSFService.selectClubSearchSFAll(pageDto);
		model.addAttribute("list", map.get("list"));
		model.addAttribute("pageDto", map.get("pageDto"));
		
		return "club/cWriteSearchSF_update";
	}
	
	@PostMapping("/club/cUpdate2") //cUpdate 저장 
	public String doCUpdate(ClubDto2 cdto, @RequestPart MultipartFile file,
			Model model) throws Exception {
		
		System.out.println("aaaa doCUpdate cdto cno : "+cdto.getCno());
		System.out.println("aaaa doCUpdate cdto cnm : "+cdto.getCnm());
		//System.out.println("doCUpdate cdto cimg : "+cdto.getCimg());
		//System.out.println("doCUpdate cdto file : "+file.getOriginalFilename());
		
		//모임글 1개 수정
		String fileName="";
		//파일이 있을경우 파일저장
		if(!file.isEmpty()) {
			String ori_fileName = file.getOriginalFilename();//실제파일이름
			UUID uuid = UUID.randomUUID(); //랜덤숫자생성
			fileName = uuid+"_"+ori_fileName; //변경파일이름 - 중복방지
			String uploadUrl = "c:/upload/"; //파일업로드위치
			File f = new File(uploadUrl+fileName);
			file.transferTo(f); //파일저장시킴
			cdto.setCimg(fileName); //cdto에 fileName이름 저장
		}//if
		
		//모임목록 글 1개 저장 
		clubService.updateClub(cdto);
		return "redirect:/club/club"; 
	}
	
	@GetMapping("/club/cUpdate") //cUpdate View
	public String cUpdate(int cno, Model model) {
		System.out.println("aaaa cUpdate cno : "+cno);
		ClubDto2 cdto = clubService.selectOne(cno);
		model.addAttribute("cdto",cdto);
		return "club/cUpdate";
	}
	
	@RequestMapping("/club/cDelete")
	public String cDelete(int cno) {
		System.out.println("cDelete : "+cno);
		clubService.deletOne(cno);
		return "redirect:/club/club";
	}

	@RequestMapping("/club/cMEvaluation")
	public String cMEvaluation() {
		return "club/cMEvaluation";
	}

	@RequestMapping("/club/cSRSuggestion")
	public String cSRSuggestion() {
		return "club/cSRSuggestion";
	}
	

}
