package com.java.mapper;

import java.util.ArrayList;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.java.dto.FAQDto;
import com.java.dto.NoticeDto;
import com.java.dto.PageDto;
import com.java.dto.QnADto;
import com.java.dto.SearchDto;

@Mapper
public interface NoticeMapper {



	
	//공지사항 전체 가져오기
	ArrayList<NoticeDto> selectNoticeAll(int startRow, int endRow);
	
	//공지사항 전체개수
	int selectListCount();

	//공지사항 하단 넘버링
	int selectNoticeListCount();

	// 2. 공지사항 상세페이지
	ArrayList<NoticeDto> selectNoticViewAll(@Param("pDto")PageDto pageDto);

	// 공지사항 상세페이지
	NoticeDto selectNoticeOne(int notino);

	//공지사항 추가하기
	void insertNotice(NoticeDto ndto);

	// 1) 수정할 공지사항 가져오기
	NoticeDto selectNMOne(int notino);

	// 2) 공지사항 수정사항 저장하기
	void updateNMOne(NoticeDto ndto);

	//공지사항 삭제하기
	void deleteOne(int notino);

// == FAQ =========================================================================
	
// 1. 전체 FAQ 하단 넘버링 --------------------------------------------------------
	ArrayList<FAQDto> selectFAQAll(PageDto pageDto1);
	
	// 1-1. 전체 FAQ 하단 넘버링 카운트
	int selectFAQListCount();

// 2. FAQ 추가하기(글쓰기)
	void insertFAQ(FAQDto fdto);

// 3. 수정할 FAQ 불러오기  
	FAQDto selectFMOne(int faqno);
	
// 4. 수정한 FAQ 저장하기
	void updateFMOne(FAQDto fdto);
// 4. FAQ 삭제하기
	void deleteFAQOne(int faqno);


// == QnA ============================================================================
// 1. 전체 QnA 가져오기
	ArrayList<QnADto> selectQnAAll(PageDto pageDto, SearchDto search);

	//QnA 하단 넘버링
	int selectQnAListCount(SearchDto search);

	//QnA 상세페이지
	QnADto selectQnAOne(int qnano);

	// 3. QnA 추가하기
	void insertQnA(QnADto qdto);

	// 4. QnA 삭제하기
	void deleteQnAOne(int qnano);

	// 5. QnA 답글달기 - 불러오기
	QnADto selectQROne(int qnano);

	// 6. QnA 답글달기 저장
	void doQnAReply(QnADto qdto);

	// 7. QnA qstep1 증가
	void updateQstepCount(QnADto qdto);


	

	


	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

}
