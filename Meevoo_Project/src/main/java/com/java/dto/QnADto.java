package com.java.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor //전체생성자
@NoArgsConstructor //기본생성자
@Data //getter, setter
public class QnADto {

	
	private int qnano;
	private String id;
	private String qnatitle;
	private Date qnadate;
	private String qnacontent;
	private String qnastatus;
	private int qstep;
	private int qgroup;
	private int qindent;
	
}
