package com.java.controller;

import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.java.dto.MemberDto;
import com.java.service.MemberService;

@Controller
public class MemberController {

	@Autowired
	MemberService memberService;
	
	@Autowired
	HttpSession session;
	
	@GetMapping("/member/login")
	public String login() {
		return "member/login";
	}


	@PostMapping("/member/login") //login 체크!!!
	public String login(MemberDto memberDto, Model model) {
		
		//System.out.println("memberDto1 ID : "+memberDto.getId());
		//System.out.println("memberDto2 PW : "+memberDto.getPw());
		//System.out.println("memberDto2 PW : "+memberDto.getNicknm());
		MemberDto mdto = memberService.selectLogin(memberDto);
		
			if(mdto!=null && mdto.getNowjoin() == 1) {   //현재 상태 1 : 가입// 현재 상태 0 : 탈퇴
				
					if(mdto.getId().equals("admin")) {
						session.setAttribute("sessionId", mdto.getId()); //sessionId
						session.setAttribute("sessionName", mdto.getUsernm());
						session.setAttribute("sessionNicknm", mdto.getNicknm());
						return "/main";
					}else {
						session.setAttribute("sessionId", mdto.getId()); //sessionId
						session.setAttribute("sessionName", mdto.getUsernm());
						session.setAttribute("sessionNicknm", mdto.getNicknm());
					}
						
			}else {
				model.addAttribute("loginCheck", "fail");
				//String loginCheck="fail"; 과 같은 구문(그런데 웹에서는 안되서 java에서는 안됨)
				//loginCheck라는 변수에 fail 값을 넣어줌
				return "/member/login";
			}
			
						
		return "redirect:/main";
	}
	
	//로그아웃 시
	@RequestMapping("/member/logout")
	public String logout() {
		session.invalidate();
		
		return "redirect:/main";
	}

	@GetMapping("/member/join")
	public String join(Model model) {
		//운동 종목 select에 데이터 가져오기
		String[] scate = memberService.selectscateAll();
		String[] dongcate = memberService.selectdongcateAll();
		
		for(int i=0;i<scate.length;i++) { 
			//System.out.println("scate : "+scate[i]);
		} 

		for(int i=0;i<dongcate.length;i++) { 
			//System.out.println("dongcate : "+dongcate[i]);
		} 
		
		model.addAttribute("scate", scate);
		model.addAttribute("dongcate", dongcate);
		
		return "member/join";
	}
	
	//회원가입시 입력한 정보 저장
	@PostMapping("/member/join")
	public String join(MemberDto memberDto, MultipartFile file, Model model) throws Exception {
		//System.out.println("MemberController id : "+memberDto.getId());
		 
		//회원가입시 입력한 정보 저장
		memberService.insertMem(memberDto, file); 
		String result = "mem_success";
		
		
		return "redirect:/main";
		/* return "member/join"; */
	}
	
	//id 중복체크
	@GetMapping("/member/idcheck")
	@ResponseBody
	public String idcheck(String id, Model model) {
		String result = "";
		MemberDto mdto = memberService.selectIdOne(id);
		if(mdto!=null) {
			result="fail";
		}else {
			result="success";
		}
		
		return result;
	}

	//가입약관 동의하기
	@RequestMapping("/member/agree")
	public String agree() {
		return "member/agree";
	}

	//회원 탈퇴하기
	@RequestMapping("/member/deleteUser")
	public String deleteUser(String id) {

		//회원 탈퇴
		memberService.deleteUser(id);
		session.invalidate();
		
		return "redirect:/main";
	}

	

}
