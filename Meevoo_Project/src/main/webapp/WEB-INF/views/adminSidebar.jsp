<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- 운동모임\모임검색하기\모집기한 부분 css -->
<style>
body.slider input[type="range"] {
				-webkit-appearance:none !important;
				width: 420px;
				height: 2px;
				background: #f56a6a;
				border: none;
				outline: none;}.slider input[type="range"]::-webkit-slider-thumb {
					-webkit-appearance: none !important;
					width: 1em;
					height:1em;
					background: #ffffff;
					border: 2px solid #f56a6a;
					border-radius: 50%;
					cursor: pointer;}.slider input[type="range"]::-webkit-slider-thumb:hover {background: #f56a6a;} 
</style>
<!-- 운동모임\모임검색하기\모집기한 부분 css 끝-->
<!-- Sidebar -->
<div id="sidebar">
	<div class="inner">

		<!-- Search -->
<section id="search" class="alt">
	<form method="post" action="#">
		<input type="text" name="query" id="query" placeholder="Search" />
	</form>
</section>
<!-- Menu -->
			<nav id="menu">
				<header class="major">
					<h2>메뉴</h2>
				</header>
				<ul>
					<li>
						<span class="opener">운동모임</span>
						<ul>
							<li><a href="/club/club">모임 목록</a></li>
							<li><a href="/club/cWrite">모임 작성하기</a></li>
							<!-- 모임 검색하기 -->
							<li>
							  <span class="opener" style="pointer-events : none;">모임 검색하기</span>
							  <div style="margin: 0.3em 0 0 0.7em; padding: 0.3em 0 0 0.7em; color: #9fa3a6; font-size: 0.8em;">
							    <!-- 모임 목록 검색 -->
							    <section id="searchClub" class="alt">
	                              <span style="margin-bottom: 1em; margin-top: 1em; pointer-events : none;">· 키워드 검색 </span>
	                                <form method="post" action="#">
	                           	      <input type="text" name="query" id="query" placeholder="검색하세요" "/>
	                           	        <button type="button" style="float:right; " onclick="clubSearchBtn()">
	                           	          <img src ="../images/general/magnifier.png" style="width: 2em;vertical-align: middle; "/>
	                           	        </button>
	                                </form>
                                </section>
							    <!-- 모임 목록 검색 끝 -->
							    <hr style="border: double 0.05em #9fa3a6; margin: 0 0 1em 0;">
							    <!-- 모임 목록 필터 검색 -->
							    <form action="/club/club" method="get" name="filter" style="heiht: auto;">
							      <!-- 모임 목록 필터 검색(관심운동): 라디오버튼 -->
							      <span style="margin-bottom: 1em; pointer-events : none;">· 관심운동</span>  
							        <input type="radio" name="scate" class="scate" id="basketball" value="농구" />
							        <label for="basketball"><img src="../images/sports/basketballIcon.png" style="width: 2em;"> 농구</label>
							        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							        <input type="radio" name="scate" class="scate" id="badminton" value="배드민턴" />
							        <label for="badminton"><img src="../images/sports/badmintonIcon.png" style="width: 2em;"> 배드민턴</label>
							        <input type="radio" name="scate" class="scate" id="bowling" value="볼링" />
							        <label for="bowling"><img src="../images/sports/bowlingIcon.png" style="width: 2em;"> 볼링</label>
							        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							        <input type="radio" name="scate" class="scate" id="climbing" value="클라이밍" />
							        <label for="climbing"><img src="../images/sports/climbingIcon.png" style="width: 2em;"> 클라이밍</label>
							        <input type="radio" name="scate" class="scate" id="futsal" value="풋살" />
							        <label for="futsal"><img src="../images/sports/futsalIcon.png" style="width: 2em;"> 풋살</label>
							        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							        <input type="radio" name="scate" class="scate" id="iceSkate" value="스케이트" />
							        <label for="iceSkate"><img src="../images/sports/iceSkateIcon.png" style="width: 2em;"> 스케이트</label>
							        <input type="radio" name="scate" class="scate" id="golf" value="골프" />
							        <label for="golf"><img src="../images/sports/golfIcon.png" style="width: 2em;"> 골프</label>
							        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							        <input type="radio" name="scate" class="scate" id="tableTennis" value="탁구" />
							        <label for="tableTennis"><img src="../images/sports/tableTennisIcon.png" style="width: 2em;"> 탁구</label>
							        <input type="radio" name="scate" class="scate" id="tennis" value="테니스" />
							        <label for="tennis"><img src="../images/sports/tennisIcon.png" style="width: 2em;"> 테니스</label>
							      <!-- 모임 목록 필터 검색(관심운동): 라디오버튼 끝-->
							      <hr style="border: dotted 0.05em #9fa3a6;">
							      <!-- 모임 목록 필터 검색(진행단계): 드롭다운 -->
							      <span style="margin-bottom: 1em; pointer-events : none;">· 진행단계</span>
							      <div class="dropdown">
							        <select name="cnowstatus" class="cnowstatus" style="cursor: pointer;">
								      <option value="select" selected disabled>선택하세요</option>
									  <option value="모집중">모집중</option>
									  <option value="모집완료">모집완료</option>
									  <option value="모임완료">모임완료</option>
									</select>
							      </div>
							      <!-- 모임 목록 필터 검색(진행단계): 드롭다운 끝-->
							      <hr style="border: dotted 0.05em #9fa3a6;">
							      
							      <!-- 모임 목록 필터 검색(모집기한): range -->
							      <span style="margin-bottom: 1em; pointer-events : none;">· 모집기한</span>
							      <div class="slider">
							        <label for="dateDifference" ></label>
							        <input type="range" id="dateDifference" name="dateDifference" min="0" max="30" value="15" oninput="rangeValue.innerText = this.value" style="width: 100%; cursor: pointer;">&nbsp;&nbsp;D - 
							          <p id="rangeValue" style="display: inline-block; font-weight: bold; color: #f56a6a">15</p>
							      </div> 
							      <!-- 모임 목록 필터 검색(모집기한): range 끝 -->
							      
								  <hr style="border: dotted 0.05em #9fa3a6; margin-top: 0;">
							      <!-- 모임 목록 필터 검색 버튼-->
							      <div class="col-12;" style="postion:flex; width: 100%;">
								    <ul class="actions" style="justify-content: flex-end;">
									  <li><input type="reset" value="초기화" /></li>
									  <li><input type="button" value="필터검색" class="primary" onclick="clubFilterBtn()" /></li>
									</ul>
								  </div>
							      <!-- 모임 목록 필터 검색 버튼 끝-->
							    </form>
							    <!-- 모임 목록 필터 검색 끝-->
							  </div>
							</li>
							<!-- 모임 검색하기 끝 -->
						</ul>
					</li>
					<li>
						<span class="opener">체육시설</span>
						<ul>
							<li><a href="/sport/sportList">체육시설 게시판</a></li>
							<li><a href="/sportreport/sportReportList">체육시설 문의</a></li>
							<li><a href="/sportreport/sportReportWrite">체육시설 문의글 작성</a></li>
						</ul>
					</li>
					<li>
						<span class="opener">내 페이지</span>
						<ul>
							<li><a href="/mypage/myProfil">내 정보</a></li>
							<li><a href="/mypage/myClubJoin">내 운동모임</a></li>
							<li><a href="/mypage/mySportReview">내 체육시설</a></li>
						</ul>
					</li>
					<li>
					 <span class="opener">고객센터</span>
					 	<ul>
					 		<li><a href="/notice/notice">공지사항</a></li>
							<li><a href="/notice/FAQ">FAQ</a></li>
							<li><a href="/notice/QnA">Q&A</a></li>
						</ul>
					 </li>
					 
					 
					 
					 
					 
					 
					 
					 
					 
					 
					 
					 <c:if test="${sessionId == 'admin'}">
					 
					 
					 
					 <li>
						  <a href="/admin/adminStatic">관리자 메인페이지</a></li>
						<!-- opener 옵션 1,2,3 -->
					 <li>
					 <span class="opener">회원관리</span>
							<ul>
								<li><a href="/admin/totalUser">전체 회원 리스트</a></li>
							</ul>
					 </li>
				     <li>
						<span class="opener">게시글 관리</span>
							<ul>
								<li><a href="/admin/totalWrite">전체 게시글 리스트</a></li>
								<li>가능하면 게시글 / 후기 두개로 탭 나눠서 해보기</li>
							</ul>
					 </li>
					 
					 
					 </c:if>
					 
					 
					 
					 
					 
					 
					 
					 
					 
					 
					 
					 
					 
					 
					 
					 
				</ul>
			</nav>

	</div>
</div>