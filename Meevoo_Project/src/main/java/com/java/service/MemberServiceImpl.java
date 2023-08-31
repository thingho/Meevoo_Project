package com.java.service;

import java.io.File;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.java.dto.MemberDto;
import com.java.mapper.MemberMapper;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper memberMapper;
	
	
	@Override //로그인 확인
	public MemberDto selectLogin(MemberDto memberDto) {
		MemberDto mdto = memberMapper.selectLogin(memberDto);
				
		return mdto;
	}

	@Override //회원가입시 입력한 정보 저장
	public void insertMem(MemberDto memberDto, MultipartFile file) {

		memberMapper.insertMem(memberDto);
		
	}

	@Override //select에 scate 값 표시하기
	public String[] selectscateAll() {
		String[] scate = memberMapper.selectscateAll();
		
		return scate;
	}

	@Override //select에 dongcate 값 표시하기
	public String[] selectdongcateAll() {
		String[] dongcate = memberMapper.selectdongcateAll();
		
		return dongcate;
	}

	@Override //id 중복체크
	public MemberDto selectIdOne(String id) {
		MemberDto mdto = memberMapper.selectIdOne(id);
		
		return mdto;
	}


	@Override //멤버 정보 1개 가져오기
	public MemberDto selectMemOne(String id) {
		MemberDto mdto = memberMapper.selectMemOne(id);
		//System.out.println("MemberServiceImpl id : "+mdto.getId());
		return mdto;
	}

	@Override //회원정보 수정 저장
	public void updateSaveUser(MemberDto memberDto) {
		
		//System.out.println(""+memberDto.getDongcate());
		//System.out.println(""+memberDto.getScate());
		//System.out.println(""+memberDto.getSelfintro());
		//System.out.println(""+memberDto.getNicknm());
		System.out.println("MemberServiceImpl img11 : "+memberDto.getUserimg());
		
		memberMapper.updateSaveUser(memberDto);
		
	}
	
	@Override //회원 탈퇴하기
	public void deleteUser(String id) {
		memberMapper.deleteUser(id);
		
	}


}
