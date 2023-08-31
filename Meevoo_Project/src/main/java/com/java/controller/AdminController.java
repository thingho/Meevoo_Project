package com.java.controller;

import java.io.File;


import java.net.URLEncoder;
import java.time.LocalTime;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
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
import com.java.service.AdminService;


@Controller
public class AdminController {

	
	@Autowired AdminService adminService;
	
	//관리자 통계페이지
//	@RequestMapping("/admin/adminStatic")
//	public String adminStatic() {
//		return "admin/adminStatic";
//	}


//=== Admin : 회원 관련 ====================================================================================================================	
// 1. 전체 회원 하단 넘버링 -------------------------------------------------------------------
		@RequestMapping("/admin/totalUser")
		public String totalUser(@RequestParam(defaultValue = "1")int page, SearchDto search, Model model) {
			
			//게시글 전체가져오기
			HashMap<String, Object> map = adminService.selectAll(page, search);
			model.addAttribute("list",map.get("list"));
			model.addAttribute("page",map.get("page"));
			model.addAttribute("listCount",map.get("listCount"));
			model.addAttribute("startPage",map.get("startPage"));
			model.addAttribute("endPage",map.get("endPage"));
			model.addAttribute("maxPage",map.get("maxPage"));
			model.addAttribute("category",map.get("category"));
			model.addAttribute("search_input",map.get("search_input"));
		
			return "admin/totalUser";
		}
	
		
// 2. 회원 새로 추가하기------------------------------------------------------------------
		
    // 1) 회원 추가하기
		@GetMapping("/admin/totalUserWrite")
		public String totalUserWrite() {
			return "admin/totalUserWrite";
		}
		
	// 2) 추가한 회원 저장하기
		@PostMapping("/admin/totalUserWrite")
		public String totalUserWrite(MemberDto memberDto, @RequestPart(required = false) MultipartFile files, Model model) {
			System.out.println("controller : modify 성공한거냐?");
			//게시글 1개 저장
			adminService.insertUser(memberDto,files);
			String result = "i_success";
			return "redirect:/admin/totalUser?result="+result;
		}
		
// 3. 회원 수정하기------------------------------------------------------------------
	// 1) 수정할 회원정보 불러오기
		@GetMapping("/admin/totalUserModify")
		public String totalUserModify(String id, Model model) {
			MemberDto mdto = adminService.selectTUMOne(id);
			model.addAttribute("mdto",mdto);
			return "admin/totalUserModify";
		}
		
	// 2) 회원 수정사항 저장하기------------------------------------------------------------------
		@PostMapping("/admin/totalUserModify")
		public String dototalUserModify(MemberDto mdto, @RequestPart(required = false) MultipartFile file, String id, Model model) throws Exception{
			
			//System.out.println("boardUpdate mdto :  " + mdto.getId());
			//System.out.println("boardUpdate mdto :  " + mdto.getUserimg());
			//System.out.println("boardUpdate file :  " + file.getOriginalFilename());
			
			//게시글 1개 저장하기
			String fileName = "";
			
			//파일이 있을 경우 파일저장하기
			if(!file.isEmpty()) {
				//실제 파일 이름
				String ori_fileName = file.getOriginalFilename();
				UUID uuid = UUID.randomUUID();  //랜덤숫자생성하기
				fileName = uuid + "_" + ori_fileName;  //변경된 파일 이름 - 중복방지를 위해서 
				String uploadUrl = "c:/upload/";       //파일업로드 위치
				File f = new File(uploadUrl + fileName);
				file.transferTo(f);   //파일저장시킴
				mdto.setUserimg(fileName);
			}//if
			adminService.updateTUMOne(mdto,file);
			
			return "redirect:/admin/totalUser"; 
		}
		
// 4. 회원 삭제하기 : nowjoin=0(탈퇴회원)으로 분류하기------------------------------------------------------------------
		@RequestMapping("/admin/totalUserModifyDelete")
		public String totalUserModifyDelete(MemberDto mdto, Model model){
			
			adminService.deleteTUMOne(mdto);
			//System.out.println("회원탈퇴가 되었다");
			
			return "redirect:/admin/totalUser"; 
		}

//=== Admin : 모임 관련====================================================================================================================		
		
// 1. 전체 모임 게시글 하단 넘버링 -------------------------------------------------------------
	@RequestMapping("/admin/totalWrite")
	public String totalWrite(PageDto pageDto1, SearchDto search, Model model) {
		
		//게시글 전체가져오기
		HashMap<String, Object> map1 = adminService.selectClubAll(pageDto1,search);
		model.addAttribute("clublist",map1.get("clublist"));
		model.addAttribute("pageDto1",map1.get("pageDto1"));
		model.addAttribute("page",map1.get("page"));
		model.addAttribute("listCount",map1.get("listCount"));
		model.addAttribute("startPage",map1.get("startPage"));
		model.addAttribute("endPage",map1.get("endPage"));
		model.addAttribute("maxPage",map1.get("maxPage"));
		model.addAttribute("category",map1.get("category"));
		model.addAttribute("search_input",map1.get("search_input"));
		//System.out.println("controller endPage"+map1.get("endPage"));
		return "admin/totalWrite";
	}
	
		
// 2. 모임 새로 추가하기------------------------------------------------------------------		
		
	// 1) 모임 추가하기
		@GetMapping("/admin/totalWriteWrite")
		public String totalWriteWrite(Model model) {
			
			// 시설번호 전체 가져오기
			ArrayList<SportDto> sportlist = adminService.selectSportList();
			model.addAttribute("sportlist", sportlist);
			
			
			return "admin/totalWriteWrite";
		}
		
	// 2) 추가한 모임 저장하기
		@PostMapping("/admin/totalWriteWrite")
		public String totalWriteWrite(ClubDto cdto, @RequestPart(required = false) MultipartFile files, Model model) {
			//System.out.println("controller : modify 성공한거냐?");
			//게시글 1개 저장
			adminService.insertClub(cdto,files);
			String result = "i_success";
			return "redirect:/admin/totalWrite?result="+result;
		}
		
// 3. 모임 수정하기------------------------------------------------------------------
	// 1) 수정할 모임정보 불러오기
		@GetMapping("/admin/totalWriteModify")
		public String totalClubModify(int cno, Model model) {
			ClubDto cdto = adminService.selectTCMOne(cno);
			model.addAttribute("cdto",cdto);
			
			// 수정하기 - 시설번호 전체 가져오기
			ArrayList<SportDto> sportlist = adminService.selectSportModifyList();
			model.addAttribute("sportlist", sportlist);
						
			
			return "admin/totalWriteModify";
		}	
		
	// 2) 모임 수정사항 저장하기------------------------------------------------------------------
		@PostMapping("/admin/totalWriteModify")
		public String dototalWriteModify(ClubDto cdto, @RequestPart(required = false) MultipartFile file, int cno, Model model) throws Exception{
			
			//System.out.println("dototalWriteModify cdto :  " + cdto.getCno());
			//System.out.println("dototalWriteModify cdto :  " + cdto.getCimg());
			//System.out.println("dototalWriteModify file :  " + file.getOriginalFilename());
			
			//게시글 1개 저장하기
			String fileName = "";
			
			//파일이 있을 경우 파일저장하기
			if(!file.isEmpty()) {
				//실제 파일 이름
				String ori_fileName = file.getOriginalFilename();
				UUID uuid = UUID.randomUUID();  //랜덤숫자생성하기
				fileName = uuid + "_" + ori_fileName;  //변경된 파일 이름 - 중복방지를 위해서 
				String uploadUrl = "c:/upload/";       //파일업로드 위치
				File f = new File(uploadUrl + fileName);
				file.transferTo(f);   //파일저장시킴
				cdto.setCimg(fileName);
			}//if
			adminService.updateTCMOne(cdto,file);
			
			return "redirect:/admin/totalWrite"; 
		}
		
// 4. 모임 삭제하기 ------------------------------------------------------------------------------
		@RequestMapping("/admin/totalWriteModifyDelete")
		public String totalWriteModifyDelete(ClubDto cdto, Model model){
			
			adminService.deleteTCMOne(cdto);
			//System.out.println("모임 삭제가 되었습니다");
			
			return "redirect:/admin/totalWrite"; 
		}
		
	//전체 모임 - 모임 수정하기
	@RequestMapping("/admin/totalWriteModify")
	public String totalWriteModify() {
		return "admin/totalWriteModify";
	}
	
	
//=== admin/adminStatic==========================================================================================
	
	//userGraph 데이터 가져오기-----------------------------------------------------------------
	@RequestMapping("/admin/adminStatic3")
	@ResponseBody
	public Map<String, int[]> adminStatic3() {
		
					
		//전체 테이블 가져오기
		List<UserGraphDto> list = adminService.selectUserGraphAll();


		int[] data1 = new int[7];
		int[] data2 = new int[7];
		int[] data3 = new int[7];
		
        for (int i=0;i<list.size();i++ ) {
			/* data1[i] = (int)(list.get(i)); */
        	UserGraphDto userGraphDto = list.get(i);
            data1[i] = userGraphDto.getNewuser();
            data2[i] = userGraphDto.getQuituser();
            data3[i] = userGraphDto.getTotaluser();
        	
        }

        Map<String, int[]> map = new HashMap<>(); 
        map.put("data1", data1);
        map.put("data2", data2);
        map.put("data3", data3);
		
		return map;
	}
	
		
	//게시물 데이터 가져오기-------------------------------------------------------------------------
	@RequestMapping("/admin/adminStatic4")
	@ResponseBody
	public Map<String, int[]> adminStatic4() {
		
		
		//전체 테이블 가져오기
		List<WriteGraphDto> writelist = adminService.selectWriteGraphAll();
		
		
		int[] wdata1 = new int[7];
		int[] wdata2 = new int[7];
		
		for (int i=0;i<writelist.size();i++ ) {
			/* data1[i] = (int)(list.get(i)); */
			WriteGraphDto writeGraphDto = writelist.get(i);
			wdata1[i] = writeGraphDto.getClubwrite();
			wdata2[i] = writeGraphDto.getSportreview();
			
		}
		
		Map<String, int[]> map = new HashMap<>(); 
		map.put("wdata1", wdata1);
		map.put("wdata2", wdata2);
		//System.out.println(wdata1);
		
		return map;
	}
	
	
	//신고 게시물 상위 다섯개 가져오기------------------------------------------------------------------
	
	@RequestMapping("/admin/adminStatic")
	public String adminStatic(@RequestParam(defaultValue = "1")int srepno,@RequestParam(defaultValue = "1")int crepno, Model model){
		
		//1) 스포츠 시설 신고게시물 하나씩 가져오기
		SportReportDto srdto = adminService.selectSROne(srepno);

		//2) 스포츠 시설 신고 게시물 상위 다섯개 가져오기
		ArrayList<SportReportDto> sRelist = adminService.selectSFive();

		model.addAttribute("srdto",srdto);
		model.addAttribute("sRelist",sRelist);
		//=====================================================================
		//1) 모임 신고게시물 하나씩 가져오기
		ClubReportDto crdto = adminService.selectCROne(crepno);
		
		//2) 모임 신고 게시물 상위 다섯개 가져오기
		ArrayList<ClubReportDto> cRelist = adminService.selectCFive();
		
		model.addAttribute("crdto",crdto);
		model.addAttribute("cRelist",cRelist);
		//System.out.println("controller cRelist:"+cRelist);
		
		//======================================================================
		//1) 신규가입자, 최근 게시물, 최근리뷰 값을 리스트에 채워서 데려오기
		ArrayList<StaticHeadOneDto> sholist = adminService.selectSHOne();
		
		model.addAttribute("sholist",sholist);
		//System.out.println("controller sholist:"+sholist);
		
		//2) 접속자 수 리스트에 채워서 데려오기
		ArrayList<StaticHeadTwoDto> shtlist = adminService.selectSHTwo();
		
		model.addAttribute("shtlist",shtlist);
		//System.out.println("controller shtlist:"+shtlist);
		
		

		return "admin/adminStatic";
	}
	
	
	
	
	//오른쪽 아래 도넛 그래프 - 모임--------------------------------------------------------------------------------------
	@RequestMapping("/admin/adminStatic5")
	@ResponseBody
	public ArrayList<DonutChartsClubDto> adminStatic5(Model model) {
		
		//전체 테이블 가져오기
		ArrayList<DonutChartsClubDto> dcclist = adminService.selectDonutChartClub();

		model.addAttribute("dcclist",dcclist);
		//System.out.println("controller dcclist: " + dcclist);
		//System.out.println("controller dcclist: " + dcclist.get(0).getBadminton_count());
		return dcclist;
	}

	
	
	
	
}
