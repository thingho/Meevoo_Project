package com.java.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor //전체생성자
@NoArgsConstructor //기본생성자
@Data //getter, setter
public class StaticHeadOneDto {

	//adminStatic에서 상단에 신규가입자 / 최근게시물 / 최근리뷰 계산해서 가져오는데 필요함!
	private int newjoinuser;
	private int newclub;
	private int newreview;
	
	
}
