<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>체육시설 문의글</title>
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
											<h1>체육시설 문의</h1>
											<p>체육시설에 대한 문의글을 작성해주세요.</p>
										</header>
									</div>
									<!-- 이미지 크기 조정 -> main.css 2167번째 -->
									<span class="fclty2">
										<img src="/images/fclty2.jpg" alt="" />
									</span>
								</section>
								<!-- // Banner -->
								
								
								<!-- 문의글 검색 클릭시 -->
								<script>
							    	function repsearchBtn(){
							    		if($("#srep_word").val().length<2){
							    			alert("2글자 이상 입력하셔야 합니다.")
							    			$("#srep_word").focus();
							    			return false;
							    		}
							    		
							    		repsearch.submit();
							    	}
							    </script>
								<!-- 시설 검색바  -->
								<section class="searchBar">
									<div class="sportListSearch" id="sport11">
										<div class="day">
											<form class='searchbutton' method="post" action="/sportreport/sportReportList" name="repsearch"
											style="display:flex; align-items:center; place-content: center; ">
												<select name="category" style="width:200px;">
													<option value="all">전체</option>
											        <option value="sreptitle">제목</option>
											        <option value="srepcontent">문의유형</option>
												</select>
												<input type="text" style="width:400px; margin: 0 0 0 1px;" name="srep_word" id="srep_word" value="${srep_word}" placeholder="검색어를 입력해주세요." />
												<button type="button" class="button primary" onclick="repsearchBtn()">검색</button>
												<a class="button" href="/sportreport/sportReportList">초기화</a>
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
												<c:forEach var="sportreport" items="${list}">
												<tr>
													<td>${sportreport.srepno}</td>
													<td>${sportreport.srepcontent}</td>
													<td><a href="/sportreport/sportReportListView?srepno=${sportreport.srepno}&page=${page}&category=${category}&srep_word=${srep_word}">${sportreport.sreptitle}</a></td>
													<td>${sportreport.id}</td>
													<td>
													<fmt:formatDate value="${sportreport.srepdate}" pattern="yyyy-MM-dd"/>
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
									         <a href="/sportreport/sportReportList?srepno=${sportreport.srepno}&page=1&category=${category}&srep_word=${srep_word}" class="button"><li><<</li></a>
									        </c:if>
									        <c:if test="${page == 1}">
									         <a class="button disabled"><li><<</li></a>
									        </c:if>
									        <!-- 이전페이지 이동 -->
									        <c:if test="${page>1}">
									          <li><a href="/sportreport/sportReportList?srepno=${sportreport.srepno}&page=${page-1}&category=${category}&srep_word=${srep_word}" class="button">Prev</a></li>
									        </c:if>
										    <c:if test="${page == 1}">
									       	  <li><a class="button disabled">Prev</a></li>
									        </c:if>
									        <!--  -->
									        <!--페이지 리스트-->
									        <c:forEach begin="${startPage}" end="${endPage}" step="1" var="num">
									          <c:if test="${num != page }">
										      	<a>
										      	  <li><a href="/sportreport/sportReportList?srepno=${sportreport.srepno}&page=${num}&category=${category}&srep_word=${srep_word}" class="page">${num}</a></li>
										      	</a>
									      	  </c:if>
									      	  <c:if test="${num == page }">
										      	  <li><a class="page active">${num}</a></li>
									      	  </c:if>
									        </c:forEach>
									        <!--  -->
									        <!-- 다음페이지 이동 -->
									        <c:if test="${page<maxPage}">
									         <li><a href="/sportreport/sportReportList?srepno=${sportreport.srepno}&page=${page+1}&category=${category}&srep_word=${srep_word}" class="button">Next</a></li>
									        </c:if>
									        <c:if test="${page==maxPage}">
									         <li><a class="button disabled">Next</a></li>
									        </c:if>
									        <!-- 끝페이지 이동 -->
									        <c:if test="${page != maxPage}">
									         <a href="/sportreport/sportReportList?srepno=${sportreport.srepno}&page=${maxPage}&category=${category}&srep_word=${srep_word}" class="button"><li>>></li></a>
									        </c:if>
									        <c:if test="${page == maxPage}">
									         <a class="button disabled"><li>>></li></a>
									        </c:if>
										</ul>
										<div style="text-align: right;">
											<a href="sportReportWrite"><button type="button" class="button primary">문의글 작성</button></a>
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