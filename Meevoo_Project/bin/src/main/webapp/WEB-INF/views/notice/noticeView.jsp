<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>공지사항 상세페이지</title>
		<!-- 제이쿼리 최신 -->
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../css/main_kmh.css" />
	<script>
		function deleteBtn() {
			if (confirm("게시글을 삭제하시겠습니까?")) {
				location.href = "noticeDelete?notino=${ndto.notino}";
			}
		}
	</script>
</head>
	<body class="is-preload">
		

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Top -->
							<%@ include file="../top.jsp" %>


							<!-- Section -->
								<section class="noticelistview">
									<!-- 상세설명 css -> main.css(63번째)  -->
									<div class="viewHead">
										<div class="subject">
											<ul>
												<li>공지사항 제목  : ${ndto.notino}. ${ndto.notititle} </li>
											</ul>
										</div>
										
										<div class="day">
											<p class="txt">작성자<span>${ndto.notiid}</span></p>
											<p class="txt">작성일시<span>${ndto.notidate}</span></p>
											<p class="txt">조회수<span>${ndto.notihit}</span></p>
										</div>
										<div class="convenient">
											<p class="txt">${ndto.noticontent}</p>
											<p class="txt">${ndto.notiimg}</p>
											<br>
											<br>
											<br>
											<br>
											<br>
											<br>
											<br>
											<br>
											<br>
											<br>
											<br>
											<br>
											<br>
											
										</div>									
									
									</div>
									<br>
									<!-- Buttons 수정 ->  main.css (1294번째)-->
									<ul class="actions">
									  <c:if test="${sessionId=='admin' }">
										<li><a href="/notice/noticeModify?notino=${ndto.notino}" class="button primary">수정하기</a></li>
										<li><a onclick="deleteBtn()"><button type="button"  class="button primary">삭제하기</button></a></li>
									  </c:if>
										<li><a href="/notice/notice?page=${page}" class="button primary">목록으로</a></li>
									</ul>
								
								
						<br>	
						<%@ include file="../footer.jsp" %>
					 
                  </div>
               </div>

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