package com.java.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class ClubPickDto {

	private int cpickno;
	private String id;
	private int cno;
	private String cpickyn;
	private Timestamp cpickdate;
	
}
