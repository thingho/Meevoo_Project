<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>모임 맴버 평가</title>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
										</header>
									</div>
								</section>
								
							<!-- Section -->
							
								<section>
									<header class="major">
										<h2>모임 참여 인원 : <span>7</span>명</h2>
									</header>
									<form action="doCMEvaluation" method="get" name="cmevaluation" style="clear: both;position: relative;">
									  <div class="table-wrapper">
									  <style>
									    .cmevaluation {border-collapse: collapse; }    
									  </style>
									    <table class="cmevaluation">
										     <colgroup>
										      <col width="10%">
										      <col width="25%">
										      <col width="13%">
										      <col width="13%">
										      <col width="13%">
										      <col width="13%">
										      <col width="13%">
										     </colgroup>
									      <thead>
									        <tr>
									          <th></th>
									          <th></th>
									          <th style="text-align:center">매우좋음</th>
									          <th style="text-align:center">좋음</th>
									          <th style="text-align:center">보통</th>
									          <th style="text-align:center">나쁨</th>
									          <th style="text-align:center">매우나쁨</th>
									        </tr>
									      </thead>
									      <tbody>
									        <tr>
									          <td style="vertical-align : middle">
									            <div>
											      <span class="image">
												    <img src="../images/profile/profile1.jpeg" style="width:100px; border-radius: 50%;" />
												  </span>
									            </div>
									          </td>
									          <td style="vertical-align : middle; ">
												honghong111
									          </td>
									          <td style="vertical-align : middle; text-align:center;">
									           <div class="col-4 col-12-small">
											    <input type="radio" name="evaluation" id="verygood" value="verygood">
											    <label for="verygood"></label>
									           </div>
									          </td>
									          <td style="vertical-align : middle; text-align:center;">
									            <input type="radio" name="evaluation" id="good" value="good">
									            <label for="good"></label>
									          </td>
									          <td style="vertical-align : middle; text-align:center;">
									            <input type="radio" name="evaluation" id="average" value="average">
									            <label for="average"></label>
									          </td>
									          <td style="vertical-align : middle; text-align:center;">
									            <input type="radio" name="evaluation" id="poor" value="poor">
									            <label for="poor"></label>
									          </td>
									          <td style="vertical-align : middle; text-align:center;">
									            <input type="radio" name="evaluation" id="bad" value="bad">
									            <label for="bad"></label>
									          </td>
									        </tr>
									        <tr>
									          <td style="vertical-align : middle">
									            <div>
											      <span class="image">
												    <img src="../images/profile/profile1.jpeg" style="width:100px; border-radius: 50%;" />
												  </span>
									            </div>
									          </td>
									          <td style="vertical-align : middle; ">
												honghong111
									          </td>
									          <td style="vertical-align : middle; text-align:center;">
									           <div class="col-4 col-12-small">
											    <input type="radio" name="evaluation2" id="verygood2" value="verygood">
											    <label for="verygood2"></label>
									           </div>
									          </td>
									          <td style="vertical-align : middle; text-align:center;">
									            <input type="radio" name="evaluation2" id="good2" value="good">
									            <label for="good2"></label>
									          </td>
									          <td style="vertical-align : middle; text-align:center;">
									            <input type="radio" name="evaluation2" id="average2" value="average">
									            <label for="average2"></label>
									          </td>
									          <td style="vertical-align : middle; text-align:center;">
									            <input type="radio" name="evaluation2" id="poor2" value="poor">
									            <label for="poor2"></label>
									          </td>
									          <td style="vertical-align : middle; text-align:center;">
									            <input type="radio" name="evaluation2" id="bad2" value="bad">
									            <label for="bad2"></label>
									          </td>
									        </tr>
									        <tr>
									          <td style="vertical-align : middle">
									            <div>
											      <span class="image">
												    <img src="../images/profile/profile1.jpeg" style="width:100px; border-radius: 50%;" />
												  </span>
									            </div>
									          </td>
									          <td style="vertical-align : middle; ">
												honghong111
									          </td>
									          <td style="vertical-align : middle; text-align:center;">
									           <div class="col-4 col-12-small">
											    <input type="radio" name="evaluation3" id="verygood3" value="verygood">
											    <label for="verygood3"></label>
									           </div>
									          </td>
									          <td style="vertical-align : middle; text-align:center;">
									            <input type="radio" name="evaluation3" id="good3" value="good">
									            <label for="good3"></label>
									          </td>
									          <td style="vertical-align : middle; text-align:center;">
									            <input type="radio" name="evaluation3" id="average3" value="average">
									            <label for="average3"></label>
									          </td>
									          <td style="vertical-align : middle; text-align:center;">
									            <input type="radio" name="evaluation3" id="poor3" value="poor">
									            <label for="poor3"></label>
									          </td>
									          <td style="vertical-align : middle; text-align:center;">
									            <input type="radio" name="evaluation3" id="bad3" value="bad">
									            <label for="bad3"></label>
									          </td>
									        </tr>
									        <tr>
									          <td style="vertical-align : middle">
									            <div>
											      <span class="image">
												    <img src="../images/profile/profile1.jpeg" style="width:100px; border-radius: 50%;" />
												  </span>
									            </div>
									          </td>
									          <td style="vertical-align : middle; ">
												honghong111
									          </td>
									          <td style="vertical-align : middle; text-align:center;">
									           <div class="col-4 col-12-small">
											    <input type="radio" name="evaluation4" id="verygood4" value="verygood">
											    <label for="verygood4"></label>
									           </div>
									          </td>
									          <td style="vertical-align : middle; text-align:center;">
									            <input type="radio" name="evaluation4" id="good4" value="good">
									            <label for="good4"></label>
									          </td>
									          <td style="vertical-align : middle; text-align:center;">
									            <input type="radio" name="evaluation4" id="average4" value="average">
									            <label for="average4"></label>
									          </td>
									          <td style="vertical-align : middle; text-align:center;">
									            <input type="radio" name="evaluation4" id="poor4" value="poor">
									            <label for="poor4"></label>
									          </td>
									          <td style="vertical-align : middle; text-align:center;">
									            <input type="radio" name="evaluation4" id="bad4" value="bad">
									            <label for="bad4"></label>
									          </td>
									        </tr>
									        <tr>
									          <td style="vertical-align : middle">
									            <div>
											      <span class="image">
												    <img src="../images/profile/profile1.jpeg" style="width:100px; border-radius: 50%;" />
												  </span>
									            </div>
									          </td>
									          <td style="vertical-align : middle; ">
												honghong111
									          </td>
									          <td style="vertical-align : middle; text-align:center;">
									           <div class="col-4 col-12-small">
											    <input type="radio" name="evaluation5" id="verygood5" value="verygood">
											    <label for="verygood5"></label>
									           </div>
									          </td>
									          <td style="vertical-align : middle; text-align:center;">
									            <input type="radio" name="evaluation5" id="good5" value="good">
									            <label for="good5"></label>
									          </td>
									          <td style="vertical-align : middle; text-align:center;">
									            <input type="radio" name="evaluation5" id="average5" value="average">
									            <label for="average5"></label>
									          </td>
									          <td style="vertical-align : middle; text-align:center;">
									            <input type="radio" name="evaluation5" id="poor5" value="poor">
									            <label for="poor5"></label>
									          </td>
									          <td style="vertical-align : middle; text-align:center;">
									            <input type="radio" name="evaluation5" id="bad5" value="bad">
									            <label for="bad5"></label>
									          </td>
									        </tr>
									        <tr>
									          <td style="vertical-align : middle">
									            <div>
											      <span class="image">
												    <img src="../images/profile/profile1.jpeg" style="width:100px; border-radius: 50%;" />
												  </span>
									            </div>
									          </td>
									          <td style="vertical-align : middle; ">
												honghong111
									          </td>
									          <td style="vertical-align : middle; text-align:center;">
									           <div class="col-4 col-12-small">
											    <input type="radio" name="evaluation6" id="verygood6" value="verygood">
											    <label for="verygood6"></label>
									           </div>
									          </td>
									          <td style="vertical-align : middle; text-align:center;">
									            <input type="radio" name="evaluation6" id="good6" value="good">
									            <label for="good6"></label>
									          </td>
									          <td style="vertical-align : middle; text-align:center;">
									            <input type="radio" name="evaluation6" id="average6" value="average">
									            <label for="average6"></label>
									          </td>
									          <td style="vertical-align : middle; text-align:center;">
									            <input type="radio" name="evaluation6" id="poor6" value="poor">
									            <label for="poor6"></label>
									          </td>
									          <td style="vertical-align : middle; text-align:center;">
									            <input type="radio" name="evaluation6" id="bad6" value="bad">
									            <label for="bad6"></label>
									          </td>
									        </tr>
									        <tr>
									          <td style="vertical-align : middle">
									            <div>
											      <span class="image">
												    <img src="../images/profile/profile1.jpeg" style="width:100px; border-radius: 50%;" />
												  </span>
									            </div>
									          </td>
									          <td style="vertical-align : middle; ">
												honghong111
									          </td>
									          <td style="vertical-align : middle; text-align:center;">
									           <div class="col-4 col-12-small">
											    <input type="radio" name="evaluation7" id="verygood7" value="verygood">
											    <label for="verygood7"></label>
									           </div>
									          </td>
									          <td style="vertical-align : middle; text-align:center;">
									            <input type="radio" name="evaluation7" id="good7" value="good">
									            <label for="good7"></label>
									          </td>
									          <td style="vertical-align : middle; text-align:center;">
									            <input type="radio" name="evaluation7" id="average7" value="average">
									            <label for="average7"></label>
									          </td>
									          <td style="vertical-align : middle; text-align:center;">
									            <input type="radio" name="evaluation7" id="poor7" value="poor">
									            <label for="poor7"></label>
									          </td>
									          <td style="vertical-align : middle; text-align:center;">
									            <input type="radio" name="evaluation7" id="bad7" value="bad">
									            <label for="bad7"></label>
									          </td>
									        </tr>
									        
									        
									        
									      </tbody>
									    </table>
									  </div>
									  <br>
									  <hr>
									  <br>
									  <div class="col-12"; style="postion:flex; width: 100%;">
										<ul class="actions" style="justify-content: flex-end;">
											<li><input type="reset" value="초기화" /></li>
											<li><input type="button" value="적용" onclick="javascript:location.href='/club/cSRSuggestion';"  class="primary" /></li>
										</ul>
									  </div>
									</form>
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