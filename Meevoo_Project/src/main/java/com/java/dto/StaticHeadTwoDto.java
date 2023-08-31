package com.java.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor //전체생성자
@NoArgsConstructor //기본생성자
@Data //getter, setter
public class StaticHeadTwoDto {

	//adminStatic에서 상단에 접속자수를 계산해서 가져오는데 필요함!
	//데이터가 충분히 크지않아서 일단 12시간 기준으로 돌아가게 짰다!
	private int totallogin;
	
	
}
