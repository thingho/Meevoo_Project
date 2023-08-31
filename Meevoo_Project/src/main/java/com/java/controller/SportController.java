package com.java.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.java.dto.SListCurrDto;
import com.java.dto.SportDto;
import com.java.dto.SportPickDto;
import com.java.dto.SportReportDto;
import com.java.dto.SportReviewDto;
import com.java.dto.SportReviewReportDto;
import com.java.service.SportService;

@Controller
public class SportController {

	@Autowired SportService sportService;
	@Autowired HttpSession session;
	
	
	@RequestMapping("/sport/sportList")
	public String sportList(@RequestParam(defaultValue ="1")int page,
			String slist_word,Model model,
			SportDto sportDto) {
		
		if(sportDto.getSports() != null) { // 체크박스 배열에 값 들어오면
			sportDto.setSport(String.join("|",sportDto.getSports()));
			// locString에 스트링 하나로 변환
			// locString을 MyBatis 매개변수로 전달
		}
		if(sportDto.getDong() != null) { // 체크박스 배열에 값 들어오면
			sportDto.setDong_one(String.join("|",sportDto.getDong()));
			// locString에 스트링 하나로 변환
			// locString을 MyBatis 매개변수로 전달
		}
		System.out.println(sportDto);

		// 게시글 전체 가져오기
		HashMap<String,Object> map = sportService.selectAll(page,slist_word,sportDto);
		model.addAttribute("list", map.get("list"));
		
		model.addAttribute("page", map.get("page"));
		model.addAttribute("listCount", map.get("listCount"));
		model.addAttribute("startPage", map.get("startPage"));
		model.addAttribute("endPage", map.get("endPage"));
		model.addAttribute("maxPage", map.get("maxPage"));
		
		// 검색필터
		model.addAttribute("slist_word", map.get("slist_word"));
		model.addAttribute("sportDto", map.get("sportDto"));
		
		return "/sport/sportList";
	} // sportList
	
	
	@RequestMapping("/sport/sportListView")
	public String sportListView(@RequestParam(defaultValue = "1") int sfno,
			@RequestParam(defaultValue = "1")int page,
			String slist_word,
			SListCurrDto scurrdto,Model model) {

		// 게시글 1개 가져오기
		HashMap<String, Object> map = sportService.selectOne(sfno);
		model.addAttribute("sdto", map.get("sdto"));
		
		//하단 댓글 전체 가져오기
		ArrayList<SportReviewDto> sreList = sportService.selectReAll(sfno); 
		model.addAttribute("sreList", sreList);
		
		// 찜하기 목록 전체 가져오기
		ArrayList<SportPickDto> spickList = sportService.selectSpAll(sfno); 
		model.addAttribute("spickList", spickList);
		
		// 별점 총 갯수
		int srestarTotal = sportService.updateStarAll(sfno); 
		model.addAttribute("srestarTotal", srestarTotal);
		
		// 리뷰 총 갯수
		int srepeoTotal = sportService.updatePeoAll(sfno); 
		model.addAttribute("srepeoTotal", srepeoTotal);
		
		// 찜 Count(sfno,sessionId)
		String id = (String)session.getAttribute("sessionId");
		if(id != null) {
			int spickcount = sportService.selectSpCount(sfno,id); 
			model.addAttribute("spickcount", spickcount);
		}
		System.out.println("controller id :"+id);
		System.out.println("controller sfno :"+sfno);
		
		model.addAttribute("page", page);
		
		//검색 필터
		model.addAttribute("slist_word", slist_word);
		
		
		//최근본 시설 게시물 데이터 기록하기
		//아이디 있을때 Dto에 저장
		if(id!=null) {
			session.setAttribute("ssessionId", id);
			scurrdto.setId(id);
		} else {
			return "/sport/sportListView";
		}
		sportService.insertSCurr(scurrdto);
		
		return "/sport/sportListView";
	} // sportListView
	
	
	@RequestMapping("/sport/sportPick")
	@ResponseBody //데이터로 리턴해서 가져와라
	public SportPickDto sportPick(SportPickDto spickDto, Model model) {
		
		// 1. 찜하기 등록
		SportPickDto spdto = sportService.sportPick(spickDto);
		
		System.out.println("등록 ajax에서 넘어온 아이디 : "+spickDto.getId());
		System.out.println("등록 ajax에서 넘어온 시설번호 : "+spickDto.getSfno());
		System.out.println("등록 ajax에서 넘어온 spickyn : "+spickDto.getSpickyn());
		return spdto;
	}
	
	@RequestMapping("/sport/sportPickCancel")
	@ResponseBody //데이터로 리턴해서 가져와라
	public SportPickDto sportPickCancel(int spickno) {
		
		// 2. 찜하기 취소
		sportService.sportPickCancel(spickno);
		System.out.println("ajax 넘어온 데이터 : "+spickno);
		
		return null;
	}
	
	
	
	
	@RequestMapping("/sport/reviewInsert")
	@ResponseBody //데이터로 리턴해서 가져와라
	public SportReviewDto reviewInsert(SportReviewDto sreDto) {
		System.out.println("등록 ajax에서 넘어온 아이디 : "+sreDto.getId());
		System.out.println("등록 ajax에서 넘어온 리뷰번호 : "+sreDto.getSreno());
		System.out.println("등록 ajax에서 넘어온 시설번호 : "+sreDto.getSfno());
		System.out.println("등록 ajax에서 넘어온 리뷰 데이터 : "+sreDto.getSrecontent());
		System.out.println("등록 ajax에서 넘어온 별점 : "+sreDto.getSstar());

		//하단리뷰 저장, 1개 가져오기
		SportReviewDto sreviewdto = sportService.reviewInsert(sreDto);
		
		return sreviewdto;
	} //reviewInsert
	
	@RequestMapping("/sport/reviewUpdateSave") //수정한 리뷰 저장
	@ResponseBody //데이터로 리턴해서 가져와라
	public SportReviewDto reviewUpdateSave(SportReviewDto sreDto) {
		
		//수정한 하단 리뷰 저장
		SportReviewDto sreviewdto = sportService.reviewUpdateSave(sreDto);
		return sreviewdto;
	} //reviewUpdateSave 
	
	
	@RequestMapping("/sport/reviewDelete")
	@ResponseBody //데이터로 리턴해서 가져와라
	public String reviewDelete(int sreno) {
		System.out.println("ajax 넘어온 데이터 : "+sreno);
		
		//하단 리뷰 1개 삭제하기
		sportService.reviewDelete(sreno);
		System.out.println(sreno);
		
		String result = "success";
		return result;
	} //reviewDelete
	
	
	@GetMapping("/sport/sportReviewReport")
	public String sportReviewReport(Model model) {
		
		return "sport/sportReviewReport";
	} // sportReviewReport
	
	
	@PostMapping("/sport/sportReviewReport")
	public String sportReportWrite(SportReviewReportDto srerepDto, Model model) {
		
		System.out.println("SportController 리뷰 작성자 : "+srerepDto.getId());
		System.out.println("SportController 리뷰 번호 : "+srerepDto.getSreno());
		System.out.println("SportController 리뷰 신고 유형 : "+srerepDto.getSrerepcontent());
		System.out.println("SportController 리뷰 신고글 : "+srerepDto.getSrerepinput());
		System.out.println("SportController 리뷰 신고글 이미지 : "+srerepDto.getSrerepimg());
		// 리뷰글에 대한 신고글 1개 작성
		sportService.insertReportOne(srerepDto);
		
		return "redirect:/sport/sportList";
	} // sportReviewReport
	

}
