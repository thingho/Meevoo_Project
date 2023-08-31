package com.java.service;

import java.io.File;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.UUID;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.java.dto.ClubDto;
import com.java.dto.FAQDto;
import com.java.dto.MemberDto;
import com.java.dto.NoticeDto;
import com.java.dto.PageDto;
import com.java.dto.QnADto;
import com.java.dto.SearchDto;
import com.java.mapper.NoticeMapper;

@Service
public class NoticeServiceImpl implements NoticeService {

	@Autowired NoticeMapper noticeMapper;
	



	// 1. 전체 회원 하단 넘버링
	@Override
	public HashMap<String, Object> selectNoticeAll(int page) {

		HashMap<String, Object> map = new HashMap<>();
		//페이지 정보 메소드 호출하기
		//pageDto = pageMethod(pageDto,search_input);
		
		
		// 게시글 전체개수
		int listCount = noticeMapper.selectListCount();
		int maxPage = (int)Math.ceil((double)listCount/10); // 26/10 3개page
		int startPage = (int)((page-1)/10)*10 + 1;  //1
		int endPage = startPage+10-1;
		int startRow = (page-1)*10+1;  //1page -> 1-10, 2page -> 11-20
		int endRow = startRow+10-1;
		
		
		//endPage가 최대페이지보다 더 크면 최대페이지까지만 노출
		if(endPage>maxPage) endPage=maxPage;
		//System.out.println("endPage : "+endPage);
		
		//모임 전체 가져오기
		ArrayList<NoticeDto> nlist = noticeMapper.selectNoticeAll(startRow,endRow);
		
		System.out.println("Impl nlist : "+nlist);
		
		map.put("nlist", nlist);
		map.put("listCount", listCount);
		map.put("maxPage", maxPage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("page", page);		
		//map.put("pageDto", pageDto);
		return map;
	}

	//페이지정보 메소드
	public PageDto pageMethod(@Param("pDto")PageDto pageDto, String search_input) {
			
			//전체게시글 수-142,현재페이지,최대페이지,시작페이지,끝페이지 1-시작,2,3,4,5-현재,6,7,8,9,10-끝  15-최대
			//시작번호,끝나는번호 1-10,11-20,21-30
			//전체게시글 수 저장
			pageDto.setListCount(noticeMapper.selectNoticeListCount());
			// 최대 넘버링페이지
			pageDto.setMaxPage((int)Math.ceil((double)pageDto.getListCount()/10));
			// 시작 넘버링페이지
			pageDto.setStartPage((int)((pageDto.getPage()-1)/10)*10 + 1);
			// 끝 넘버링페이지
			pageDto.setEndPage(pageDto.getStartPage()+10-1);
			// 시작번호
			pageDto.setStartRow((pageDto.getPage()-1)*10+1);
			// 끝나는번호
			pageDto.setEndRow(pageDto.getStartRow()+10-1);
			
			return pageDto;
		}

// 2. 공지사항 상세페이지
	@Override
	public HashMap<String, Object> selectNoticeOne(int notino) {
		HashMap<String, Object> map = new HashMap<>();
		
		NoticeDto ndto = noticeMapper.selectNoticeOne(notino);
		map.put("ndto", ndto);
		
		return map;
	}
// 공지사항 추가하기
	@Override
	public void insertNotice(NoticeDto ndto, MultipartFile files) {
		String notiimg = "";  //파일 저장 이름
		String tempFile = ""; //임시 사용 이름
		String oriFile = "";  //원본 파일 이름
		
		if(!notiimg.isEmpty()) {
			oriFile = files.getOriginalFilename();
			UUID uuid = UUID.randomUUID();  //랜덤번호
			tempFile = uuid + "_" + oriFile;   //이름을 임의로 저장한다
			String uploadURL = "c:/upload/";  //저장위치
			File f = new File(uploadURL + tempFile);
			try { files.transferTo(f);
			} catch (Exception e) {e.printStackTrace();}
		}//if
		
		//dto에 notiimg 저장하기
		ndto.setNotiimg(notiimg);
		
		//파일이름 출력
		//System.out.println("파일이름 출력해보자 : " + notiimg);
		
		//mapper에 전송
		noticeMapper.insertNotice(ndto);
			
		
	}

	// 1) 수정할 공지사항 불러오기
	@Override
	public NoticeDto selectNMOne(int notino) {
		NoticeDto ndto = noticeMapper.selectNMOne(notino);
		return ndto;
	}

	// 2) 공지사항 수정한거 저장하기
	@Override
	public void updateNMOne(NoticeDto ndto, MultipartFile file) {
		
		noticeMapper.updateNMOne(ndto);
		
		String notiimg = "";  //파일 저장 이름
		String tempFile = ""; //임시 사용 이름
		String oriFile = "";  //원본 파일 이름
		
		if(!notiimg.isEmpty()) {
			oriFile = file.getOriginalFilename();
			UUID uuid = UUID.randomUUID();  //랜덤번호
			tempFile = uuid + "_" + oriFile;   //이름을 임의로 저장한다
			String uploadURL = "c:/upload/";  //저장위치
			File f = new File(uploadURL + tempFile);
			try { file.transferTo(f);
			} catch (Exception e) {e.printStackTrace();}
		}//if
		
		//dto에 notiimg 저장하기
		ndto.setNotiimg(notiimg);
		
		//파일이름 출력
		//System.out.println("파일이름 출력해보자 : " + notiimg);
		
	}

	//공지사항 삭제하기
	@Override
	public void deleteOne(int notino) {
		noticeMapper.deleteOne(notino);
		
	}
// == FAQ ==================================================================
// 1. 전체 FAQ 하단 넘버링 --------------------------------------------------------
	@Override
	public HashMap<String, Object> selectFAQAll(PageDto pageDto1) {
		HashMap<String, Object> map1 = new HashMap<>();
		//페이지 정보 메소드 호출하기
		pageDto1 = pageMethod1(pageDto1);
		
		//endPage가 최대페이지보다 더 크면 최대페이지까지만 노출
		if (pageDto1.getEndPage() > pageDto1.getMaxPage()) pageDto1.setEndPage(pageDto1.getMaxPage());
		
		//모임 전체 가져오기
		ArrayList<FAQDto> faqlist = noticeMapper.selectFAQAll(pageDto1);
		
		map1.put("faqlist", faqlist);
		map1.put("pageDto1", pageDto1);
		map1.put("page", pageDto1.getPage());
		map1.put("listCount", pageDto1.getListCount());
		map1.put("startPage", pageDto1.getStartPage());
		map1.put("endPage",pageDto1.getEndPage());
		map1.put("maxPage",pageDto1.getMaxPage());
		
		//System.out.println("Impl endPage : "+pageDto1.getEndPage());
		
		return map1;
	}

	//페이지정보 메소드
	public PageDto pageMethod1(PageDto pageDto1) {

		//전체게시글 수-142,현재페이지,최대페이지,시작페이지,끝페이지 1-시작,2,3,4,5-현재,6,7,8,9,10-끝  15-최대
		//시작번호,끝나는번호 1-10,11-20,21-30
		//전체게시글 수 저장
		pageDto1.setListCount(noticeMapper.selectFAQListCount());
		// 최대 넘버링페이지
		pageDto1.setMaxPage((int)Math.ceil((double)pageDto1.getListCount()/10));
		// 시작 넘버링페이지
		pageDto1.setStartPage((int)((pageDto1.getPage()-1)/10)*10 + 1);
		// 끝 넘버링페이지
		pageDto1.setEndPage(pageDto1.getStartPage()+10-1);
		// 시작번호
		pageDto1.setStartRow((pageDto1.getPage()-1)*10+1);
		// 끝나는번호
		pageDto1.setEndRow(pageDto1.getStartRow()+10-1);
		
		
		
		return pageDto1;
	}

// 2. FAQ 추가하기(글쓰기)
	@Override
	public void insertFAQ(FAQDto fdto) {
		noticeMapper.insertFAQ(fdto);
		
	}
// 3. 수정할 FAQ 불러오기
	@Override
	public FAQDto selectFMOne(int faqno) {
		FAQDto fdto = noticeMapper.selectFMOne(faqno);
		return fdto;
	}
// 3. 수정한 FAQ 저장하기
	@Override
	public void updateFMOne(FAQDto fdto) {
		noticeMapper.updateFMOne(fdto);
		
	}
// 4. FAQ 삭제하기
	@Override
	public void deleteFAQOne(int faqno) {
		noticeMapper.deleteFAQOne(faqno);
		
	}

//== QnA ========================================================================
	
// 1. QnA 전체 가져오기
	@Override
	public HashMap<String, Object> selectQnAAll(PageDto pageDto,SearchDto search) {
		HashMap<String, Object> map2 = new HashMap<>();
		//페이지 정보 메소드 호출하기
		pageDto = pageMethod1(pageDto,search);
		// endPage가 최대페이지보다 더 크면 최대페이지까지만 노출
		// if(pageDto1.getEndPage()>pageDto1.getMaxPage()) endPage=maxPage;

		if (pageDto.getEndPage() > pageDto.getMaxPage()) pageDto.setEndPage(pageDto.getMaxPage());
		//모임 전체 가져오기
		ArrayList<QnADto> qnalist = noticeMapper.selectQnAAll(pageDto, search);
		
		map2.put("qnalist", qnalist);
		map2.put("pageDto", pageDto);
		map2.put("page", pageDto.getPage());
		map2.put("listCount", pageDto.getListCount());
		map2.put("startPage", pageDto.getStartPage());
		map2.put("endPage",pageDto.getEndPage());
		map2.put("maxPage",pageDto.getMaxPage());
		map2.put("category",search.getCategory());
		map2.put("search_input",search.getSearch_input());
		return map2;
	}
	
	//페이지정보 메소드
		public PageDto pageMethod1(PageDto pageDto,SearchDto search) {
				
			//전체게시글 수-142,현재페이지,최대페이지,시작페이지,끝페이지 1-시작,2,3,4,5-현재,6,7,8,9,10-끝  15-최대
			//시작번호,끝나는번호 1-10,11-20,21-30
			//전체게시글 수 저장
			pageDto.setListCount(noticeMapper.selectQnAListCount(search));
			// 최대 넘버링페이지
			pageDto.setMaxPage((int)Math.ceil((double)pageDto.getListCount()/10));
			// 시작 넘버링페이지
			pageDto.setStartPage((int)((pageDto.getPage()-1)/10)*10 + 1);
			// 끝 넘버링페이지
			pageDto.setEndPage(pageDto.getStartPage()+10-1);
			// 시작번호
			pageDto.setStartRow((pageDto.getPage()-1)*10+1);
			// 끝나는번호
			pageDto.setEndRow(pageDto.getStartRow()+10-1);
			
			return pageDto;
		}
// 2. QnA 상세페이지 가져오기
		@Override
		public HashMap<String, Object> selectQnAOne(int qnano) {
			HashMap<String, Object> map2 = new HashMap<>();
			
			QnADto qdto = noticeMapper.selectQnAOne(qnano);
			map2.put("qdto", qdto);
			
			return map2;
		}
// 3. QnA 추가하기
		@Override
		public void insertQnA(QnADto qdto) {
			noticeMapper.insertQnA(qdto);
			
		}
// 4. QnA 삭제하기
		@Override
		public void deleteQnAOne(int qnano) {
			noticeMapper.deleteQnAOne(qnano);
			
		}
// 5. QnA 답변달기 - 불러오기
		@Override
		public HashMap<String, Object> selectQROne(int qnano) {
			HashMap<String, Object> map3 = new HashMap<>();
			// 조회수 1증가
			//noticeMapper.updateBhitUp(bno);
			//System.out.println("impl qna: "+qnano);
			QnADto qdto = noticeMapper.selectQROne(qnano);
			map3.put("qdto", qdto);
			//System.out.println("impl qdto"+qdto.getQnano());
			//System.out.println("impl qdto"+qdto.getQgroup());
			//System.out.println("impl qgroup:"+((QnADto)(map3.get("qdto"))).getQnano());
			return map3;
		}
// 6. QnA 답변 저장하기
		@Override
		public void doQnAReply(QnADto qdto) {
			noticeMapper.updateQstepCount(qdto);
			noticeMapper.doQnAReply(qdto);
			
		}
		
	
	
	
	
	
	
	
}
