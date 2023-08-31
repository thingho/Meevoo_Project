<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>모임장소 찾기</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
							<%@ include file="../top.jsp" %>

							<!-- Content -->
								<section>
									<header class="main">
										<h1>모임장소 찾기</h1>
									</header>
								</section>
									
							<!-- 		
							Search
								<section id="search" class="alt">
									<form method="post" action="#">
										<input type="text" name="query" id="query" placeholder="키워드를 검색하세요." />
									</form>
								</section>

							지도를 표시할 div 입니다
								<div id="map" style="width: 100%; height: 350px;"></div>
							
								<script type="text/javascript"
									src="//dapi.kakao.com/v2/maps/sdk.js?appkey=f8bdf42277d512cacec989b9a12be5a8"></script>
								<script>
									var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
									mapOption = {
										center : new kakao.maps.LatLng(37.50534965, 126.8511775), // 지도의 중심좌표
										level : 3
									// 지도의 확대 레벨
									};
							
									// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
									var map = new kakao.maps.Map(mapContainer, mapOption);
									
									// 마커가 표시될 위치입니다 
									var markerPosition  = new kakao.maps.LatLng(37.50534965, 126.8511775); 
						
									// 마커를 생성합니다
									var marker = new kakao.maps.Marker({
									    position: markerPosition
									});
						
									// 마커가 지도 위에 표시되도록 설정합니다
									marker.setMap(map);
						
								</script>
								 -->
								
									<hr class="major" />

									<h2 style="margin-bottom: 2em">체육시설 목록</h2>
									<!-- Table -->
									<div class="table-wrapper">
										<table>
											<colgroup>
												<col width="10%"  />
												<col width="*" />
												<col width="15%" />
												<col width="15%"/>
												<col width="10%"/>
											</colgroup>
											<thead>
												<tr>
													<th>NO.</th>
													<th>시설명</th>
													<th>운동종목</th>
													<th>동이름</th>
													<th>별점</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="sport" items="${list}">
												<tr>
													<td>${sport.sfno}</td>
													<td>
														<a href="/sport/sportListView?sfno=${sport.sfno}&page=${page}" class="lightgray">${sport.sfnm}</a>
													</td>
													<td>${sport.scate}</td>
													<td>${sport.dongcate}</td>
													<td>${sport.savgstar}</td>
												</tr>
												</c:forEach>
											</tbody>
										</table>
										<!-- // Table -->
										
										<!-- 하단 넘버링 버튼 -->
										<div class="col-12" style="margin: 150px auto; text-align: center;">
											<ul class="pagination">
											    <!-- 첫 페이지 이동 -->
											    <c:if test="${pageDto.page !=1}">
												  <li>
												    <a href="/club/cWriteSearchSF?page=1" class="button">
												      <img src="../images/general/pageFirst.png" style="width:15px; vertical-align: middle;" />
												    </a>
												  </li>
											    </c:if>
											    <c:if test="${pageDto.page ==1}">
												  <li>
												    <span class="button disabled">
												      <img src="../images/general/pageFirst.png" style="width:15px; vertical-align: middle;" />
												    </span>
												  </li>
											    </c:if>
												<!-- 첫 페이지 이동 끝-->
												<!-- 이전 페이지 이동 -->
												<c:if test="${pageDto.page>1}">
												  <li>
												    <a href="/club/cWriteSearchSF?page=${pageDto.page-1}" class="button">
												      <img src="../images/general/pagePrevious.png" style="width:15px; vertical-align: middle;" />
												    </a>
												  </li>
												</c:if>
												<c:if test="${pageDto.page==1}">
												  <li>
												    <span class="button disabled">
												      <img src="../images/general/pagePrevious.png" style="width:15px; vertical-align: middle;" />
												    </span>
												  </li>
												</c:if>
												<!-- 이전 페이지 이동 끝 -->
												<!-- 페이지 리스트 -->
												<c:forEach var="num" begin="${pageDto.startPage}" end="${pageDto.endPage}" step="1" >
												  <c:if test="${num != pageDto.page}" >
												    <li><a href="/club/cWriteSearchSF?page=${num}" class="page">${num}</a></li>
												  </c:if>
												  <c:if test="${num == pageDto.page}" >
												    <li><a href="/club/cWriteSearchSF?page=${num}" class="page active">${num}</a></li>
												  </c:if>
												</c:forEach>
												<!-- 페이지 리스트 끝-->
												<!-- 다음 페이지 이동 -->
												<c:if test="${pageDto.page<pageDto.maxPage}">
												  <li>
												    <a href="/club/cWriteSearchSF?page=${pageDto.page+1}" class="button">
												      <img src="../images/general/pageNext.png" style="width:15px; vertical-align: middle;" />
												    </a>
												  </li>
												</c:if>
												<c:if test="${pageDto.page==pageDto.maxPage}">
												  <li>
												    <span class="button disabled">
												      <img src="../images/general/pageNext.png" style="width:15px; vertical-align: middle;" />
												    </span>
												  </li>
												</c:if>
												<!-- 다음 페이지 이동 끝-->
												<!-- 끝 페이지 이동 -->
											    <c:if test="${pageDto.page != pageDto.maxPage}">
												  <li>
												    <a href="/club/cWriteSearchSF?page=${pageDto.maxPage}" class="button">
												      <img src="../images/general/pageLast.png" style="width:15px; vertical-align: middle;" />
												    </a>
												  </li>
											    </c:if>
											    <c:if test="${pageDto.page == pageDto.maxPage}">
												  <li>
												    <span class="button disabled">
												      <img src="../images/general/pageLast.png" style="width:15px; vertical-align: middle;" />
												    </span>
												  </li>
											    </c:if>
												<!-- 끝 페이지 이동 끝-->
											</ul>
										</div>
										<!-- 하단 넘버링 버튼 끝 -->
										
									  </div>

								

						</div>
					</div>

				



						</div>
							<!-- Footer -->
							<%@ include file="../footer.jsp" %>

		<!-- Scripts -->
			<script src="../js/jquery.min.js"></script>
			<script src="../js/browser.min.js"></script>
			<script src="../js/breakpoints.min.js"></script>
			<script src="../js/util.js"></script>
			<script src="../js/main.js"></script>

	</body>
</html>