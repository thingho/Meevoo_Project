<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
if("${loginCheck}"== "success"){
	alert("${sessionName}님 로그인 되었습니다.");
}

function logoutBtn(){
	alert("로그아웃이 되었습니다.");
	location.href="/member/logout";
}

</script>

<!-- Header -->
<header id="header">
	<a href="/main" class="logo"><strong>Meevoo</strong></a>
	<ul class="icons">
		<c:if test="${sessionId == null }">
			<li><a href="/member/login">LOGIN</a></li>
			<li><a href="/member/agree">JOIN</a></li>
			
			
		</c:if>
		<c:if test="${sessionId != null }">
			<li><a href="#">${sessionNicknm }님 환영합니다!</a></li>
			<li><a onclick="logoutBtn()" style="cursor:pointer;">LOGOUT</a></li>
			<c:if test="${sessionId == 'admin' }">
				<li><a href="/admin/adminStatic">Admin</a></li>
			</c:if>
		</c:if>
	
	</ul>
</header>