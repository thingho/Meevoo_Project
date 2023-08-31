package com.java.service;

import java.io.File;

import java.util.ArrayList;


import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;

import com.java.dto.ClubDto;
import com.java.dto.ClubReportDto;
import com.java.dto.DonutChartsClubDto;
import com.java.dto.MemberDto;
import com.java.dto.PageDto;
import com.java.dto.SearchDto;
import com.java.dto.SportDto;
import com.java.dto.SportReportDto;
import com.java.dto.StaticHeadOneDto;
import com.java.dto.StaticHeadTwoDto;
import com.java.dto.UserGraphDto;
import com.java.dto.WriteGraphDto;
import com.java.mapper.AdminMapper;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	AdminMapper adminMapper;
	
	
	
	//전체 회원 하단 넘버링 =========================================================================================
	@Override
	public HashMap<String, Object> selectAll(int page, SearchDto search) {
		
		HashMap<String, Object> map = new HashMap<>(page);
		
		// 회원 전체개수
		int listCount = adminMapper.selectMemberListCount(search);
		
		//회원 전체가져오기 - 마이바티스로 객체,String 변수
		// 최대페이지
		int maxPage = (int)Math.ceil((double)listCount/10); // 26/10 3개page
		int startPage = (int)((page-1)/10)*10 + 1;  //1
		int endPage = startPage+10-1;
		int startRow = (page-1)*10+1;  //1page -> 1-10, 2page -> 11-20
		int endRow = startRow+10-1;
		
		//endPage가 최대페이지보다 더 크면 최대페이지까지만 노출
		if(endPage>maxPage) endPage=maxPage;
		//System.out.println("endPage : "+endPage);
		ArrayList<MemberDto> list = adminMapper.selectAll(startRow, endRow, search);

		map.put("list", list);
		map.put("listCount", listCount);
		map.put("maxPage", maxPage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		map.put("page", page);
		map.put("category", search.getCategory());
		map.put("Search_input", search.getSearch_input());
		return map;
	}
	
	//페이지정보 메소드
//	public PageDto pageMethod(PageDto pageDto, String search_input) {
//			
//			//전체게시글 수-142,현재페이지,최대페이지,시작페이지,끝페이지 1-시작,2,3,4,5-현재,6,7,8,9,10-끝  15-최대
///			//시작번호,끝나는번호 1-10,11-20,21-30
//			//전체게시글 수 저장
//			pageDto.setListCount(adminMapper.selectMemberListCount());
//			// 최대 넘버링페이지
//			pageDto.setMaxPage((int)Math.ceil((double)pageDto.getListCount()/10));
//			// 시작 넘버링페이지
//			pageDto.setStartPage((int)((pageDto.getPage()-1)/10)*10 + 1);
//			// 끝 넘버링페이지
//			pageDto.setEndPage(pageDto.getStartPage()+10-1);
//			// 시작번호
//			pageDto.setStartRow((pageDto.getPage()-1)*10+1);
//			// 끝나는번호
//			pageDto.setEndRow(pageDto.getStartRow()+10-1);
//			
//			return pageDto;
//		}
	
	
	
	
	
	
	//전체 모임 하단 넘버링 =========================================================================================
	@Override
	public HashMap<String, Object> selectClubAll(PageDto pageDto1,SearchDto search) {
		HashMap<String, Object> map1 = new HashMap<>();
		//페이지 정보 메소드 호출하기
		pageDto1 = pageMethod1(pageDto1,search);
		
		//endPage가 최대페이지보다 더 크면 최대페이지까지만 노출
		//if(pageDto1.getEndPage()>pageDto1.getMaxPage()) endPage=maxPage;
		
		if (pageDto1.getEndPage() > pageDto1.getMaxPage()) pageDto1.setEndPage(pageDto1.getMaxPage());
		
		
		//모임 전체 가져오기
		ArrayList<ClubDto> clublist = adminMapper.selectClubAll(pageDto1, search);
		
		map1.put("clublist", clublist);
		map1.put("pageDto1", pageDto1);
		map1.put("page", pageDto1.getPage());
		map1.put("listCount", pageDto1.getListCount());
		map1.put("startPage", pageDto1.getStartPage());
		map1.put("endPage",pageDto1.getEndPage());
		map1.put("maxPage",pageDto1.getMaxPage());
		map1.put("category",search.getCategory());
		map1.put("search_input",search.getSearch_input());
		
		//System.out.println("Impl endPage : "+pageDto1.getEndPage());
		
		return map1;
	}

	//페이지정보 메소드
	public PageDto pageMethod1(PageDto pageDto1,SearchDto search) {

		//전체게시글 수-142,현재페이지,최대페이지,시작페이지,끝페이지 1-시작,2,3,4,5-현재,6,7,8,9,10-끝  15-최대
		//시작번호,끝나는번호 1-10,11-20,21-30
		//전체게시글 수 저장
		pageDto1.setListCount(adminMapper.selectClubListCount(search));
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
	
	
	//회원 그래프 데이터 가져오기

	@Override
	public List<UserGraphDto> selectUserGraphAll() {

		List<UserGraphDto> list = adminMapper.selectUserGraphAll();
		return list;
	}

	//모임 그래프 데이터 가져오기
	@Override
	public List<WriteGraphDto> selectWriteGraphAll() {

		List<WriteGraphDto> writelist = adminMapper.selectWriteGraphAll();
		
		return writelist;
	}

	//스포츠 시설 신고 게시물 1개 가져오기
	@Override
	public SportReportDto selectSROne(int srepno) {
		SportReportDto srdto = adminMapper.selectSROne(srepno);
		
		return srdto;
	}

	//Sport 신고 게시물 상위 5개
	@Override
	public ArrayList<SportReportDto> selectSFive() {
		ArrayList<SportReportDto> sRelist = adminMapper.selectSFive();
		
		return sRelist;
	}

	//모임 신고 게시물 1개 가져오기
	@Override
	public ClubReportDto selectCROne(int crepno) {
		ClubReportDto crdto = adminMapper.selectCROne(crepno);
		
		return crdto;
	}

	//모임 게시물 상위 5개
	@Override
	public ArrayList<ClubReportDto> selectCFive() {
		ArrayList<ClubReportDto> cRelist = adminMapper.selectCFive();
		
		return cRelist;
	}

	//회원 추가하기
	@Override
	public void insertUser(MemberDto memberDto, @RequestPart MultipartFile files) {
		
		String userimg = "";  //파일 저장 이름
		String tempFile = ""; //임시 사용 이름
		String oriFile = "";  //원본 파일 이름
		
		if(!userimg.isEmpty()) {
			oriFile = files.getOriginalFilename();
			UUID uuid = UUID.randomUUID();  //랜덤번호
			tempFile = uuid + "_" + oriFile;   //이름을 임의로 저장한다
			String uploadURL = "c:/upload/";  //저장위치
			File f = new File(uploadURL + tempFile);
			try { files.transferTo(f);
			} catch (Exception e) {e.printStackTrace();}
		}//if
		
		//dto에 userimg 저장하기
		memberDto.setUserimg(userimg);
		
		//파일이름 출력
		//System.out.println("파일이름 출력해보자 : " + userimg);
		
		//mapper에 전송
		adminMapper.insertMember(memberDto);
			
			}

	//수정할 회원 정보 가져오기
	@Override
	public MemberDto selectTUMOne(String id) {
		MemberDto mdto = adminMapper.selectTUMOne(id);
		return mdto;
	}

	//회원 수정사항 저장하기
	@Override
	public void updateTUMOne(MemberDto mdto,@RequestPart MultipartFile file) {
		
		
		
		adminMapper.updateTUMOne(mdto);
		
		
		String userimg = "";  //파일 저장 이름
		String tempFile = ""; //임시 사용 이름
		String oriFile = "";  //원본 파일 이름
		
		if(!userimg.isEmpty()) {
			oriFile = file.getOriginalFilename();
			UUID uuid = UUID.randomUUID();  //랜덤번호
			tempFile = uuid + "_" + oriFile;   //이름을 임의로 저장한다
			String uploadURL = "c:/upload/";  //저장위치
			File f = new File(uploadURL + tempFile);
			try { file.transferTo(f);
			} catch (Exception e) {e.printStackTrace();}
		}//if
		
		//dto에 userimg 저장하기
		mdto.setUserimg(userimg);
		
		//파일이름 출력
		//System.out.println("파일이름 출력해보자 : " + userimg);
		
		
		
	}

	//회원 탈퇴처리
	@Override
	public void deleteTUMOne(MemberDto mdto) {
		adminMapper.deleteTUMOne(mdto);
		//System.out.println("Impl에서도 탈퇴가 되었을껄?");
		
	}

	//1) 신규가입자, 최근 게시물, 최근리뷰 값을 리스트에 채워서 데려오기
	@Override
	public ArrayList<StaticHeadOneDto> selectSHOne() {
		ArrayList<StaticHeadOneDto> sholist = adminMapper.selectSHOne();
		return sholist;
	}

	//2) 접속자 수 리스트에 채워서 데려오기
	@Override
	public ArrayList<StaticHeadTwoDto> selectSHTwo() {
		ArrayList<StaticHeadTwoDto> shtlist = adminMapper.selectSHTwo();
		return shtlist;
	}


	
	
	
	
	
	//1) 모임 - 스포츠 종류별 count 
	@Override
	public ArrayList<DonutChartsClubDto> selectDonutChartClub() {
		ArrayList<DonutChartsClubDto> dcclist = adminMapper.selectDonutChartClub();
		//System.out.println("Impl dcclist : "+dcclist);
		return dcclist;
	}

	//모임 추가하기
	@Override
	public void insertClub(ClubDto cdto, MultipartFile files) {
		
		String cimg = "";  //파일 저장 이름
		String tempFile = ""; //임시 사용 이름
		String oriFile = "";  //원본 파일 이름
		
		if(!cimg.isEmpty()) {
			oriFile = files.getOriginalFilename();
			UUID uuid = UUID.randomUUID();  //랜덤번호
			tempFile = uuid + "_" + oriFile;   //이름을 임의로 저장한다
			String uploadURL = "c:/upload/";  //저장위치
			File f = new File(uploadURL + tempFile);
			try { files.transferTo(f);
			} catch (Exception e) {e.printStackTrace();}
		}//if
		
		//dto에 userimg 저장하기
		cdto.setCimg(cimg);
		
		//파일이름 출력
		//System.out.println("파일이름 출력해보자 : " + cimg);
		
		//mapper에 전송
		adminMapper.insertClub(cdto);
		
	}

	
	//새로 모임 추가할때 시설 리스트중에서 선택하게 리스트 가져오기
	@Override
	public ArrayList<SportDto> selectSportList() {
		ArrayList<SportDto> sportlist = adminMapper.selectSportList();
		return sportlist;
	}

	
	
	
	
	
	
	
	
	
	
	//수정할 모임 정보 가져오기
	@Override
	public ClubDto selectTCMOne(int cno) {
		ClubDto cdto = adminMapper.selectTCMOne(cno);
		return cdto;
	}

	// 수정하기 - 시설번호 전체 가져오기
	@Override
	public ArrayList<SportDto> selectSportModifyList() {
		ArrayList<SportDto> sportlist = adminMapper.selectSportModifyList();
		return sportlist;
	}

	//수정한 모임 정보 저장하기
	@Override
	public void updateTCMOne(ClubDto cdto, MultipartFile file) {
		
		adminMapper.updateTCMOne(cdto);
		
		
		String cimg = "";  //파일 저장 이름
		String tempFile = ""; //임시 사용 이름
		String oriFile = "";  //원본 파일 이름
		
		if(!cimg.isEmpty()) {
			oriFile = file.getOriginalFilename();
			UUID uuid = UUID.randomUUID();  //랜덤번호
			tempFile = uuid + "_" + oriFile;   //이름을 임의로 저장한다
			String uploadURL = "c:/upload/";  //저장위치
			File f = new File(uploadURL + tempFile);
			try { file.transferTo(f);
			} catch (Exception e) {e.printStackTrace();}
		}//if
		
		//dto에 cimg 저장하기
		cdto.setCimg(cimg);
		
		//파일이름 출력
		//System.out.println("파일이름 출력해보자 : " + cimg);
		
	}

	//모임 삭제하기
	@Override
	public void deleteTCMOne(ClubDto cdto) {
		adminMapper.deleteTCMOne(cdto);
		
	}

			

		

}
