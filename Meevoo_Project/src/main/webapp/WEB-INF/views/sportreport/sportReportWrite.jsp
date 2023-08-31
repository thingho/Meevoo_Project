<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>체육시설 문의글 작성</title>
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
								function srepwriteBtn(){
									if("${sessionId}"== ""){
										alert("로그인을 하셔야 문의글 작성이 가능합니다.");
										location.href="/member/login";
										return false;
									}
									if($("#sreptitle").val() == ""){
										alert("제목을 입력해주셔야 합니다.");
										$("#sreptitle").focus();
										return false;
									}
									if($("#srepinput").val() == ""){
										alert("내용을 입력해주셔야 합니다.");
										$("#srepinput").focus();
										return false;
									}
									alert("작성한 문의글을 저장합니다.");
									$("#srpwrite").submit();
					          	  
					            }// 문의글 저장
							</script>
							<!-- Section -->
								<section class="sportlistview">
									<!-- 상세설명 css -> main.css(63번째)  -->
									<div class="viewHead">
									  <form action="sportReportWrite" name="srpwrite" id="srpwrite" method="post" enctype="multipart/form-data">
										<div class="day">
											<p class="txt">작성자
											  <span>${sessionId}
												<input type="hidden" name="id" value="${sessionId}" placeholder="ID가 표시됨" />
											  </span>
											</p>
										</div>
										<div class="day">
											<p class="txt">제목
												<input style="width: 300px"; type="text" name="sreptitle" id="sreptitle" placeholder="제목을 입력해주세요." />
											</p>
										</div>
										<div class="day">
											<p class="txt">문의유형
												<select name="srepcontent">
														<option value="폐업한 시설입니다.">폐업한 시설입니다.</option>
														<option value="전화번호가 변경되었습니다.">전화번호가 변경되었습니다.</option>
														<option value="영업시간이 변경되었습니다.">영업시간이 변경되었습니다.</option>
														<option value="위치가 달라졌습니다.">위치가 달라졌습니다.</option>
														<option value="기타 요청사항">기타 요청사항</option>
												</select>
											</p>
										</div>
										<div class="day" >
											<p class="txt">해당시설번호
												<select name="sfno">
													<c:forEach var="sportlist" items="${list}">
														<option value="${sportlist.sfno}" <c:if test="${param.sfno == sportlist.sfno }"> selected</c:if>  >${sportlist.sfno}</option>
													</c:forEach>
												</select>
											</p>
										</div>
										<div class="day">
											<p class="txt">내용
												<textarea name="srepinput" id="srepinput" cols="110" rows="10" style="resize:none;" placeholder="내용을 입력해주세요."></textarea>
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
									<button type="button" class="button primary" id="srpwrite" onclick="srepwriteBtn()">저장</button>
									<button type="button" class="button" onclick="javascript:location.href='sportReportList'">취소</button>
									</if>
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