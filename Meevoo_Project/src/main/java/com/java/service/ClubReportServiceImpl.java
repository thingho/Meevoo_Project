package com.java.service;

import java.io.File;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.java.dto.ClubDto;
import com.java.dto.ClubReportDto;
import com.java.dto.ClubReportAnswerDto;
import com.java.dto.PageDto;
import com.java.dto.SearchDto;
import com.java.mapper.ClubReportMapper;

@Service
public class ClubReportServiceImpl implements ClubReportService {

	@Autowired ClubReportMapper clubReportMapper;
	
	//1.clubReportList 가져오기
	@Override
	public HashMap<String, Object> selectAll(PageDto pagedto, SearchDto search) {
		//게시글 전체 가져오기
		HashMap<String, Object> map = new HashMap<>();
		
		//page정보 메소드 호출하기
		pagedto = pageMethod(pagedto,search);
		
		//endPage가 최대페이지보다 더 크면 최대페이지까지만 노출
		if(pagedto.getEndPage() > pagedto.getMaxPage()) pagedto.setEndPage(pagedto.getMaxPage());
		
		//모임 전체 가져오기
		ArrayList<ClubReportDto> list = clubReportMapper.selectAll(pagedto,search);

		map.put("list", list);
		map.put("pagedto", pagedto);
		
		map.put("page", pagedto.getPage());
		map.put("listCount", pagedto.getListCount());
		map.put("startPage", pagedto.getStartPage());
		map.put("endPage",pagedto.getEndPage());
		map.put("maxPage",pagedto.getMaxPage());
		map.put("category",search.getCategory());
		map.put("search_input",search.getSearch_input());
		
		return map;
	}

	private PageDto pageMethod(PageDto pagedto, SearchDto search) {
		//전체게시글 수-142,현재페이지,최대페이지,시작페이지,끝페이지 1-시작,2,3,4,5-현재,6,7,8,9,10-끝  15-최대
		//시작번호,끝나는번호 1-10,11-20,21-30
		//전체게시글 수 저장
		pagedto.setListCount(clubReportMapper.selectListCount(search));
		// 최대 넘버링페이지
		pagedto.setMaxPage((int)Math.ceil((double)pagedto.getListCount()/10));
		// 시작 넘버링페이지
		pagedto.setStartPage((int)((pagedto.getPage()-1)/10)*10 + 1);
		// 끝 넘버링페이지
		pagedto.setEndPage(pagedto.getStartPage()+10-1);
		// 시작번호
		pagedto.setStartRow((pagedto.getPage()-1)*10+1);
		// 끝나는번호
		pagedto.setEndRow(pagedto.getStartRow()+10-1);
		return pagedto;
	}

	// 2. clubReportView 상세페이지
	@Override
	public HashMap<String, Object> selectOne(ClubReportDto crdto) {

		HashMap<String, Object> map1 = new HashMap<>();

		// clubReport 1개 가져오기 
		ClubReportDto crdto1 = clubReportMapper.selectOne(crdto);
		map1.put("crdto1", crdto1);

		
		return map1;
	}
	
	// 2-1. 답글 가져오기
	@Override
	public ArrayList<ClubReportAnswerDto> selectAnAll(ClubReportDto crdto) {
		ArrayList<ClubReportAnswerDto> creanList = clubReportMapper.selectAnAll(crdto); 
		return creanList;
	}
	
	
// 3. clubReportWrite 신고글 작성하기

	// 3-1.신고글 작성을 위해 모임 번호랑 모임 제목 가져오기
	@Override
	public ArrayList<ClubDto> selectClist() {
		ArrayList<ClubDto> clist = new ArrayList<>();
		clist = clubReportMapper.selectClist();
		return clist;
	}

	// 3-2. 신고글 저장하기
	@Override
	public void insertOne(ClubReportDto crdto, List<MultipartFile> files) {
		String crepimg = ""; //파일저장이름
		String tempFile = ""; //임시사용이름
		String oriFile = ""; //원본파일이름
		String[] crepimgs = new String[3];
		
		for(int i=0;i<3;i++) {   //files.size()->이미지 등록개수만큼 저장
			tempFile = ""; //초기화
			if(!files.get(i).isEmpty()) {
				oriFile = files.get(i).getOriginalFilename(); //원본파일이름저장
				UUID uuid = UUID.randomUUID(); //랜덤번호
				tempFile = uuid + "_" + oriFile;  // 38749379137_1.jpg
				String uploadURL = "c:/upload/";  // 파일저장위치
				File f = new File(uploadURL+tempFile);
				try {
					files.get(i).transferTo(f); //파일을 서버에 저장
				} catch (Exception e) { e.printStackTrace(); }
			}//if
			
			//파일이름을 1개로 묶음
			if(i==0) crepimg = tempFile;
			else crepimg += ","+tempFile;     //452424_1.jpg,324134_2.jpg,341413_3.jpg
	
			// crDto에 crepimg이름 저장
			crdto.setCrepimg(crepimg);
		}//for
		
		//파일이름 출력
		//System.out.println("파일이름 1개로 묶은 이름 : "+crepimg);
		
		//파일이름 1개로 묶은 이름 String배열로 분리
		crepimgs = crepimg.split(",");
		
		//System.out.println("bfiles 배열 출력 : "+Arrays.toString(crepimgs));
		//System.out.println("bfiles 배열 개수 : "+crepimgs.length);
		
		//mapper 전송 - 문의글 1개 저장
		clubReportMapper.insertOne(crdto);
	}


	
// 4. 관리자 답글달기	
	// 4-1.답글 저장하기
	@Override
	public ClubReportAnswerDto answerInsert(ClubReportAnswerDto crepanDto) {
		//System.out.println("impl 등록 ajax에서 넘어온 아이디 : "+crepanDto.getId());
		//System.out.println("impl 등록 ajax에서 넘어온 답변번호 : "+crepanDto.getCrepanno());
		//System.out.println("impl 등록 ajax에서 넘어온 문의글번호 : "+crepanDto.getCrepno());
		//System.out.println("impl 등록 ajax에서 넘어온 답변 데이터 : "+crepanDto.getCrepancontent());
		
		clubReportMapper.answerInsert(crepanDto);
		return crepanDto;
	}

	// 4-2. 답글 삭제하기
	@Override
	public void answerDelete(int crepanno) {
		clubReportMapper.answerDelete(crepanno);
		
	}
 
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}
