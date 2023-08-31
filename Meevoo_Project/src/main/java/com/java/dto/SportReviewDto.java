package com.java.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class SportReviewDto {
	
	private int sreno;
	private int sfno;
	private String id;
	private String srecontent;
	private Timestamp sredate;
	private double sstar;
}
