package com.java.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.java.dto.MemberDto;

public interface MemberService {

	//로그인 확인
	MemberDto selectLogin(MemberDto memberDto);

	//회원가입시 입력한 정보 저장
	void insertMem(MemberDto memberDto, MultipartFile file);

	//select에 scate 값 표시하기
	String[] selectscateAll();

	//select에 dongcate 값 표시하기
	String[] selectdongcateAll();

	//id 중복체크
	MemberDto selectIdOne(String id);

	//멤버 정보 1개 가져오기
	MemberDto selectMemOne(String id);

	//회원 탈퇴하기
	void deleteUser(String id);

	//회원정보 수정 저장
	void updateSaveUser(MemberDto memberDto);





}
