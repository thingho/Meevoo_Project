package com.java.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class SportReportDto {
	
	private int srepno;
	private String id;
	private int sfno;
	private String sreptitle;
	private String srepcontent;
	private Timestamp srepdate;
	private String srepinput;
	private String srepimg;
	private String[] srepimgs;

}
