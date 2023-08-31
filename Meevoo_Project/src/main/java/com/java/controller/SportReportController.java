package com.java.controller;

import java.util.ArrayList;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.java.dto.SportDto;
import com.java.dto.SportReportDto;
import com.java.dto.SportReviewAnswerDto;
import com.java.dto.SportReviewDto;
import com.java.service.SportReportService;

@Controller
public class SportReportController {
	
	@Autowired
	SportReportService sportReportService;
	
	@RequestMapping("/sportreport/sportReportList")
	public String sportReportList(@RequestParam(defaultValue ="1")int page,
			String category,String srep_word,Model model) {
		
		// 문의글 전체 가져오기
		HashMap<String,Object> map = sportReportService.selectAll(page,category,srep_word);
		model.addAttribute("list", map.get("list"));
		
		model.addAttribute("page", map.get("page"));
		model.addAttribute("listCount", map.get("listCount"));
		model.addAttribute("startPage", map.get("startPage"));
		model.addAttribute("endPage", map.get("endPage"));
		model.addAttribute("maxPage", map.get("maxPage"));
		model.addAttribute("category", map.get("category"));
		model.addAttribute("srep_word", map.get("srep_word"));
		
		return "/sportreport/sportReportList";
	}
	
	
	@RequestMapping("/sportreport/sportReportListView")
	public String sportReportListView(@RequestParam(defaultValue = "1") int srepno, 
			@RequestParam(defaultValue = "1") int page, String category, String srep_word, Model model) {

		// 문의글 1개 가져오기
		HashMap<String, Object> map = sportReportService.selectOne(srepno);
		model.addAttribute("srdto", map.get("srdto"));
		
		//답변 전체 가져오기
		ArrayList<SportReviewAnswerDto> sreanList = sportReportService.selectAnAll(srepno); 
		model.addAttribute("sreanList", sreanList);
		
		
		model.addAttribute("category", category);
		model.addAttribute("srep_word", srep_word);
		model.addAttribute("page", page);

		return "/sportreport/sportReportListView";
	} // sportReportListView
	
	
	@GetMapping("/sportreport/sportReportWrite")
	public String sportReportWrite(Model model) {
		
		ArrayList<SportDto> list = new ArrayList<>();

		// 문의글 작성으로 인한 시설번호 전체 가져오기
		list = sportReportService.selectSfno();
		model.addAttribute("list", list);
		
		return "sportreport/sportReportWrite";
	} // sportReportWrite
	
	
	@PostMapping("/sportreport/sportReportWrite")
	public String sportReportWrite(SportReportDto srDto,
		List<MultipartFile> files, Model model) {
		//문의글 1개저장
		sportReportService.insertOne(srDto,files);
		String result="i_success";
		System.out.println(srDto.getSrepdate());
		System.out.println(srDto.getSrepno());
		System.out.println(srDto.getSreptitle());
		
		return "redirect:/sportreport/sportReportList?result="+result;
	} // sportReportWrite
	
	
	@GetMapping("/sportreport/sportReportUpdate")  //수정 창 보여주기
	public String sportReportUpdate(int srepno,
		int page, String category, String srep_word, Model model) {
		
		HashMap<String, Object> map = sportReportService.selectOne(srepno);
		model.addAttribute("srdto", map.get("srdto"));
		
		ArrayList<SportDto> list = new ArrayList<>();

		// 문의글 작성으로 인한 시설번호 전체 가져오기
		list = sportReportService.selectSfno();
		model.addAttribute("list", list);
		
		model.addAttribute("srepno", srepno);
		model.addAttribute("category", category);
		model.addAttribute("srep_word", srep_word);
		model.addAttribute("page", page);
		return "sportreport/sportReportUpdate";
	} //sportReportUpdate
	
	
	@PostMapping("/sportreport/sportReportUpdate") // sportReportUpdate 저장
	public String sportReportUpdate(SportReportDto srDto,
		List<MultipartFile> files, Model model) {
		// 수정 내용 저장되는가
//		System.out.println("sportReportUpdate : "+srDto.getSrepinput());
//		System.out.println("sportReportUpdate : "+srDto.getSrepno());
		//문의글 1개 수정 저장
		sportReportService.updateOne(srDto,files);
		String result="i_success";
		
		return "redirect:/sportreport/sportReportList?result="+result;
	} // sportReportUpdate
	
	
	
	@RequestMapping("/sportreport/sportReportListDelete")
	public String sportReportList(int srepno) {
		System.out.println("sportReportList srepno :" + srepno);

		// 문의글 삭제하기
		sportReportService.deleteOne(srepno);
		return "redirect:sportReportList";
	}// boardDelete
	
	
	@RequestMapping("/sportreport/answerInsert")
	@ResponseBody //데이터로 리턴해서 가져와라
	public SportReviewAnswerDto answerInsert(SportReviewAnswerDto srepanDto) {
		System.out.println("등록 ajax에서 넘어온 아이디 : "+srepanDto.getId());
		System.out.println("등록 ajax에서 넘어온 답변번호 : "+srepanDto.getSrepanno());
		System.out.println("등록 ajax에서 넘어온 문의글번호 : "+srepanDto.getSrepno());
		System.out.println("등록 ajax에서 넘어온 답변 데이터 : "+srepanDto.getSrepancontent());

		//답변 저장, 1개 가져오기
		SportReviewAnswerDto srepandto = sportReportService.answerInsert(srepanDto);
		
		return srepandto;
	} //answerInsert
	
	
	@RequestMapping("/sportreport/answerDelete")
	@ResponseBody //데이터로 리턴해서 가져와라
	public String answerDelete(int srepanno) {
		System.out.println("ajax 넘어온 데이터 : "+srepanno);
		
		//답변 1개 삭제하기
		sportReportService.answerDelete(srepanno);
		System.out.println(srepanno);
		
		String result = "success";
		return result;
	} //answerDelete
	
	
	
	

}
