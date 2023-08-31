package com.java.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class CListPickDto {

	private int cpickno;
	private int cno;
	private String id;
	private Date cpickdate;
	private String cpickyn;
	private String cnm;
	private String dongcate;
	private Date cdodate;
	
}
