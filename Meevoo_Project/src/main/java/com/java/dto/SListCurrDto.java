package com.java.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class SListCurrDto {

	private int scurrno;
	private String id;
	private int sfno;
	private String sfnm;
	private String dongcate;
	private Date scurrdate;
	
}
