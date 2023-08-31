package com.java.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class SListReviewDto {

	private int sreno;
	private int sfno;
	private String id;
	private String sfnm;
	private String dongcate;
	private Date sredate;
	
}
