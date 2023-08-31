package com.java.dto;

import java.sql.Date;


import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ClubDto {
	
	//------------------------------------------- from clublist ----------------------------------------//
	private int cno;
	private String id;
	private String cnm;
	private Date cwrdate;
	private String cimg;		
	private String[] cimgs;		
	private int sfno;
	//private String dongcate;
	private String cloc;
	private Date cdodate;
	
	 @DateTimeFormat(pattern = "yyyy-MM-dd") private Date cdodate_date;
	 
	 @DateTimeFormat(pattern = "HH24:mm") private Date cdodate_time;
	 
	private String ccontent;
	private int ctotalpick;
	private int crecruitlimit;
	private int cnowrecruit = 1; //운동모임 현재모집된 인원, defalut 1명 : 작성자는 무조건 참여함
	private String cnowstatus = "모집중";
	//private String scate;
	//------------------------------------------- from clublist 끝---------------------------------------//
	
	//------------------------------------------- from clublist / 임시변수 --------------------------------//
	private int dateDifference;		//모임 목록 필터검색시 D-day 반영 변수
	//------------------------------------------- from clublist / 임시변수 끝 -----------------------------//
	
	//------------------------------------------- from userlist ----------------------------------------//
	private String usernm;			//clublist에서 userlist 외래키로 join시 '사용자 이름'
	private String nicknm;			//clublist에서 userlist 외래키로 join시 '사용자 닉네임'
	private String userimg;			//clublist에서 userlist 외래키로 join시 '사용자 프로필사진'
	private String selfintro;		//clublist에서 userlist 외래키로 join시 '사용자 자기소개 문구'
	private float totaltemp;		//clublist에서 userlist 외래키로 join시 '사용자 온도'
	//------------------------------------------- from userlist 끝 --------------------------------------//
	
	//------------------------------------------- from sportlist ---------------------------------------//
	private String sfnm;			//clublist에서 sportlist 외래키로 join시 '체육시설 이름'
	private String scate;			//clublist에서 sportlist 외래키로 join시 '체육시설 운동종목'
	private String dongcate;		//clublist에서 sportlist 외래키로 join시 '체육시설 동이름'
	private String lat;		//clublist에서 sportlist 외래키로 join시 '체육시설 위도'
	private String lng;		//clublist에서 sportlist 외래키로 join시 '체육시설 경도'
	private String addr;			//clublist에서 sportlist 외래키로 join시 '체육시설 주소'
	private String telno;			//clublist에서 sportlist 외래키로 join시 '체육시설 전화번호'
	private String homepage;			//clublist에서 sportlist 외래키로 join시 '체육시설 홈페이지'
	private String wifi;			//clublist에서 sportlist 외래키로 join시 '체육시설 편의시설 와이파이 여부'
	private String pet;				//clublist에서 sportlist 외래키로 join시 '체육시설 편의시설 반려동물 여부'
	private String parking;			//clublist에서 sportlist 외래키로 join시 '체육시설 편의시설 주차장 여부'
	private String slope;			//clublist에서 sportlist 외래키로 join시 '체육시설 편의시설 입구경사로 여부'
	private String stotalpick;			//clublist에서 sportlist 외래키로 join시 '체육시설 편의시설 저장 수'
	private String savgstar;			//clublist에서 sportlist 외래키로 join시 '체육시설 편의시설 별점'
	private String imgurl1;			//clublist에서 sportlist 외래키로 join시 '체육시설 이미지1'
	//------------------------------------------- from sportlist 끝 ------------------------------------//
	
	
	

}
