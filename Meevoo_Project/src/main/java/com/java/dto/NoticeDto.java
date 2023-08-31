package com.java.dto;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor //전체생성자
@NoArgsConstructor //기본생성자
@Data //getter, setter
public class NoticeDto {

	private int notino;
	private String notiid;
	private String notititle;
	private Date notidate;
	private String noticontent;
	private int notihit;
	private String notiimg;
	
}
