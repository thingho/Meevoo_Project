<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>main</title>
		<!-- 제이쿼리 최신 -->
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../css/main.lee.css" />
		<style>
			#exercise,#sport,#impage{text-align: center; font-size: 30px;}
			#exercise_p,#sport_p,#impage_p{text-align: center;}
			#exercise_li,#sport_li,#impage_li{margin:0 auto;}
		</style>
	</head>
	<body class="is-preload">
	<c:if test="${result== 'mem_success' }">
		<script>alert("회원가입이 완료되었습니다.<br>로그인을 해주세요");</script>
	</c:if>

		<!-- Wrapper -->
			<div id="wrapper">
			
				<!-- Main -->
					<div id="main">
						<div class="inner">
						
						<!-- top.jsp -->
						<%@ include file="top.jsp" %>

							<!-- 메인 사진, 베너 -->
								<section id="banner">
									<div class="content">
										<header>
											<h1><br>관심사로<br />
											통하는 우리</h1>
											<p>관심사 기반 커뮤니티, <strong>Meevoo</strong></p>
										</header>
										<ul class="actions">
											<c:if test="${sessionId == null }">
												<li><a href="/member/agree" class="button big">더 알아보기</a></li>
											</c:if>
											<c:if test="${sessionId != null }">
												<li><a href="/club/club" class="button big">참여하기</a></li>
											</c:if>
										</ul>
									</div>
									<span class="image object">
										<img src="../images/main2.png" alt="" />
									</span>
								</section>


							<!-- 핵심 메뉴 3가지 -->
								<section>
									<header class="major">
										<h2>메인 메뉴</h2>
									</header>
									<div class="posts">
										<article>
											<a href="/club/club" class="image"><img src="images/club2.png" alt="" /></a>
											<h3 id="exercise">운동모임</h3>
											<p id="exercise_p">똑같은 일상을 활기차게 바꿔줄<br> 관심사 기반 모임</p>
											<ul class="actions">
												<li id="exercise_li"><a href="/club/club" class="button">운동모임</a></li>
											</ul>
										</article>
										<article>
											<a href="/sport/sportList" class="image"><img src="images/fclty2.png" alt="" /></a>
											<h3 id="sport">체육시설</h3>
											<p id="sport_p">스포츠 시설 정보와 리뷰를 한눈에!<br> &nbsp;</p>
											<ul class="actions">
												<li id="sport_li"><a href="/sport/sportList" class="button">체육시설</a></li>
											</ul>
										</article>
										<article>
											<a href="/mypage/myProfil" class="image"><img src="images/mypage2.png" alt="" /></a>
											<h3 id="impage">내 페이지</h3>
											<p id="impage_p">모든 것을 관리하고 확인하는<br> 나만의 페이지</p>
											<ul class="actions">
												<li id="impage_li"><a href="/mypage/myProfil" class="button">내 페이지</a></li>
											</ul>
										</article>
										
									</div>
								</section>

							<!-- 가장 많이 찜한 게시글 Top4 -->
								<section>
									<header class="major">
										<h2>가장 많이 찜한 운동모임</h2>
									</header>
									<div class="features">
										<c:forEach items="${list}" var="clist">
											<article>
												<%-- <span><img src="${clist.cimg }"/></span> --%>
												<!-- 운동종목 별 아이콘 영역 -->
											      <span><a href="/club/cView?cno=${clist.cno}" style="text-decoration: none;">
													<span style="margin: 25px;">
													  <c:if test="${clist.scate eq '스케이트'}">
													    <img src="../images/sports/iceSkateIcon.png" style="width:150px;" />
													  </c:if>
													  <c:if test="${clist.scate eq '골프'}">
													    <img src="../images/sports/golfIcon.png" style="width:150px;" />
													  </c:if>
													  <c:if test="${clist.scate eq '배드민턴'}">
													    <img src="../images/sports/badmintonIcon.png" style="width:150px;" />
													  </c:if>
													  <c:if test="${clist.scate eq '테니스'}">
													    <img src="../images/sports/tennisIcon.png" style="width:150px;" />
													  </c:if>
													  <c:if test="${clist.scate eq '탁구'}">
													    <img src="../images/sports/tableTennisIcon.png" style="width:150px;" />
													  </c:if>
													  <c:if test="${clist.scate eq '풋살'}">
													    <img src="../images/sports/futsalIcon.png" style="width:150px;" />
													  </c:if>
													  <c:if test="${clist.scate eq '클라이밍'}">
													    <img src="../images/sports/climbingIcon.png" style="width:150px;" />
													  </c:if>
													  <c:if test="${clist.scate eq '볼링'}">
													    <img src="../images/sports/bowlingIcon.png" style="width:150px;" />
													  </c:if>
													  <c:if test="${clist.scate eq '농구'}">
													    <img src="../images/sports/basketballIcon.png" style="width:150px;" />
													  </c:if>
													</span>
												  </a></span>
												<div class="content">
													<a href="/club/cView?cno=${clist.cno }&page=${page}"><h2>&nbsp;&nbsp;&nbsp;&nbsp;${clist.cnm }</h2></a>
													<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${clist.dongcate }</p>
												</div>
											</article>
										</c:forEach>
										<!-- <article>
											<span><img src="images/clubPick1.png"></span>
											<div class="content">
												<h2>&nbsp;&nbsp;&nbsp;&nbsp;테니스 한판 하실분</h2>
												<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;구로구 개봉동</p>
											</div>
										</article> -->
									</div>
								</section>
								
							<!-- Section -->
								<section>
									<header class="major">
										<h2>가장 많이 찜한 체육시설</h2>
									</header>
									<div class="features">
										<%-- <c:forEach items="${list}" var="item">
											<article>
												<span><img src="images/clubPick1.png">${item.imgurl1 }</span>
												<div class="content">
													<h2>&nbsp;&nbsp;&nbsp;&nbsp;${item.sfnm }</h2>
													<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${item.dongcate }</p>
												</div>
											</article>
										</c:forEach> --%>
										<article>
											<span><img src="images/football1.png"></span>
											<div class="content">
												<h2>&nbsp;&nbsp;&nbsp;&nbsp;구로동 풋살장</h2>
												<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;구로구 구로동</p>
											</div>
										</article>
										<article>
											<span><img src="images/football1.png"></span>
											<div class="content">
												<h2>&nbsp;&nbsp;&nbsp;&nbsp;구로동 풋살장</h2>
												<p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;구로구 구로동</p>
											</div>
										</article>
									</div>
								</section>
								
								<!-- //footer.jsp -->
								<%@ include file="footer.jsp" %>
								
						</div>
					</div>

				<!-- sidebar.jsp -->
				<%@ include file="sidebar.jsp" %>
						
			</div>

		<!-- Scripts -->
			<script src="../js/jquery.min.js"></script>
			<script src="../js/browser.min.js"></script>
			<script src="../js/breakpoints.min.js"></script>
			<script src="../js/util.js"></script>
			<script src="../js/main.js"></script>

	</body>
</html>