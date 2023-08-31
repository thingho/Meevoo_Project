package com.java.controller;

import java.io.File;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.java.dto.MemberDto;
import com.java.service.MemberService;

@Controller
public class MypageController {

	@Autowired MemberService memberService;
	
	@Autowired
	HttpSession session;
	
	//내 정보 페이지-1명의 회원정보 가져오기
	@RequestMapping("/mypage/myProfil")
	public String myProfil(String id, Model model) {
		
		if(session.getAttribute("sessionId")==null) {
			return "member/login";
		}
		
		//String test = (String) session.getAttribute("sessionId");
		//System.out.println(test);
		id=(String) session.getAttribute("sessionId");
		
		//System.out.println("id: "+id);
		//멤버 정보 1개 가져오기
		MemberDto mdto = memberService.selectMemOne(id);

		//운동 리스트 select에 표시하기
		String[] scate = memberService.selectscateAll();
		for(int i=0;i<scate.length;i++) {
			//System.out.println("scate : "+scate[i]);
		}

		model.addAttribute("mdto", mdto);
		model.addAttribute("scate", scate);
		
		return "mypage/myProfil";
	}
	
	//내 정보 수정 페이지
	@RequestMapping("/mypage/myProfilEdit")
	public String myProfilEdit(String id, MemberDto memberDto, Model model) {
		
		//로그인 했을 경우에만 마이페이지 수정 열 수 있도록
		if(session.getAttribute("sessionId")==null) {
			return "member/login";
		}
		//sessionId 가져오기
		id = (String) session.getAttribute("sessionId");

		//아이디로 회원 정보 가져오기
		MemberDto mdto = memberService.selectMemOne(id);
		
		
		model.addAttribute("mdto", mdto);
		
		return "mypage/myProfilEdit";
	}
	
	//회원정보 수정 저장
	@RequestMapping("/mypage/updateSaveUser")
	public String updateSaveUser(MemberDto memberDto,
			MultipartFile file) throws Exception {
		
		System.out.println("MypageController img11 : "+memberDto.getUserimg());
		//이미지 파일 있을 경우 저장
		String fileName = "";
		if(!file.isEmpty()) {
			
			String ori_fileName = file.getOriginalFilename(); //실제 파일 이름
			UUID uuid = UUID.randomUUID(); //랜덤숫자생성
			fileName = uuid + "_" + ori_fileName; //변경파일이름 - 중복방지
			String uploadUrl = "c:/upload/"; //파일업로드 위치
			File f = new File(uploadUrl+fileName);
			file.transferTo(f); //파일 저장
			memberDto.setUserimg(fileName);
		}else {
			
		}
		
		System.out.println("MypageController img22 : "+memberDto.getUserimg());
		
		//회원정보 수정 저장
		memberService.updateSaveUser(memberDto);
		
		return "redirect:/mypage/myProfil";
	}


	
}
