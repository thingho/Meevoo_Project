package com.java.service;
//controller->ServiceImpl 로 바로 가도 되지만 유지보수를 쉽게 하기 위해서 만들었음
public interface EmailService {

	//임시비밀번호 코드 생성
	String insertPwCode(String name, String email);

}
