package com.java.dto;


import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor //전체생성자
@NoArgsConstructor //기본생성자
@Data //getter, setter
public class MemberDto {
	
	private String id;
	private int pw;
	private String usernm;
	private String nicknm;
	private int birth;
	private String email;
	private String gender;
	private String dongcate;
	private String scate;
	private String userimg;
	//private String[] userimgs;
	private String selfintro;
	private Date joindate;
	private int nowjoin;
	private float totaltemp;
	private String addr;
	private int remainDate;    //DB에서 계산을 해서 가져오는 것 : xml에서 쿼리문으로 불러오는것이다 : 이름을 임의로 정해서 불러오는것! : 안불러오면 그냥 null값
	
	
}
