package com.java.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class CListCurrDto {

	private int ccurrno;
	private String id;
	private int cno;
	private String cnm;
	private String dongcate;
	private Date ccurrdate;
	private Date cdodate;
	
	
}
