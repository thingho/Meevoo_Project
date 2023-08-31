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
		<link rel="stylesheet" href="../css/login.lee.css" /> 
		<link rel="stylesheet" href="../css/content.lee.css" />
		<link rel="stylesheet" href="../css/profil.lee.css">
		<!-- 제이쿼리 최신 -->
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<style>
			#all1{width:900px; border:1px solid #f56a6a; margin:0 auto;}
			.section1{color: black;}
			.main1{width:200px; margin:0 auto;}
			.main1 h2{margin: 35px 0 35px 0; text-align: center; border-bottom: 1px solid lightgray; font-size: 40px;}
			.profile{border-bottom:1px dotted #f56a6a; height: 180px; text-align: center; margin:20px 0;}
			#preview{margin:0 0 20px;}
			#preview img{width:150px;}
			.info1{width:100%; height: 60%;}
			#info11, #info12, #info13, #info14{width:100%; height:25%; bottom:0px; margin:0 auto;}
			#info15, #info16{width:100%; height:80px; bottom:0px; margin:0 auto;}
			#name1, #id1,#gender1,#pw1,#age1,#email1,#temp1,#join1,#nicknm1,#blank1,#dong1,#exercise1
				{width:50%; height:100%; padding:0 0 0 50px; font-size:15px; float:left;}
			#intro1{width:100%; height:100%; padding:0 0 0 25px; font-size:15px; float:left;}
			#name2,#id2,#gender2,#pw2,#age2,#email2,#temp2,#join2,#nicknm2,#blank2,
			#dong2,#exercise2,#intro2{width:100%; height:100%; padding:6%; }
			
			.wrapper1{width:800px; height:500px; margin:0 auto;}
			.wrapper2{border-top:1px dotted #f56a6a; width:800px; height:400px; margin:10px auto;}
			.info2 .info3{width:100%; height: 60%; margin:10px 50px 10px 50px; font-size:15px; display: inline-block; line-height: 40px;}
			.nic2{width:700px; margin:10px 50px 10px 50px; font-size:15px; display: flex;}
			.cell{margin:10px 50px 0 50px; font-size:15px;}
			.subject{margin: 5px;}
			#textbox{height: 170px; resize:none;}
			.btnArea{margin:50px 0 0; padding:0 0 20px 0;}
			.bCenter li{width:79.19px; height: 28px; margin: 0 auto;}
			
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
									<form action="" name="memberFrm" method="post">
									<div id="all1">
										<div id="header1">
											<header class="main1">
												<h2>내 정보</h2>
											</header>
										</div>
										
										<div class="wrapper1">
										<!-- 프로필 사진 넣는 부분 -->
											<div class="profile">
												<c:if test="${mdto.userimg == null }">
			                                   		<img src="https://cdn-icons-png.flaticon.com/512/848/848043.png" width="150px"/>
			                                   	</c:if>
												<c:if test="${mdto.userimg != null }">
			                                   		<img src="/upload/${mdto.userimg }" width="150px"/>
			                                   	</c:if>
			                                   	
			                                    <%-- <div id="preview" class="profile-img"><img src="${mdto.userimg}"></div> --%> <!-- DB에 주소로 저장된 내용 불러옴 -->
			                                    <%-- <input type="hidden" id="preview" class="profile-img" src="${mdto.userimg}"/> --%> <!-- 사진을 수정하고 DB에 입력한 이미지 불러옴 -->
												
												
												<%-- <div id="preview" class="profile-img"><img src="/images/${mdto.userimg}"></div> --%>
												<!-- <input type="file" name="mb_picture" accept=".jpg, .png, .jpeg, .bmp, .tif, .gif, .svg" id="profile-photo" />
												<label for="profile-photo">프로필 사진 수정</label> -->
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
													<div id="nicknm2">닉네임&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;:
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${mdto.nicknm }</div>
												</div>
												<div id="blank1">
													<div id="blank2">&nbsp;</div>
												</div>
											</div>
											<div id="info16">
												<div id="dong1">
													<div id="dong2">관심지역&nbsp;&nbsp;&nbsp;&nbsp;:
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${mdto.dongcate }</div>
												</div>
												<div id="exercise1">
													<div id="exercise2">관심운동&nbsp;&nbsp;&nbsp;&nbsp;:
													&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${mdto.scate }</div>
												</div>
											</div>
											
											<div id="info17">
												<div id="intro1">
													<div id="intro2">자기소개&nbsp;&nbsp;&nbsp;&nbsp;:
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${mdto.selfintro }</div>
												</div>
											</div>
										</div>
	
									</div>
									
									
									<!-- Btn Area -->
									<div class="btnArea">
										<div class="bCenter">
											<ul>
												<!-- form 을 사용했을때 button 에서 type=button 을 안넣으면 다시 이 페이지를 돌기때문에 href가 안먹힌다. -->
												<li><button type="button" style="cursor:pointer; margin: 0 auto;" onclick="EditBtn()" class="button small fit">수정</button></li>
												<li><button type="button" style="cursor:pointer; margin: 0 auto;" onclick="DeleteBtn()" class="button primary small fit">탈퇴</button></li>
											</ul>
											<script type="text/javascript">
												function EditBtn(){
													if(confirm("수정페이지로 이동합니다.")){
														//alert("test");
														location.href="/mypage/myProfilEdit";
													}else{
														return false;
														
													}
													
												}
											</script>
											<script>
												function DeleteBtn(){
													if(confirm("진짜로 탈퇴하시겠습니까?")){
														alert("${mdto.id}");
														location.href="/member/deleteUser?id=${mdto.id}";
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