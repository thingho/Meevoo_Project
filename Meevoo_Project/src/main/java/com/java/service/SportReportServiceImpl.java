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

import com.java.dto.SportDto;
import com.java.dto.SportReportDto;
import com.java.dto.SportReviewAnswerDto;
import com.java.dto.SportReviewDto;
import com.java.mapper.SportReportMapper;

@Service
public class SportReportServiceImpl implements SportReportService {

	@Autowired
	SportReportMapper sportReportMapper;
	
	@Override
	public HashMap<String, Object> selectAll(int page, String category, String srep_word) {
		
		// 문의글 전체 가져오기
		HashMap<String, Object> map = new HashMap<>();
		
		//게시글 전체개수
		int listCount = sportReportMapper.selectListCount(category,srep_word);
		
		//최대페이지
		int maxPage = (int)Math.ceil((double)listCount/10); // 최대페이지(전체 게시물/20 -> 15개page)
		int startPage = (int)((page-1)/10)*10 + 1; // 시작페이지 1
		int endPage = startPage+10-1; // 마지막페이지
		
		int startRow = (page-1)*10+1; //1page : 1-20, 2page : 21-40
		int endRow = startRow+10-1;
		
		//endPage가 maxPage보다 더 크면 maxPage만 노출
		if(endPage>maxPage) endPage=maxPage;
		ArrayList<SportReportDto> list = sportReportMapper.selectAll(startRow,endRow,category,srep_word);
		
		map.put("list", list);
		map.put("listCount", listCount);
		map.put("maxPage", maxPage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("page", page);
		map.put("category", category);
		map.put("srep_word", srep_word);
		
		return map;
	}

	@Override
	public HashMap<String,Object> selectOne(int srepno) {
		
		HashMap<String, Object> map = new HashMap<>();
		
		// 문의글 1개 가져오기
		SportReportDto srdto = sportReportMapper.selectOne(srepno);
		map.put("srdto", srdto);
//		//이전글 1개 가져오기
//		SportReportDto prevDto = sportReportMapper.selectPrevOne(srepno);
//		map.put("prevDto", prevDto);
//		//다음글 1개 가져오기
//		SportReportDto nextDto = sportReportMapper.selectNextOne(srepno);
//		map.put("nextDto", nextDto);
		return map;
	}


	@Override
	public ArrayList<SportDto> selectSfno() {
		ArrayList<SportDto> list = new ArrayList<>();
		
		// 문의글 작성으로 인한 시설번호 전체 가져오기
		list = sportReportMapper.selectSfno();
		return list;
	}
	

	@Override
	public void deleteOne(int srepno) {
		// 문의글 삭제하기
		sportReportMapper.deleteOne(srepno);
	}

	@Override
	public void insertOne(SportReportDto srDto, List<MultipartFile> files) {

		String srepimg = ""; //파일저장이름
		String tempFile = ""; //임시사용이름
		String oriFile = ""; //원본파일이름
		String[] srepimgs = new String[3];
		
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
			if(i==0) srepimg = tempFile;
			else srepimg += ","+tempFile;     //452424_1.jpg,324134_2.jpg,341413_3.jpg
	
			// srDto에 srepimg이름 저장
			srDto.setSrepimg(srepimg);
		}//for
		
		//파일이름 출력
		System.out.println("파일이름 1개로 묶은 이름 : "+srepimg);
		
		//파일이름 1개로 묶은 이름 String배열로 분리
		srepimgs = srepimg.split(",");
		
		System.out.println("bfiles 배열 출력 : "+Arrays.toString(srepimgs));
		System.out.println("bfiles 배열 개수 : "+srepimgs.length);
		
		//mapper 전송 - 문의글 1개 저장
		sportReportMapper.insertOne(srDto);
	}
	
	
	@Override
	public void updateOne(SportReportDto srDto, List<MultipartFile> files) {

		String srepimg = ""; //파일저장이름
		String tempFile = ""; //임시사용이름
		String oriFile = ""; //원본파일이름
		String[] srepimgs = new String[3];
		
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
			if(i==0) srepimg = tempFile;
			else srepimg += ","+tempFile;     //452424_1.jpg,324134_2.jpg,341413_3.jpg
	
			// srDto에 srepimg이름 저장
			srDto.setSrepimg(srepimg);
		}//for
		
		//파일이름 출력
		System.out.println("파일이름 1개로 묶은 이름 : "+srepimg);
		
		//파일이름 1개로 묶은 이름 String배열로 분리
		srepimgs = srepimg.split(",");
		
		System.out.println("bfiles 배열 출력 : "+Arrays.toString(srepimgs));
		System.out.println("bfiles 배열 개수 : "+srepimgs.length);
		System.out.println("service srepno updateOne : "+srDto.getSrepno());
		System.out.println("service id updateOne : "+srDto.getId());
		System.out.println("service sfno updateOne : "+srDto.getSfno());
		System.out.println("service srepcontent updateOne : "+srDto.getSrepcontent());
		System.out.println("service srepinput updateOne : "+srDto.getSrepinput());
		//mapper 전송 - 문의글 1개 수정
		sportReportMapper.updateOne(srDto);
	}

	
	@Override
	public ArrayList<SportReviewAnswerDto> selectAnAll(int srepno) {
		// 문의글 답변 전체 가져오기
		ArrayList<SportReviewAnswerDto> sreanList = sportReportMapper.selectAnAll(srepno);
		return sreanList;
	}
	
	
	@Override
	public SportReviewAnswerDto answerInsert(SportReviewAnswerDto srepanDto) {
		//문의글 하단 답변저장 후
		sportReportMapper.answerInsert(srepanDto);

		//답변 1개 가져오기
		SportReviewAnswerDto srepandto = sportReportMapper.selectAnOne(srepanDto);
		return srepandto;
	}

	@Override
	public void answerDelete(int srepanno) {
		// 답변 1개 삭제하기
		sportReportMapper.answerDelete(srepanno);
		
	}




}
