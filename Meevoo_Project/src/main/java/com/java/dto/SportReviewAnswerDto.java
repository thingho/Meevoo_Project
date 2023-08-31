package com.java.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class SportReviewAnswerDto {
	
	private int srepanno;
	private int srepno;
	private String id;
	private String srepancontent;
	private Timestamp srepandate;

}
