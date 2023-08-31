<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>모임 신고글 작성</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../css/main_kmh.css" />
		<!-- 제이쿼리 최신 -->
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
	</head>
	<body class="is-preload">
		
		<c:if test="${sessionId == null}">
			<script>
			  alert("로그인을 하셔야 리뷰등록이 가능합니다.");
			  location.href="/member/login";
			</script>
		</c:if>
		
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Top -->
							<%@ include file="../top.jsp" %>
							
							<script>
								function crepwriteBtn(){
									if("${sessionId}"== ""){
										alert("로그인을 하셔야 문의글 작성이 가능합니다.");
										location.href="/member/login";
										return false;
									}
									if($("#crepinput").val() == ""){
										alert("내용을 입력해주셔야 합니다.");
										$("#crepinput").focus();
										return false;
									}
									if($("#creptitle").val() == ""){
										alert("제목을 입력해주셔야 합니다.");
										$("#creptitle").focus();
										return false;
									}
									alert("작성한 문의글을 저장합니다.");
									$("#crepwrite").submit();
					          	  
					            }// 문의글 저장
							</script>
							
							<!-- Section -->
								<section class="sportlistview">
									<!-- 상세설명 css -> main.css(63번째)  -->
									<div class="viewHead">
									  <form action="clubReportWrite" name="crepwrite" id="crepwrite" method="post" enctype="multipart/form-data">
										<div class="day">
											<p class="txt">작성자
											  <span>${sessionId}
												<input type="hidden" name="id" value="${sessionId}" /><!-- placeholder="ID가 표시됨" --> 
											  </span>
											</p>
										</div>
										<div class="day">
											<p class="txt">제목
												<input type="text" name="creptitle" id="creptitle" placeholder="제목을 입력해주세요." />
											</p>
										</div>
										<div class="day">
											<p class="txt">문의유형
												<select name="crepcontent">
														<option value="개인정보 노출 게시물입니다.">개인정보 노출 게시물입니다.</option>
														<option value="불법정보를 포함가고 있습니다.">불법정보를 포함가고 있습니다.</option>
														<option value="불쾌한 표현이 있습니다.">불쾌한 표현이 있습니다.</option>
														<option value="스팸홍보/도배글입니다.">스팸홍보/도배글입니다.</option>
														<option value="욕설/생명경시/혐오/차별적 표현입니다.">욕설/생명경시/혐오/차별적 표현입니다.</option>
														<option value="음란물입니다.">음란물입니다.</option>
														<option value="장소와 관련없는 리뷰 이미지 또는 내용입니다.">장소와 관련없는 리뷰 이미지 또는 내용입니다.</option>
														<option value="청소년에게 유해한 내용입니다.">청소년에게 유해한 내용입니다.</option>
														<option value="기타 요청사항">기타 문의사항</option>
												</select>
											</p>
										</div>
										<div class="day" >
											<p class="txt">해당모임번호
												<select name="cno">
													<c:forEach var="clublist" items="${clist}">
														<option value="${clublist.cno}" <c:if test="${param.cno == clublist.cno }"> selected</c:if>  >${clublist.cno}.${clublist.cnm}</option>
													</c:forEach>
												</select>
											</p>
										</div>
										<div class="day">
											<p class="txt">내용
												<textarea name="crepinput" id="crepinput" cols="110" rows="10" style="resize:none;" placeholder="내용을 입력해주세요."></textarea>
											</p>
										</div>
										<div class="day">
											<p class="txt">이미지
												<input type="file" name="files" id="file1">
											</p>
										</div>
										<div class="day">
											<p class="txt">이미지2
												<input type="file" name="files" id="file2">
											</p>
										</div>
										<div class="day">
											<p class="txt">이미지3
												<input type="file" name="files" id="file3">
											</p>
										</div>
									</div>
									<br>
								</section>
								<div style="text-align: right;">
									<button type="button" class="button primary" id="crepwrite" onclick="crepwriteBtn()">저장</button>
									<button type="button" class="button" onclick="javascript:location.href='sportReportList'">취소</button>
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