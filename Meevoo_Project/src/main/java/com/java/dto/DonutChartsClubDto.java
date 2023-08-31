package com.java.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor //전체생성자
@NoArgsConstructor //기본생성자
@Data //getter, setter
public class DonutChartsClubDto {

	//admin/adminStatic에 있는 도넛차트 - 모임 을 위한 dto
	
	private int golf_count;
	private int basketball_count;
	private int badminton_count;
	private int bowling_count;
	private int skate_count;
	private int climbing_count;
	private int pingpong_count;
	private int tennis_count;
	private int soccer_count;
	
	
}
