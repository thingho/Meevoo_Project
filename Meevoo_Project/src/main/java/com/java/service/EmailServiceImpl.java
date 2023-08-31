package com.java.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class EmailServiceImpl implements EmailService {

	@Autowired JavaMailSender mailSender;
	
	@Override //임시비밀번호 코드 생성
	public String insertPwCode(String name, String email) {
		//
		System.out.println("EmailServiceImpl name : "+name);
		System.out.println("EmailServiceImpl email : "+email);
		
		//임시패스워드 코드 생성
		String pwCode=getCreateKey();
		System.out.println("임시비밀번호 코드 생성 : "+pwCode);

		//이메일 발송 - 단순txt
		mailSend(name,email,pwCode);
		
		
		
		return pwCode;
	}
	
	//이메일 발송 - 단순 txt
	public void mailSend(String name,String email,String pwcode) {
		SimpleMailMessage message = new SimpleMailMessage();
		message.setTo(email); //누구에게 보낼지
		message.setFrom("bdwldnjs@gmail.com"); //누가 보내는지
		message.setSubject(name+"님께 임시번호를 발송합니다."); //메일 제목
		message.setText("안녕하세요 회원가입에 필요한 이메일 인증 임시 비밀번호를 안내 드립니다.\n"
				+"["+name+"님의 임시 비밀번호 : "+pwcode+"]\n");
		mailSender.send(message);
		System.out.println("이메일이 발송 되었습니다.");
	}
	
	
	//임시패스워드 코드 생성 메소드
	public String getCreateKey() {
		char[] charSet = {'0','1','2','3','4','5','6','7','8','9',
				'A','B','C','D','E','F','G','H','I','J','K','L','M',
				'N','O','P','Q','R','S','T','U','V','W','X','Y','Z'};
		
		String pwCode="";
		int idx = 0;
		
		for(int i=0;i<10;i++) {
			idx = (int)(Math.random()*36); // 0-9까지의 랜덤번호
			pwCode += charSet[idx];
			
		}
		
		return pwCode;
	}

}
