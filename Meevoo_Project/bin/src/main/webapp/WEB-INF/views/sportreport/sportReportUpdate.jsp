<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>체육시설 문의글 수정</title>
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
								function srepupdateBtn(){
									if($("#sreptitle").val() == ""){
										alert("내용을 입력해주세요.");
										$("#sreptitle").focus();
										return false;
									}
									if($("#srepinput").val() == ""){
										alert("내용을 입력해주세요.");
										$("#srepinput").focus();
										return false;
									}
									$("#srpupdate").submit();
					          	  
					            }// 문의글 수정
							</script>
							<!-- Section -->
								<section class="sportlistview">
									<!-- 상세설명 css -> main.css(63번째)  -->
									<div class="viewHead">
									  <form action="/sportreport/sportReportUpdate" name="srpupdate" id="srpupdate" method="post" enctype="multipart/form-data">
									  	<input type="hidden" name="srepno" value="${srdto.srepno}">
										<div class="day">
											<p class="txt">작성자
											  <span>${sessionId}
												<input type="hidden" name="id" value="${sessionId}"/>
											  </span>
											</p>
										</div>
										<div class="day">
											<p class="txt">제목
												<input style="width: 300px;"type="text" id="sreptitle" name="sreptitle" value="${srdto.sreptitle}" placeholder="제목을 입력해주세요."/>
											</p>
										</div>
										<div class="day">
											<p class="txt">문의유형
												<select name="srepcontent">
													<c:if test="${srdto.srepcontent == '폐업한 시설입니다.'}">
														<option value="폐업한 시설입니다." selected>폐업한 시설입니다.</option>
														<option value="전화번호가 변경되었습니다.">전화번호가 변경되었습니다.</option>
														<option value="영업시간이 변경되었습니다.">영업시간이 변경되었습니다.</option>
														<option value="위치가 달라졌습니다.">위치가 달라졌습니다.</option>
														<option value="기타 요청사항">기타 요청사항</option>
													</c:if>
													<c:if test="${srdto.srepcontent == '전화번호가 변경되었습니다.'}">
														<option value="폐업한 시설입니다.">폐업한 시설입니다.</option>
														<option value="전화번호가 변경되었습니다." selected>전화번호가 변경되었습니다.</option>
														<option value="영업시간이 변경되었습니다.">영업시간이 변경되었습니다.</option>
														<option value="위치가 달라졌습니다.">위치가 달라졌습니다.</option>
														<option value="기타 요청사항">기타 요청사항</option>
													</c:if>
													<c:if test="${srdto.srepcontent == '영업시간이 변경되었습니다.'}">
														<option value="폐업한 시설입니다.">폐업한 시설입니다.</option>
														<option value="전화번호가 변경되었습니다.">전화번호가 변경되었습니다.</option>
														<option value="영업시간이 변경되었습니다." selected>영업시간이 변경되었습니다.</option>
														<option value="위치가 달라졌습니다.">위치가 달라졌습니다.</option>
														<option value="기타 요청사항">기타 요청사항</option>
													</c:if>
													<c:if test="${srdto.srepcontent == '위치가 달라졌습니다.'}">
														<option value="폐업한 시설입니다.">폐업한 시설입니다.</option>
														<option value="전화번호가 변경되었습니다.">전화번호가 변경되었습니다.</option>
														<option value="영업시간이 변경되었습니다.">영업시간이 변경되었습니다.</option>
														<option value="위치가 달라졌습니다." selected>위치가 달라졌습니다.</option>
														<option value="기타 요청사항">기타 요청사항</option>
													</c:if>
													<c:if test="${srdto.srepcontent == '기타 요청사항'}">
														<option value="폐업한 시설입니다.">폐업한 시설입니다.</option>
														<option value="전화번호가 변경되었습니다.">전화번호가 변경되었습니다.</option>
														<option value="영업시간이 변경되었습니다.">영업시간이 변경되었습니다.</option>
														<option value="위치가 달라졌습니다.">위치가 달라졌습니다.</option>
														<option value="기타 요청사항" selected>기타 요청사항</option>
													</c:if>
												</select>
											</p>
										</div>
										<div class="day" >
											<p class="txt">해당시설번호 
												<select name="sfno">
													<option value="${srdto.sfno}" selected>${srdto.sfno}</option>
												</select>
											</p>
										</div>
										<div class="day">
											<p class="txt">내용
												<textarea name="srepinput" id="srepinput" cols="110" rows="10" style="resize:none;">${srdto.srepinput}</textarea>
											</p>
										</div>
										<div class="day">
											<p class="txt"> 기존 이미지 파일명
											  <span>${srdto.srepimg}</span>
											</p>
										</div>
										<div class="day">
											<p class="txt">이미지1
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
									<button type="button" class="button primary" id="srpupdate" onclick="srepupdateBtn()">수정완료</button>
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