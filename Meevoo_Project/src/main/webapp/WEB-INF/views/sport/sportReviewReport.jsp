<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>체육시설 리뷰글 신고</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../css/main_kmh.css" />
		<!-- 제이쿼리 최신 -->
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	</head>
	<body class="is-preload">
		
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Top -->
							<%@ include file="../top.jsp" %>

							<script>
								function sreReportBtn(){
									if("${sessionId}"== ""){
										alert("로그인을 하셔야 리뷰 신고가 가능합니다.");
										location.href="/member/login";
										return false;
									}
									if($("#srerepinput").val() == ""){
										alert("신고 내용을 입력해주세요.");
										$("#srerepinput").focus();
										return false;
									}
									alert("신고 접수가 완료되었습니다.");
									$("#srerepwrite").submit();
					          	  
					            }// 문의글 수정
							</script>
							<!-- Section -->
								<section class="sportlistview">
									<!-- 상세설명 css -> main.css(63번째)  -->
									<div class="viewHead">
									  <form action="sportReviewReport" name="srerepwrite" id="srerepwrite" method="post" enctype="multipart/form-data">
									  <input type="hidden" name="srerepimg" id="srerepimg" value="이미지 없음"/>
										<div class="day">
											<p class="txt">신고자
											  <span>${sessionId}
												<input type="hidden" name="sessionid" value="${sessionId}"/>
											  </span>
											</p>
										</div>
										<div class="day">
											<p class="txt">리뷰번호
											  <span>${param.sreno}
												<input type="hidden" name="sreno" id="sreno" value="${param.sreno}"/>
											  </span>
											</p>
										</div>
										<div class="day">
											<p class="txt">리뷰 작성자
											  <span>${param.id}
												<input type="hidden" name="id" id="id" value="${param.id}"/>
											  </span>
											</p>
										</div>
										<div class="day">
											<p class="txt">신고유형
												<select name="srerepcontent" id="srerepcontent">
														<option value="스팸홍보/도배글입니다.">스팸홍보/도배글입니다.</option>
														<option value="음란물입니다.">음란물입니다.</option>
														<option value="불법정보를 포함하고 있습니다.">불법정보를 포함하고 있습니다.</option>
														<option value="욕설/생명경시/혐오/차별적 표현입니다.">욕설/생명경시/혐오/차별적 표현입니다.</option>
														<option value="불쾌한 표현이 있습니다.">불쾌한 표현이 있습니다.</option>
														<option value="장소와 관련없는 댓글입니다.">장소와 관련없는 댓글입니다.</option>
														<option value="기타 요청사항">기타 요청사항</option>
												</select>
											</p>
										</div>
										<div class="day">
											<p class="txt">내용
												<textarea name="srerepinput" id="srerepinput" cols="110" rows="10" style="resize:none;" placeholder="신고 내용을 입력해주세요."></textarea>
											</p>
										</div>
									</div>
									<br>
								</section>
								<div style="text-align: right;">
									<button type="button" class="button primary" id="srereport" onclick="sreReportBtn()">제출</button>
									<button type="button" class="button" onclick="javascript:location.href='sportListView?sfno=${param.sfno}&page=${param.page}'">취소</button>
								</div>
							  </form>
								
						<br>	
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