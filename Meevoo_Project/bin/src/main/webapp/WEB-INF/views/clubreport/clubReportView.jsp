<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>모임 신고글 상세페이지</title>
		<!-- 제이쿼리 최신 -->
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../css/main_kmh.css" />
	</head>
	<body class="is-preload">
			
		<script>
		  function cReportDeleteBtn(){
			  if(confirm("게시글을 삭제하시겠습니까?")){
				  alert("${crepno}");
				  location.href="clubReportDelete?crepno=${crepno}";
			  }
		  }
		 
		  
		  
		  
		  
		  
		  
		// 1. 답변 달기
			function answerBtn(){
				if("${sessionId}"!="admin"){
					alert("관리자만 답변 등록이 가능합니다.");
					location.href="/member/login";
					return false;
				}
				
				if($("#crepanContent").val() == ""){
					alert("글을 작성하셔야 답변 등록이 가능합니다.");
					$("#crepanContent").focus();
					return false;
				}
				
				alert("답변 등록이 완료되었습니다.");
				
				//ajax구문
      	  	$.ajax({
      		  url:"/clubreport/answerInsert",
      		  type:"post",
      		data:{"id":"${sessionId}",
  			    "crepno":"${crdto1.crepno}",
  			    "crepancontent":$("#crepanContent").val(),
  		  },
  		  success:function(data){
  			  var dataHtml="";
  			  alert("답변 등록 성공");
  			  alert(crepno);
  			  //하단리뷰 1개 가져오기
  			  console.log(data);
  			  //하단에 리뷰추가코드
  			  dataHtml += "<ul id='"+ data.crepanno +"'>";
  			  dataHtml += "<li class='name'>"+ data.id +"<span>&nbsp;&nbsp;&nbsp;[ "+ moment(data.crepandate).format("YYYY-MM-DD HH:mm:ss") +" ]</span></li>";
   			  dataHtml += "<li class='txt'>"+ data.crepancontent +"</li>";
   			  dataHtml += "<li class='btn'>";
   			  dataHtml += "<a onclick=\"deleteBtn("+data.crepanno+")\" class='button small'>삭제</a>";
   			  dataHtml += "</li>";
   			  dataHtml += "</ul>";
     			  
     			  
     			  $("#answerBox").prepend(dataHtml);  //prepend(위),append(아래),html(모두삭제후 추가)
     			  
     			  //글자삭제
     			  $("#crepanContent").val("");
     			  
     			  //총개수 수정
           	  var annum = Number($("#annum").text())+1;
           	  $("#annum").text(annum);
     			  
     			  
     		  },
     		  error:function(){
     			  alert("실패");
     		  }
     	  });//ajax
		} // 답변 등록
		
		
		// 2. 답변쓴거 삭제하기
		function deleteBtn(crepanno){
     	  if(confirm("리뷰를 삭제하시겠습니까?")){
         	  $.ajax({
         		  url:"/clubreport/answerDelete",
         		  type:"post",
         		  data:{"crepanno":crepanno }, // 답변번호
         		  success:function(data){
         			  alert(crepanno+"번 답변이 삭제되었습니다.");
         			  $("#"+crepanno).remove();  // 삭제
         			  
         			//총개수 수정
             	  	var annum = Number($("#annum").text())-1;
             	 	$("#annum").text(annum);
         		  },
         		  error:function(){
         			  alert("실패");
         		  }
         	  });//ajax
     	  }//if
       }//삭제버튼 -->
		  
		  
		  
		  
		  
		  
		  
		  
		</script>
		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

							<!-- Top -->
							<%@ include file="../top.jsp" %>

							<!-- Section -->
								<section class="sportlistview">
									<!-- 상세설명 css -> main.css(63번째)  -->
									<div class="viewHead">
										<div class="subject">
											<ul>
												<li>${crdto1.crepno}. ${crdto1.creptitle}</span></li>
											</ul>
										</div>
										<div class="day">
											<p class="txt">해당시설 번호<span>${crdto1.crepno}</span></p>
											<p class="txt">문의유형<span>${crdto1.crepcontent}</span></p>
											<p class="txt">작성자<span>${crdto1.id}</span></p>
											<p class="txt">작성일<span><fmt:formatDate value="${crdto1.crepdate}" pattern="yyyy-MM-dd"/></span></p>
										</div>
										<div class="day">
											<p class="txt">내용<span>${crdto1.crepinput}</span></p>
										</div>
										
										<c:if test="${crdto1.crepimg != null}">
										<div class="day">
											<p class="txt">사진<span><br>
											<c:forEach var="image" items="${fn:split(crdto1.crepimg, ',')}">
												<img style="heigth:330px;width:330px" src="/upload/${image}"/>
											</c:forEach>
											</p>
										</div>
										</c:if>
										
									
									</div>
									<br>
									<!-- Buttons 수정   main.css (1294번째)-->
									
									<ul class="actions">
										
											<c:if test="${sessionId == crdto1.id}">
											  <li><a href="clubReportUpdate?crepno=${crdto1.crepno}&page=${pagedto.page}&category=${category}&search_input=${search_input}" class="button primary">수정</a></li>
											  <li><a onclick="cReportDeleteBtn()" class="button">삭제</a></li>
											</c:if>
											<c:if test="${sessionId == 'admin'}">
											  <li><a onclick="cReportDeleteBtn()" class="button">삭제</a></li>
											</c:if>
										
									 
										<li><a href="/clubreport/clubReportList" class="button primary">문의 목록으로</a></li>
									</ul>
									 
								</section>
								
								
								
								
								
								
								
								
								
								
								<!-- 시설 리뷰 -->
								<!-- 리뷰 css -> main.css (78번째) -->
								<section class="clubreview">
									<div class="replyBox" >
										<br>
										<ul>
											<li class="in">
												<li class="name">
												<c:if test="${creanList.size() == 0}"> 답변예정 입니다.</c:if>
												<c:if test="${creanList.size() > 0 }"><span id="annum">${creanList.size()}</span>개의 답변이 달렸습니다.</c:if>
												</li>
												<form name="myform" id="myform" method="post" >
													<div style="display: flex;">
														<textarea type="text" class="crepanContent" id="crepanContent" placeholder="답변을 작성해주세요!" ></textarea>
														  <!-- 버튼 크기 수정 main.css 1644번째 -->
													    <li class="btn"><a onclick="answerBtn()" id="cwrite"  class="button primary large">등록</a></li>
													</div>
												</form>	
											</li>
										</ul>
									</div>
									
								<fieldset>
								
									<div class="replyBox" id="answerBox">
										<!-- 관리자가 쓴 답변  -->
										<c:forEach var="crepanDto" items="${creanList}">
											<ul id="${crepanDto.crepanno}">
												<li class="name">${crepanDto.id}<span>&nbsp;&nbsp;&nbsp;&nbsp;[ ${crepanDto.crepandate} ]</span></li>
												<li class="txt">${crepanDto.crepancontent }</li>
												<!-- 관리자 답변이 아닌경우 버튼노출 안됨 -->
												<!-- sessionId와 sreDto.id가 같을 때만 삭제 노출 -->
												<c:if test="${sessionId == 'admin' }">
													<li class="btn">
														<a onclick="deleteBtn(${crepanDto.crepanno})" class="button small">삭제</a>
													</li>
												</c:if>
											</ul>
										</c:forEach>
									</div>
								</fieldset>
								<!-- //관리자가 쓴 답변  -->
								
								</section>
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
								
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