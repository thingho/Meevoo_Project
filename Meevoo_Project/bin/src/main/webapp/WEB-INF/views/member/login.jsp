<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
	<head>
		<title>login</title>
		<!-- 제이쿼리 최신 -->
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../css/main.lee.css" />
		<link rel="stylesheet" href="../css/login.lee.css" />
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<style>
			.button{cursor:pointer;}
		</style>
	</head>
	<script>
	if("${loginCheck}"== "fail"){ //jstl 언어 
		alert("아이디 또는 패스워드가 일치하지 않습니다.");
		$(".idType").focus(); //java script 언어
	}
	
    </script>
    <script>
    	function loginBtn(){
    		if($(".idType").val().length<3){ //jquery 구문
    			alert("아이디는 2자리 이상 입력하셔야 합니다.")
    			$(".idtype").focus();
    			return false;
    		}else{
	    		/* alert("환영합니다!!"); */
    			
    		}
    		loginFrm.submit();
    	}
    </script>
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">
						
						<!-- top.jsp -->
						<%@ include file="../top.jsp" %>
						
							<!-- Content -->
								<section>
									
								<p class="tip">Meevoo</p>
								<div class="cont">
									<div class="form sign-in">
									    <h1>환영합니다!</h1>
									    <form action="/member/login" method="post" name="loginFrm">
										    <label>
											    <span>아이디</span>
											    <input type="text" name="id" class="idType"/>
										    </label>
										    <label>
											    <span>비밀번호</span>
											    <input type="password" name="pw" class="passType"/>
										    </label>
										    <p class="forgot-pass">아이디/비밀번호를 잊으셨나요?</p>
										    <button type="button" onclick="loginBtn()" class="button">로그인</button><br>
										    <a href="/member/agree"><button type="button" class="button">회원가입</button></a><br>
										    <button type="button" class="button primary">소셜로그인 <span>구글</span></button>
									    </form>
									</div>
								</div>
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