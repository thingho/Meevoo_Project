<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>mySportCurr</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../css/main.lee.css" />
		<link rel="stylesheet" href="../css/profil.lee.css">
		<!-- 제이쿼리 최신 -->
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<style>
			#main1_1 h2{width:300px; border-bottom:1px solid gray; text-align: center; margin: 0 auto 50px;}
			.main1 h2{font-size: 40px; margin: 0 auto;}
			.wrap1{/* border-top:1px dotted #f56a6a; */ width:100%; height:100%; margin: 50px auto;}
			#wrap11{width:100%; height:100%; margin: 45px auto 0;}
			#th1{width:20%; text-align: center;}
			#th3, #th4, #th5{width:20%; text-align: center;}
			#th2{width:40%; text-align: center;}
			.table-wrapper{width:100%; text-align: center;}
			#table1{width:85%; margin:0 auto 25px;}
			#numon{background:#f56a6a; color: white; font-weight: 600;
  			/* position: relative; */ top: -15px; width: 20px; height: 22px; !important;
  			margin-left: 3px; margin-right: 3px; /* border: 1px #989898 solid; */
			text-decoration: none;}
			#nav1{padding:0;}
		</style>
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- top.jsp -->
							<%@ include file="../top.jsp" %>

							<!-- Content -->
								<section>
									<div id=main1_1>
										<header class="main1">
											<h2>내 체육시설</h2>
										</header>
									
										<!-- 중간에 내 체육시설 탭 넣기 : 체육시설 템플릿 -->
										<div id="container" class="container sub_container">
									
											<div class="contents" id="contents">
												<!-- breadcrumbs End -->
												<div class="cont-body">
													<div class="tab equal">
														<ul class="nav" id="nav1">
															<li><a href="mySportPick"> 찜한 체육시설 </a></li>
															<li class="active" title="선택된 탭"><a href="mySportCurr"> 최근 본 체육시설 </a></li>
															<li><a href="mySportReview"> 후기 작성한 체육시설 </a></li>
															<!-- <li class="active" title="선택된 탭"><a href="QnA"> 질의응답(QnA) </a></li>  -->
														</ul>
													</div>
												</div>
											</div>
										</div>
									</div>

									<div class="wrap1">
										<div id="wrap11">
											<div class="table-wrapper">
												<table id="table1">
													<thead>
														<tr>
															<th id="th1">게시물 번호</th>
															<th id="th2">체육시설 이름</th>
															<th id="th3">위치</th>
															<th id="th4">본 날짜</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="currlist" items="${list }">
															<tr class="tr1">
																<td>${currlist.sfno}</td>
																<td>
																	<a href="/sport/sportListView?sfno=${currlist.sfno }&page=${page}">
																	${currlist.sfnm}</a>
																</td>
																<td>${currlist.dongcate}</td>
																<td>
																	<fmt:formatDate value="${currlist.scurrdate}" pattern="yyyy-MM-dd" />
																</td>
															</tr>
														</c:forEach>
													</tbody>
												</table>
												
											</div>
										</div>
									</div>
									
								</section>
								
								<!-- //footer.jsp -->
								<%@ include file="../footer.jsp" %>

						</div>
					</div>

				<!-- sidebar.jsp -->
				<%@ include file="../sidebar.jsp" %>
			</div>

		<!-- Scripts -->
			<script src="../js/jquery.min.js"></script>
			<script src="../js/browser.min.js"></script>
			<script src="../js/breakpoints.min.js"></script>
			<script src="../js/util.js"></script>
			<script src="../js/main.js"></script>

	</body>
</html>