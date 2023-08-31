package com.java.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class SportReviewReportDto {
	
	private int srerepno;     
	private int sreno;     
	private String id;     
	private Timestamp srerepdate;     
	private String srerepcontent;     
	private String srerepinput;     
	private String srerepimg;     

}
