package com.java.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class PageDto {

	private int page = 1;				// 현재 하단페이지, default 1page
	private int listCount;				// 전체 게시글 수
	private int maxPage;				// 최대 넘버링 페이지 
	private int startPage;				// 처음 넘버링 페이지
	private int endPage;				// 마지막 넘버링 페이지
	private int startRow;				// 페이지 최초 모임목록글 번호
	private int endRow;					// 페이지 마지막 모임목록글 번호
	private int rowPerPage=10;			// 페이지 당 게시글 갯수, default 10개
	private int numberringPerPage=10;	// 페이지 갯수
	
}
