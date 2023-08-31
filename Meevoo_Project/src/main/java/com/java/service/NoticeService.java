package com.java.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.annotations.Param;
import org.springframework.web.multipart.MultipartFile;

import com.java.dto.FAQDto;
import com.java.dto.NoticeDto;
import com.java.dto.PageDto;
import com.java.dto.QnADto;
import com.java.dto.SearchDto;

public interface NoticeService {


	// 1. 전체 공지사항 하단 넘버링
	HashMap<String, Object> selectNoticeAll(int page);


	// 2. 공지사항 상세페이지
	HashMap<String, Object> selectNoticeOne(int notino);

	//공지사항 추가하기
	void insertNotice(NoticeDto ndto, MultipartFile files);

	// 1) 수정할 공지사항 불러오기
	NoticeDto selectNMOne(int notino);

	// 2) 공지사항 수정사항 저장하기
	void updateNMOne(NoticeDto ndto, MultipartFile file);

	//공지사항 삭제하기
	void deleteOne(int notino);

// == FAQ =======================================================
// 1. FAQ 전체 가져오기 
	HashMap<String, Object> selectFAQAll(PageDto pageDto1);

// 2. FAQ 추가하기
	void insertFAQ(FAQDto fdto);

// 1) 수정할 FAQ 불러오기
	FAQDto selectFMOne(int faqno);
	
// 2) 수정한 FAQ 저장하기
	void updateFMOne(FAQDto fdto);
// 4. FAQ 삭제하기
	void deleteFAQOne(int faqno);

// == QnA =======================================================	
// 1. QnA 전체 가져오기
	HashMap<String, Object> selectQnAAll(PageDto pageDto,SearchDto search);

// 2. QnA 불러오기
	HashMap<String, Object> selectQnAOne(int qnano);
// 3. QnA 추가하기
	void insertQnA(QnADto qdto);

// 4. QnA 삭제하기
	void deleteQnAOne(int qnano);

// 5. QnA 답변달기 - 불러오기
	HashMap<String, Object> selectQROne(int qnano);

// 6, QnA 답변달기 저장하기
	void doQnAReply(QnADto qdto);



}
