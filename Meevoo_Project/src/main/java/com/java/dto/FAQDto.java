package com.java.dto;

import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor //전체생성자
@NoArgsConstructor //기본생성자
@Data //getter, setter
public class FAQDto {

	private int faqno;
	private String faqq;
	private String faqa;
	
}
