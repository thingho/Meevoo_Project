<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>모임 신고 게시판</title>
		<!-- 제이쿼리 최신 -->
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../css/main_kmh.css" />
	</head>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Top -->
							<%@ include file="../top.jsp" %>

								<!-- Banner -->
								<section id="banner" class="center-table">
									<div class="content">
										<header class="sportmain">
											<h1>모임 신고 게시판</h1>
											<p>모임에 대한 신고글을 작성해주세요.</p>
										</header>
									</div>
									<!-- 이미지 크기 조정 -> main.css 2167번째 -->
									<span class="fclty2">
										<img src="/images/club2.png" alt="" />
									</span>
								</section>
								<!-- // Banner -->
								
								
								<!-- 문의글 검색 클릭시 -->
								<script>
							    	function clubRepSearchBtn(){
							    		if($("#search_input").val().length<2){
							    			alert("2글자 이상 입력하셔야 합니다.")
							    			$("#search_input").focus();
							    			return false;
							    		}
							    		
							    		clubrepsearch.submit();
							    	}
							    </script>
								<!-- 시설 검색바  -->
								<section class="searchBar">
									<div class="sportListSearch" id="sport11">
										<div class="day">
											<form class='searchbutton' method="post" action="/clubreport/clubReportList" name="clubrepsearch"
											style="display:flex; align-items:center; place-content: center; ">
												<select name="category" style="width:200px;">
													<option value="all">전체</option>
											        <option value="crepcontent">카테고리</option>
											        <option value="id">작성자</option>
												</select>
												<input type="text" style="width:400px; margin: 0 0 0 1px;" name="search_input" id="search_input" value="${search_input}" placeholder="검색어를 입력해주세요." />
												<button type="button" class="button primary small" onclick="clubRepSearchBtn()" style="height: 40px; margin: 0 0 0 1px;">검색</button>
											</form>
										</div>
									</div>
								</section>

								<!-- Section -->
								<section>
									<!-- Table -->
									<div class="table-wrapper">
										<table>
											<colgroup>
												<col width="5%"  />
												<col width="20%"/>
												<col width="*" />
												<col width="15%"/>
												<col width="20%"/>
											</colgroup>
											<thead>
												<tr>
													<th>NO.</th>
													<th>문의유형</th>
													<th>제목</th>
													<th>작성자</th>
													<th>작성일</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="list" items="${list}">
												<tr>
													<td>${list.crepno}</td>
													<td>${list.crepcontent}</td>
													<td><a href="/clubreport/clubReportView?crepno=${list.crepno}&page=${page}&category=${category}&search_input=${search_input}">${list.creptitle}</a></td>
													<td>${list.id}</td>
													<td>
													<fmt:formatDate value="${list.crepdate}" pattern="yyyy-MM-dd"/>
													</td>
												</tr>
												</c:forEach>
											</tbody>
										</table>
										<!-- // Table -->
										
										<!-- 페이지 넘기는 버튼으로 이동하는 옵션 -->
										<!-- main_kmh.css 1398번쨰 줄 수정 -->
										<ul class="pagination" >
											<!-- 첫 페이지 이동 -->
									        <c:if test="${page != 1}">
									         <a href="/clubreport/clubReportList?crepno=${crepno}&page=1&category=${category}&search_input=${search_input}" class="button"><li><<</li></a>
									        </c:if>
									        <c:if test="${page == 1}">
									         <a class="button disabled"><li><<</li></a>
									        </c:if>
									        <!-- 이전페이지 이동 -->
									        <c:if test="${page>1}">
									          <li><a href="/clubreport/clubReportList?crepno=${crepno}&page=${page-1}&category=${category}&search_input=${search_input}" class="button">Prev</a></li>
									        </c:if>
										    <c:if test="${page == 1}">
									       	  <li><a class="button disabled">Prev</a></li>
									        </c:if>
									        <!--  -->
									        <!--페이지 리스트-->
									        <c:forEach begin="${startPage}" end="${endPage}" step="1" var="num">
									          <c:if test="${num != page }">
										      	<a>
										      	  <li><a href="/clubreport/clubReportList?crepno=${crepno}&page=${num}&category=${category}&search_input=${search_input}" class="page">${num}</a></li>
										      	</a>
									      	  </c:if>
									      	  <c:if test="${num == page }">
										      	  <li><a class="page active">${num}</a></li>
									      	  </c:if>
									        </c:forEach>
									        <!--  -->
									        <!-- 다음페이지 이동 -->
									        <c:if test="${page<maxPage}">
									         <li><a href="/clubreport/clubReportList?crepno=${crepno}&page=${page+1}&category=${category}&search_input=${search_input}" class="button">Next</a></li>
									        </c:if>
									        <c:if test="${page==maxPage}">
									         <li><a class="button disabled">Next</a></li>
									        </c:if>
									        <!-- 끝페이지 이동 -->
									        <c:if test="${page != maxPage}">
									         <a href="/clubreport/clubReportList?crepno=${crepno}&page=${maxPage}&category=${category}&search_input=${search_input}" class="button"><li>>></li></a>
									        </c:if>
									        <c:if test="${page == maxPage}">
									         <a class="button disabled"><li>>></li></a>
									        </c:if>
										</ul>
										<div style="text-align: right;">
											<a href="clubReportWrite"><button type="button" class="button primary">문의글 작성</button></a>
										</div>
									</div>
								</section>
								<!-- // Section -->
								
								<!-- Footer -->
								<%@ include file="../footer.jsp" %>

						</div>
					</div>
					<!-- Sidebar -->
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