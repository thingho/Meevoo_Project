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
		<title>myprofil</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../css/main.lee.css" />
		<link rel="stylesheet" href="../css/profil.lee.css">
		<!-- 제이쿼리 최신 -->
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<style>
			#all1{width:900px; border:1px solid #f56a6a; margin:0 auto;}
			.section1{color: black;}
			.main1{width:400px; margin:0 auto;}
			.main1 h2{margin: 35px 0 35px 0; text-align: center; border-bottom: 1px solid lightgray; font-size: 40px;}
			.profile{border-bottom:1px dotted #f56a6a; height: 200px; text-align: center; margin:20px 0;}
			#preview1{margin:0 0 20px; height: 100%;}
			#preview2{height: 100%;}
			/* #preview1 img{width:150px;} */
			#preview2 img{width:150px; margin: 0 0 0;}
			.info1{width:100%; height: 60%;}
			#info11, #info12, #info13, #info14{width:100%; height:25%; bottom:0px; margin:0 auto;}
			#info15, #info16{width:100%; height:80px; bottom:0px; margin:0 auto;}
			#name1, #id1,#gender1,#pw1,#age1,#email1,#temp1,#join1,#nicknm1,#blank1,#dong1,#exercise1
				{width:50%; height:100%; padding:0 0 0 50px; font-size:15px; float:left;}
			#intro1{width:100%; height:100%; padding:0 0 0 25px; font-size:15px; float:left;}
			#name2,#id2,#gender2,#pw2,#age2,#email2,#temp2,#join2,#nicknm2,#blank2,
			#dong2,#exercise2{height:100%; padding:6%; }
			#intro2{height:100%; padding:3% 6% 0; }
			#intro3{height:100%; padding:0 6% 0; }
			
			.wrapper1{width:800px; height:500px; margin:0 auto;}
			.wrapper2{border-top:1px dotted #f56a6a; width:800px; height:400px; margin:10px auto;}
			.info2 .info3{width:100%; height: 60%; margin:10px 50px 10px 50px; font-size:15px; display: inline-block; line-height: 40px;}
			.info3 select{width:200px; float:right; font-size:15px;}
			.nic2{width:700px; margin:10px 50px 10px 50px; font-size:15px; display: flex;}
			.cell{margin:10px 50px 0 50px; font-size:15px;}
			.subject{margin: 5px;}
			#textbox{height: 170px; resize:none;}
			.btnArea{margin:50px 0 0; padding:0 0 20px 0;}
			.bCenter li{width:79.19px; height: 28px; margin: 0 auto;}
			#edit{padding:0;}
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
								<section class="section1">
									<form action="/mypage/updateSaveUser" name="memberFrm" method="post" enctype="multipart/form-data">
									<div id="all1">
										<div id="header1">
											<header class="main1">
												<h2>내 정보 수정하기</h2>
											</header>
										</div>
										
										<div class="wrapper1">
										<!-- 프로필 사진 넣는 부분 -->
											<div class="profile">
												<div id="preview1" class="img">
				                                   	<div>
				                                   	<c:if test="${mdto.userimg == null }">
				                                   		<img src="https://cdn-icons-png.flaticon.com/512/848/848043.png" width="150px"/>
				                                   		<input type="file" name="file" accept=".jpg, .png, .jpeg, .bmp, .tif, .gif, .svg"/>
														<label for="file">* 파일 선택을 눌러 프로필 사진을 수정해주세요</label>
				                                   	</c:if>
													<c:if test="${mdto.userimg != null }">
				                                   		<img src="/upload/${mdto.userimg }" width="150px"/>
				                                   		<input type="hidden" name="userimg" value="${mdto.userimg}" />
				                                   		<input type="file" name="file" accept=".jpg, .png, .jpeg, .bmp, .tif, .gif, .svg"/>
														<label for="file">* 파일 선택을 눌러 프로필 사진을 수정해주세요</label>
				                                   	</c:if>
													<%-- <c:if test="${file == null}">
				                                   		<img src="https://cdn-icons-png.flaticon.com/512/848/848043.png"/>
				                                   		<input type="file" name="file" accept=".jpg, .png, .jpeg, .bmp, .tif, .gif, .svg"/>
														<label for="file">* 파일 선택을 눌러 프로필 사진을 수정해주세요</label>
				                                   	</c:if> --%>
				                                   	</div>
			                                   	</div>
											</div>
											<div class="info1">
												<div id="info11">
													<div id="name1">
														<div id="name2">이름&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														&nbsp;&nbsp;&nbsp;:
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${mdto.usernm }</div>
													</div>
													<div id="id1">	
														<div id="id2">아이디&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
														<input type="hidden" name="id" value="${mdto.id }" />
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${mdto.id }</div>
													</div>
												</div>
												<div id="info12">
													<div id="gender1">
														<div id="gender2">성별&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														&nbsp;&nbsp;&nbsp;:
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${mdto.gender }</div>
													</div>
													<div id="pw1">	
														<div id="pw2">비밀번호&nbsp;&nbsp;&nbsp;&nbsp;:
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${mdto.pw }</div>
													</div>
												</div>
												<div id="info13">
													<div id="age1">
														<div id="age2">나이&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
														&nbsp;&nbsp;&nbsp;:
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${mdto.birth } 년생</div>
													</div>
													<div id="email1">
														<div id="email2">이메일&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${mdto.email }</div>
													</div>
												</div>
												<div id="info14">
													<div id="temp1">
														<div id="temp2">내 온도&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
														&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${mdto.totaltemp }℃</div>
													</div>
													<div id="join1">
														<div id="join2">가입일자&nbsp;&nbsp;&nbsp;&nbsp;:
														<td>
															&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
															<fmt:formatDate value="${mdto.joindate}" pattern="yyyy-MM-dd" />
														</td>
														</div>
													</div>
												</div>
											</div>
										</div>
										
										<div class="wrapper2">
											<div id="info15">
												<div id="nicknm1">
													<div id="nicknm2">닉네임&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													&nbsp;: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
													<input type="text" name="nicknm" value="${mdto.nicknm }"/></div>
												</div>
												<div id="blank1">
													<div id="blank2">&nbsp;</div>
												</div>
											</div>
											<div id="info16">
												<div id="dong1">
													<div id="dong2">관심지역&nbsp;&nbsp;&nbsp;&nbsp;: 
														<select id="dongcate" name="dongcate">
															<%-- <option value=''  id="mem_addr">${mdto.dongcate }</option> --%>
															
															<c:if test="${mdto.dongcate == '오류동' }">
															<option name="dongcate" class="dong1" value="오류동" selected="selected">오류동</option>
															</c:if>															
															<c:if test="${mdto.dongcate != '오류동' }">
															<option name="dongcate" class="dong1" value="오류동">오류동</option>
															</c:if>	
															
															<c:if test="${mdto.dongcate == '궁동' }">
															<option name="dongcate" class="dong2" value="궁동" selected="selected">궁동</option>
															</c:if>															
															<c:if test="${mdto.dongcate != '궁동' }">
															<option name="dongcate" class="dong2" value="궁동">궁동</option>
															</c:if>	
															
															<c:if test="${mdto.dongcate == '구로동' }">
															<option name="dongcate" class="dong3" value="구로동" selected="selected">구로동</option>
															</c:if>															
															<c:if test="${mdto.dongcate != '구로동' }">
															<option name="dongcate" class="dong3" value="구로동">구로동</option>
															</c:if>	
															
															<c:if test="${mdto.dongcate == '고척동' }">
															<option name="dongcate" class="dong4" value="고척동" selected="selected">고척동</option>
															</c:if>															
															<c:if test="${mdto.dongcate != '고척동' }">
															<option name="dongcate" class="dong4" value="고척동">고척동</option>
															</c:if>	
															
															<c:if test="${mdto.dongcate == '가리봉동' }">
															<option name="dongcate" class="dong5" value="가리봉동" selected="selected">가리봉동</option>
															</c:if>															
															<c:if test="${mdto.dongcate != '가리봉동' }">
															<option name="dongcate" class="dong5" value="가리봉동">가리봉동</option>
															</c:if>	
															
															<c:if test="${mdto.dongcate == '개봉동' }">
															<option name="dongcate" class="dong6" value="개봉동" selected="selected">개봉동</option>
															</c:if>															
															<c:if test="${mdto.dongcate != '개봉동' }">
															<option name="dongcate" class="dong6" value="개봉동">개봉동</option>
															</c:if>	
															
															<c:if test="${mdto.dongcate == '항동' }">
															<option name="dongcate" class="dong7" value="항동" selected="selected">항동</option>
															</c:if>															
															<c:if test="${mdto.dongcate != '항동' }">
															<option name="dongcate" class="dong7" value="항동">항동</option>
															</c:if>	
															
															<c:if test="${mdto.dongcate == '신도림동' }">
															<option name="dongcate" class="dong8" value="신도림동" selected="selected">신도림동</option>
															</c:if>															
															<c:if test="${mdto.dongcate != '신도림동' }">
															<option name="dongcate" class="dong8" value="신도림동">신도림동</option>
															</c:if>	
															
														</select>
													</div>
												</div>
												<div id="exercise1">
													<div id="exercise2">관심운동&nbsp;&nbsp;&nbsp;&nbsp;: 
														<select id="scate" name="scate">
														
															<%-- <option value='scate' id="mem_exercise">${mdto.scate }</option> --%>
																
																<c:if test="${mdto.scate == '스케이트' }">
																<option name="scate" class="skate" value="스케이트" selected="selected">스케이트</option>
																</c:if>															
																<c:if test="${mdto.scate != '스케이트' }">
																<option name="scate" class="skate" value="스케이트">스케이트</option>
																</c:if>	
																														
																<c:if test="${mdto.scate == '골프' }">
																<option name="scate" class="golf" value="골프" selected="selected">골프</option>
																</c:if>															
																<c:if test="${mdto.scate != '골프' }">
																<option name="scate" class="golf" value="골프">골프</option>
																</c:if>
																															
																<c:if test="${mdto.scate == '배드민턴' }">
																<option name="scate" class="badminton" value="배드민턴" selected="selected">배드민턴</option>
																</c:if>															
																<c:if test="${mdto.scate != '배드민턴' }">
																<option name="scate" class="badminton" value="배드민턴">배드민턴</option>
																</c:if>
																															
																<c:if test="${mdto.scate == '테니스' }">
																<option name="scate" class="tennis" value="테니스" selected="selected">테니스</option>
																</c:if>															
																<c:if test="${mdto.scate != '테니스' }">
																<option name="scate" class="tennis" value="테니스">테니스</option>
																</c:if>	
																														
																<c:if test="${mdto.scate == '탁구' }">
																<option name="scate" class="pingpong" value="탁구" selected="selected">탁구</option>
																</c:if>															
																<c:if test="${mdto.scate != '탁구' }">
																<option name="scate" class="pingpong" value="탁구">탁구</option>
																</c:if>
																															
																<c:if test="${mdto.scate == '풋살' }">
																<option name="scate" class="footsal" value="풋살" selected="selected">풋살</option>
																</c:if>															
																<c:if test="${mdto.scate != '풋살' }">
																<option name="scate" class="footsal" value="풋살">풋살</option>
																</c:if>
																															
																<c:if test="${mdto.scate == '농구' }">
																<option name="scate" class="basketball" value="농구" selected="selected">농구</option>
																</c:if>															
																<c:if test="${mdto.scate != '농구' }">
																<option name="scate" class="basketball" value="농구">농구</option>
																</c:if>
																														
																<c:if test="${mdto.scate == '볼링' }">
																<option name="scate" class="bowling" value="볼링" selected="selected">볼링</option>
																</c:if>															
																<c:if test="${mdto.scate != '볼링' }">
																<option name="scate" class="bowling" value="볼링">볼링</option>
																</c:if>
																															
																<c:if test="${mdto.scate == '클라이밍' }">
																<option name="scate" class="climbing" value="클라이밍" selected="selected">클라이밍</option>
																</c:if>															
																<c:if test="${mdto.scate != '클라이밍' }">
																<option name="scate" class="climbing" value="클라이밍">클라이밍</option>
																</c:if>														
														</select>
													</div>
												</div>
											</div>
											
											<div id="info17">
												<div id="intro1">
													<div id="intro2">자기소개</div>
													<div id="intro3">
														<textarea id="textbox" name="selfintro" value="${mdto.selfintro }">${mdto.selfintro }</textarea>
													</div>
												</div>
											</div>
										</div>
	
									</div>
									<!-- Btn Area -->
									<div class="btnArea">
										<div class="bCenter">
											<ul>
												<li><button id="edit" type="button" style="cursor:pointer;" onclick="memberBtn()" class="button small fit">수정완료</button></li>
											</ul>
											<script>
												function memberBtn(){
													if(confirm("수정을 하시겠습니까?")){
														alert("수정완료!");
														memberFrm.submit();
													}else{
														return false;
													}
												}
											</script>
										</div>
									</div>
									<!-- //Btn Area -->
									</form>
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