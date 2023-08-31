<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>모임장소 리뷰제안</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../css/main_kim.css" />
		<link rel="icon" href="../images/main/logo2.png">
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Header -->
								<header id="header">
									<a href="main.jsp" class="logo"><strong>Meevoo</strong></a>
									<ul class="icons">
										<li><a href="#" class="icon brands fa-twitter"><span class="label">Twitter</span></a></li>
										<li><a href="#" class="icon brands fa-facebook-f"><span class="label">Facebook</span></a></li>
										<li><a href="#" class="icon brands fa-snapchat-ghost"><span class="label">Snapchat</span></a></li>
										<li><a href="#" class="icon brands fa-instagram"><span class="label">Instagram</span></a></li>
										<li><a href="#" class="icon brands fa-medium-m"><span class="label">Medium</span></a></li>
									</ul>
								</header>

							<!-- Banner -->
								<section id="banner">
									<div class="content">
										<header>
											<h1>honghong111 님! 모임은 어떠셨나요?</h1>
											<h3>리뷰를 작성하시고 다른 참여자에게 도움을 주세요 </h3>
											<h4>리뷰를 남겨주신 덕분에 다른 참여자들이 더 나은 모임을 할 수 있게 되었습니다. <br> 경험을 공유하여 다른 참여자들에게 도움을 주세요!</h4>
										</header>
									</div>
								</section>

							<!-- Section -->
								<!-- Section -->
								<section>
									<header class="major">
										<h2>모임 정보</h2>
									</header>
									<div style="margin-bottom: 5em;">
										 <div style="display: flex; flex-direction: row; width: 100%; margin-bottom: 5em;" >
										  <div style="width: 40%; padding: 1em;">
									        <span class="sfinfo" style="width: 40%; ">
									          <a href="#" class="image" style="width:100%;">
									            <img src="../images/운동시설/고척근린공원 테니스장.jpg" style="width:100%;"/>
									          </a>
									        </span>
									       </div>
	 									  <div class="content" style=" width: 55%; padding: 1.5em 0.5em 0.1em 3em;" >
	 									    <div>
										      <p style="margin-bottom: 1em;">모임장소&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;고척근린공원 테니스장</p>
										      <p style="margin-bottom: 1em;">모임주소&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;서울특별시 구로구 고척로39길 48-11</p>
										      <p style="margin: 0;">편의시설</p>
	 									    </div>
	 									    <div>
	 									        <div style="display: inline-block; margin: 10px; text-align: center;">
										          <figure><img src="../images/facilities/wifiIconX.png" style="width:70px;" /></figure>
										          <p style="font-size: 10px;">와이파이</p>
	 									        </div>
	 									        <div style="display: inline-block; margin: 10px; text-align: center;">
										          <figure><img src="../images/facilities/petIconO.png" style="width:70px" /></figure>
										          <p style="font-size: 10px;">반려동물</p>
	 									        </div>
	 									        <div style="display: inline-block; margin: 10px; text-align: center;">
										          <figure><img src="../images/facilities/parkingIconO.png" style="width:70px;" /></figure>
										          <p style="font-size: 10px;">주차장</p>
	 									        </div>
	 									        <div style="display: inline-block; margin: 10px; text-align: center;">
										          <figure><img src="../images/facilities/rampIconO.png" style="width:70px;" /></figure>
										          <p style="font-size: 10px;">입구경사로</p>
	 									        </div>
	 									    </div>
	 									  </div>
	 									 </div>
	 									 
	 									 <div class="col-12"; style="postion:flex; width: 100%;">
										   <ul class="actions" style="justify-content: flex-end;">
											 <li><input type="reset" onclick="javascript:location.href='/club/club'" value="다음에 작성" /></li>
											 <li><input type="submit" onclick="javascript:location.href='/sport/sportListView?sfno=${sport.sfno}&page=${page}'" value="작성하러 가기" class="primary" /></li>
										   </ul>
									     </div>
									  
									</div>
								</section>
								

						</div>
					</div>

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
											<span class="opener">운동 모임</span>
											<ul>
												<li><a href="#">모임 목록</a></li>
												<li><a href="#">모임 검색하기</a></li>
												<li><a href="#">모임 작성하기</a></li>
											</ul>
										</li>
										<li>
											<span class="opener">체육 시설</span>
											<ul>
												<li><a href="#">시설 목록</a></li>
												<li><a href="#">시설 검색하기</a></li>
											</ul>
										</li>
										<li>
											<span class="opener">내 페이지</span>
											<ul>
												<li><a href="#">내 프로필</a></li>
												<li><a href="#">운동 모임</a></li>
												<li><a href="#">체육 시설</a></li>
											</ul>
										</li>
										<li>
											<span class="opener">고객 센터</span>
											<ul>
												<li><a href="#">고객 센터</a></li>
												<li><a href="#">공지 사항</a></li>
												<li><a href="#">FQA/Q&A</a></li>
											</ul>
										</li>
									</ul>
								</nav>

							<!-- Footer -->
								<footer id="footer">
								</footer>

						</div>
					</div>

			</div>

		<!-- Scripts -->
			<script src="../js/jquery.min.js"></script>
			<script src="../js/browser.min.js"></script>
			<script src="../js/breakpoints.min.js"></script>
			<script src="../js/util.js"></script>
			<script src="../js/main.js"></script>

	</body>
</html>