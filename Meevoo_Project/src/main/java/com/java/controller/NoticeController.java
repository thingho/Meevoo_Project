package com.java.controller;

import java.io.File;

import java.util.ArrayList;
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
import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.databind.ser.std.StdKeySerializers.Default;
import com.java.dto.FAQDto;
import com.java.dto.MemberDto;
import com.java.dto.NoticeDto;
import com.java.dto.PageDto;
import com.java.dto.QnADto;
import com.java.dto.SearchDto;
import com.java.service.NoticeService;

@Controller
public class NoticeController {

	@Autowired HttpSession session;
	@Autowired NoticeService noticeService;
	
//== 공지사항 notice ================================================================================
	
// 1. 전체 회원 하단 넘버링 notice/notice -------------------------------------------------------------------
		@RequestMapping("/notice/notice")
		public String notice(@RequestParam(defaultValue = "1")int page, Model model) {
			
			//게시글 전체가져오기
			HashMap<String, Object> map = noticeService.selectNoticeAll(page);
			model.addAttribute("nlist",map.get("nlist"));
			model.addAttribute("page",map.get("page"));
			model.addAttribute("listCount",map.get("listCount"));
			model.addAttribute("startPage",map.get("startPage"));
			model.addAttribute("endPage",map.get("endPage"));
			model.addAttribute("maxPage",map.get("maxPage"));
			model.addAttribute("pageDto",map.get("pageDto"));
		
			return "notice/notice";
		}	
	
// 2. 공지사항 불러오기 : notice/noticeView
	@RequestMapping("/notice/noticeView")
	public String boardView(@RequestParam(defaultValue = "1") int notino,@RequestParam(defaultValue = "1") int page,Model model) {
		HashMap<String, Object> map = noticeService.selectNoticeOne(notino);
		//게시글 1개 가져오기
		model.addAttribute("ndto",map.get("ndto"));
		model.addAttribute("page",page);
		return "notice/noticeView";
	}	

// 2. 공지사항 새로 추가하기------------------------------------------------------------------

// 1) 공지사항 추가하기
	//noticeWrite에서 dto가져오기(번호때문에)
	@GetMapping("/notice/noticeWrite")
	public String noticeWrite() {
		return "notice/noticeWrite";
	}
	
// 2) 추가한 공지사항 저장하기
	@PostMapping("/notice/noticeWrite")
	public String noticeWrite(NoticeDto ndto, @RequestPart(required = false) MultipartFile files, Model model) {
		//게시글 1개 저장
		noticeService.insertNotice(ndto,files);
		String result = "i_success";
		return "redirect:/notice/notice?result="+result;
	}
	
// 3. 공지사항 수정하기------------------------------------------------------------------
	// 1) 수정할 공지사항 불러오기
		@GetMapping("/notice/noticeModify")
		public String noticeModify(int notino, Model model) {
			NoticeDto ndto = noticeService.selectNMOne(notino);
			model.addAttribute("ndto",ndto);
			return "notice/noticeModify";
		}	
	
	// 2) 공지사항 수정사항 저장하기------------------------------------------------------------------
		@PostMapping("/notice/noticeModify")
		public String donoticeModify(NoticeDto ndto, @RequestPart(required = false) MultipartFile file, int notino, Model model) throws Exception{
			
			//System.out.println("noticeModify ndto :  " + ndto.getNotino());
			//System.out.println("noticeModify ndto :  " + ndto.getNotiimg());
			//System.out.println("noticeModify file :  " + file.getOriginalFilename());
			
			//게시글 1개 저장하기
			String fileName = "";
			
			//파일이 있을 경우 파일저장하기
			if(!file.isEmpty()) {
				//실제 파일 이름
				String ori_fileName = file.getOriginalFilename();
				UUID uuid = UUID.randomUUID();  //랜덤숫자생성하기
				fileName = uuid + "_" + ori_fileName;  //변경된 파일 이름 - 중복방지를 위해서 
				String uploadUrl = "c:/upload/";       //파일업로드 위치
				File f = new File(uploadUrl + fileName);
				file.transferTo(f);   //파일저장시킴
				ndto.setNotiimg(fileName);
			}//if
			noticeService.updateNMOne(ndto,file);
			
			return "redirect:/notice/notice"; 
		}
// 4. 공지사항 삭제하기 ------------------------------------------------------------------	
	@RequestMapping("/notice/noticeDelete")
	public String noticeDelete(int notino) {
		//System.out.println("boardDelete : "+bno);
		noticeService.deleteOne(notino);
		return "redirect:notice";
	}	
	
	
//== 자주물어본 질문 FAQ ================================================================================

// 1. 전체 FAQ 하단 넘버링  -------------------------------------------------------------------
	@RequestMapping("/notice/FAQ")
	public String FAQ(PageDto pageDto1, Model model) {
		
		//게시글 전체가져오기
		HashMap<String, Object> map1 = noticeService.selectFAQAll(pageDto1);
		model.addAttribute("faqlist",map1.get("faqlist"));
		//model.addAttribute("pageDto1",map1.get("pageDto1"));
		model.addAttribute("page",map1.get("page"));
		model.addAttribute("listCount",map1.get("listCount"));
		model.addAttribute("startPage",map1.get("startPage"));
		model.addAttribute("endPage",map1.get("endPage"));
		model.addAttribute("maxPage",map1.get("maxPage"));
		//System.out.println("controller endPage"+map1.get("endPage"));
		
		return "notice/FAQ";
	}	
// 2. FAQ 새로 추가하기------------------------------------------------------------------
	// 1) FAQ 추가하기
		@GetMapping("/notice/FAQWrite")
		public String FAQWrite() {
			return "notice/FAQWrite";
		}
	// 2) 추가한 FAQ 저장하기
		@PostMapping("/notice/FAQWrite")
		public String FAQWrite(FAQDto fdto, Model model) {
			//게시글 1개 저장
			noticeService.insertFAQ(fdto);
			String result = "i_success";
			return "redirect:/notice/FAQ?result="+result;
		}
	
// 3. FAQ 수정하기------------------------------------------------------------------
	// 1) 수정할 FAQ 불러오기
		@GetMapping("/notice/FAQModify")
		public String FAQModify(int faqno, Model model) {
			FAQDto fdto = noticeService.selectFMOne(faqno);
			model.addAttribute("fdto",fdto);
			return "notice/FAQModify";
		}		
	
	// 2) FAQ 수정사항 저장하기------------------------------------------------------------------
		@PostMapping("/notice/FAQModify")
		public String doFAQModify(FAQDto fdto, int faqno, Model model) throws Exception{
			
			noticeService.updateFMOne(fdto);
			
			return "redirect:/notice/FAQ"; 
		}
	
// 4. FAQ 삭제하기 ------------------------------------------------------------------	
	@RequestMapping("/notice/FAQDelete")
	public String FAQDelete(int faqno) {
		noticeService.deleteFAQOne(faqno);
		return "redirect:FAQ";
	}	
	
	
//== QnA ==================================================================================	
	
// 1. 전체 QnA 하단 넘버링  -------------------------------------------------------------------
	@RequestMapping("/notice/QnA")
	public String QnA(PageDto pageDto,  SearchDto search, Model model) {
		
		//게시글 전체가져오기
		HashMap<String, Object> map2 = noticeService.selectQnAAll(pageDto, search);
		model.addAttribute("qnalist",map2.get("qnalist"));
		model.addAttribute("pageDto",map2.get("pageDto"));
		model.addAttribute("page",map2.get("page"));
		model.addAttribute("listCount",map2.get("listCount"));
		model.addAttribute("startPage",map2.get("startPage"));
		model.addAttribute("endPage",map2.get("endPage"));
		model.addAttribute("maxPage",map2.get("maxPage"));
		model.addAttribute("category",map2.get("category"));
		model.addAttribute("search_input",map2.get("search_input"));
	
		return "notice/QnA";
	}
	
// 2. QnA 불러오기 : notice/QnAView
	@RequestMapping("/notice/QnAView")
	public String QnAView(@RequestParam(defaultValue = "1") int qnano,@RequestParam(defaultValue = "1") int page,Model model) {
		HashMap<String, Object> map2 = noticeService.selectQnAOne(qnano);
		//게시글 1개 가져오기
		model.addAttribute("qdto",map2.get("qdto"));
		model.addAttribute("page",page);
		return "notice/QnAView";
	}	
	
// 3. QnA 새로 추가하기------------------------------------------------------------------
	// 1) QnA 추가하기
		@GetMapping("/notice/QnAWrite")
		public String QnAWrite() {
			return "notice/QnAWrite";
		}
	// 2) 추가한 QnA 저장하기
		@PostMapping("/notice/QnAWrite")
		public String QnAWrite(QnADto qdto, Model model) {
			//게시글 1개 저장
			noticeService.insertQnA(qdto);
			String result = "i_success";
			return "redirect:/notice/QnA?result="+result;
		}	
	
// 4. QnA 삭제하기 ------------------------------------------------------------------	
		@RequestMapping("/notice/QnADelete")
		public String QnADelete(int qnano) {
			//System.out.println("boardDelete : "+bno);
			noticeService.deleteQnAOne(qnano);
			return "redirect:QnA";
		}	
	
// 5. QnA 답변달기- 불러오기
		@GetMapping("/notice/QnAReply")
		public String QnAReply(int qnano,Model model) {
			HashMap<String, Object> map3 = noticeService.selectQROne(qnano);
			model.addAttribute("qdto",map3.get("qdto"));
			//System.out.println("controller qgroup:"+map3.get("qgroup"));
			return "notice/QnAReply";
		}
	
// 6. QnA 답글달기 - 저장
		@PostMapping("/notice/QnAReply") 
		public String doQnAReply(QnADto qdto, Model model) throws Exception {

			noticeService.doQnAReply(qdto);
			return "redirect:QnA";
		}
		
	
	
	
	
	
	
	
	
	
	












}
