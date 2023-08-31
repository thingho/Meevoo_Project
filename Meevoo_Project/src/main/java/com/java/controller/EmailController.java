package com.java.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.java.service.EmailService;

@Controller
public class EmailController {

	@Autowired EmailService emailService;
	
	@RequestMapping("/member/emailSend")
	@ResponseBody
	public String emailSend(String name,String email) {
		System.out.println("usernm : "+name);
		
		//임시비밀번호 코드 생성
		String pwCode = emailService.insertPwCode(name,email);
		System.out.println("EmailController pwCode : "+pwCode);
		return pwCode;
	}
}
