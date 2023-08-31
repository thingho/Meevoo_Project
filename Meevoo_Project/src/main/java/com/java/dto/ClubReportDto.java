package com.java.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ClubReportDto {
	
	private int crepno;
	private String id;
	private int cno;
	private String crepcontent;
	private Timestamp crepdate;
	private String crepinput;
	private String crepimg;
	private String creptitle;
	
}
