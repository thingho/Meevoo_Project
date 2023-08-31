package com.java.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class SportPickDto {
	
	private int spickno;
	private String id;
	private int sfno;
	private String spickyn;
	private Date spickdate;

}
