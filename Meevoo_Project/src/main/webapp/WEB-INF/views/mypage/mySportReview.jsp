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
		<title>mySportReview</title>
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
			#th1{width:15%; text-align: center;}
			#th3, #th4, #th5{width:15%; text-align: center;}
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
															<li><a href="mySportCurr"> 최근 본 체육시설 </a></li>
															<li class="active" title="선택된 탭"><a href="mySportReview"> 후기 작성한 체육시설 </a></li>
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
															<th id="th2">운동모임 제목</th>
															<th id="th3">위치</th>
															<th id="th4">참여 날짜</th>
															<th id="th5">삭제</th>
														</tr>
													</thead>
													<tbody>
														<c:forEach var="reviewlist" items="${list }">
															<tr class="tr1">
																<td>${reviewlist.sfno }</td>
																<td>
																	<a focus="sportreview" href="/sport/sportListView?sfno=${reviewlist.sfno }&page=${page}">
																	${reviewlist.sfnm}</a>
																</td>
																<td>${reviewlist.dongcate }</td>
																<td>
																	<fmt:formatDate value="${reviewlist.sredate}" pattern="yyyy-MM-dd" />
																</td>
																<td><button type="button" onclick="reviewBtn(${reviewlist.sfno })" class="button small">삭제</button></td>
															</tr>
														</c:forEach>
														<script>
															function reviewBtn(sfno){ //참여한 게시물 삭제 버튼 
																alert("후기를 삭제합니다.");
																location.href="/mypage/deleteSReview?sfno="+sfno;
															}
														</script>
													</tbody>
												</table>
												<div>
													<ul class="pagination">
														<!-- 첫페이지로 이동 -->
														<c:if test="${pageDto.page !=1 }">
															<a href="/mypage/myClubJoin?page=1" class="button"><li class="page1">처음으로</li></a>
														</c:if>
														<c:if test="${pageDto.page==1 }">
															<li class="page1"><span class="button disabled">처음으로</span></li>
														</c:if>
														<!-- 이전페이지 이동 -->
														<c:if test="${pageDto.page>1 }">
															<a href="/mypage/myClubJoin?page=${pageDto.page-1 }" class="button"><li class="page1">이전</li></a>
														</c:if>
														<c:if test="${pageDto.page==1 }">
								 							<li class="page1"><span class="button disabled">이전</span></li>
														</c:if>
														
														
														<!-- 페이지 리스트 -->
														<c:forEach var="num" begin="${pageDto.startPage}" end="${pageDto.endPage }" step="1">
															<c:if test="${num != pageDto.page }">
																<a href="/mypage/myClubJoin?page=${num }">
																	<li class="page"><div>${num }</div></li>
																</a>
															</c:if>
															<c:if test="${num == pageDto.page }">
																<li id="numon" class="page active"><div>${num }</div></li>
															</c:if>
														</c:forEach>
														
														<!-- 다음페이지 이동 -->
														<c:if test="${pageDto.page<pageDto.maxPage }">
															<a href="/mypage/myClubJoin?page=${pageDto.page+1 }" class="button"><li class="page1">다음</li></a>
														</c:if>
														<c:if test="${pageDto.page==pageDto.maxPage }">
															<li class="page1"><span class="button disabled">다음</span></li>
															
														</c:if>
														<!-- 끝페이지 이동 -->
														<c:if test="${pageDto.page!=pageDto.maxPage }">
															<a href="/mypage/myClubJoin?page=${pageDto.maxPage }" class="button"><li class="page1">끝으로</li></a>
														</c:if>
														<c:if test="${pageDto.page==pageDto.maxPage }">
															<li class="page1"><span class="button disabled">끝으로</span></li>
														</c:if>
													</ul>
												</div>
												
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