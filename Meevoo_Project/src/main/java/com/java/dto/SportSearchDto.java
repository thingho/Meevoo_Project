package com.java.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class SportSearchDto {
	
	//검색 필터
	private String[] sports;
	private String sport;
//	private String[] dong;
//	private String dong_one;
	//

}
