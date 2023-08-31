package com.java.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ClubReportAnswerDto {
	
	private int crepanno;
	private int crepno;
	private String id;
	private String crepancontent;
	private Timestamp crepandate;

}
