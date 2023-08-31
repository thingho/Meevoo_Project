<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>체육시설 문의글 상세페이지</title>
		<!-- 제이쿼리 최신 -->
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../css/main_kmh.css" />
	</head>
	<body class="is-preload">
			
		<script>
		  function srpdeleteBtn(){
			  if(confirm("게시글을 삭제하시겠습니까?")){
				  alert("${srdto.srepno}");
				  location.href="sportReportListDelete?srepno=${srdto.srepno}";
			  }
		  }
		  
		// 1. 답변 달기
			function answerBtn(){
				if($("#srepanContent").val() == ""){
					alert("글을 작성하셔야 답변 등록이 가능합니다.");
					$("#srepanContent").focus();
					return false;
				}
				
				alert("답변 등록이 완료되었습니다.");
				
				//ajax구문
        	  	$.ajax({
        		  url:"/sportreport/answerInsert",
        		  type:"post",
        		data:{"id":"${sessionId}",
    			    "srepno":"${srdto.srepno}",
    			    "srepancontent":$("#srepanContent").val(),
    		  },
    		  success:function(data){
    			  var dataHtml="";
    			  alert("답변 등록 성공");
    			  alert(srepno);
    			  //하단리뷰 1개 가져오기
    			  console.log(data);
    			  //하단에 리뷰추가코드
    			  dataHtml += "<ul id='"+ data.srepanno +"'>";
    			  dataHtml += "<li class='name'>"+ data.id +"<span>&nbsp;&nbsp;&nbsp;[ "+ moment(data.srepandate).format("YYYY-MM-DD HH:mm:ss") +" ]</span></li>";
       			  dataHtml += "<li class='txt'>"+ data.srepancontent +"</li>";
       			  dataHtml += "<li class='btn'>";
       			  dataHtml += "<a onclick=\"deleteBtn("+data.srepanno+")\" class='button small'>삭제</a>";
       			  dataHtml += "</li>";
       			  dataHtml += "</ul>";
       			  
       			  
       			  $("#answerBox").prepend(dataHtml);  //prepend(위),append(아래),html(모두삭제후 추가)
       			  
       			  //글자삭제
       			  $("#srepanContent").val("");
       			  
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
		function deleteBtn(srepanno){
       	  if(confirm("리뷰를 삭제하시겠습니까?")){
           	  $.ajax({
           		  url:"/sportreport/answerDelete",
           		  type:"post",
           		  data:{"srepanno":srepanno }, // 답변번호
           		  success:function(data){
           			  alert(srepanno+"번 답변이 삭제되었습니다.");
           			  $("#"+srepanno).remove();  // 삭제
           			  
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
												<li>${srdto.srepno}. ${srdto.sreptitle}</span></li>
											</ul>
										</div>
										<div class="day">
											<p class="txt" style="font-size: 1.3em;">해당시설 번호<span style="font-size: 20px;">${srdto.sfno}</span></p>
											<p class="txt" style="font-size: 1.3em;">문의유형<span style="font-size: 20px;">${srdto.srepcontent}</span></p>
											<p class="txt" style="font-size: 1.3em;">작성자<span style="font-size: 20px;">${srdto.id}</span></p>
											<p class="txt" style="font-size: 1.3em;">작성일<span style="font-size: 20px;"><fmt:formatDate value="${srdto.srepdate}" pattern="yyyy-MM-dd"/></span></p>
										</div>
										<div class="day"">
											<p class="txt" style="font-size: 1.3em;">내용<span style="font-size: 20px;">${srdto.srepinput}</span></p>
										</div>
										<c:if test="${srdto.srepimg != null}">
										<div class="day">
											<p class="txt">
											<c:forEach var="image" items="${fn:split(srdto.srepimg, ',')}">
												<img style="heigth:650px;width:650px" src="/upload/${image}"/><br>
											</c:forEach>
											</p>
										</div>
										</c:if>
									
									</div>
									<br>
									<!-- Buttons 수정 ->  main.css (1294번째)-->
									<ul class="actions">
											<c:if test="${sessionId == srdto.id}">
											  <li><a href="sportReportUpdate?srepno=${srdto.srepno}&page=${page}&category=${category}&srep_word=${srep_word}" class="button primary">수정</a></li>
											  <li><a onclick="srpdeleteBtn()" class="button">삭제</a></li>
											</c:if>
											<c:if test="${sessionId == 'admin'}">
											  <li><a onclick="srpdeleteBtn()" class="button">삭제</a></li>
											</c:if>
										<li><a href="sportReportList?page=${page}&category=${category}&srep_word=${srep_word}" class="button primary">문의 목록으로</a></li>
									</ul>
								</section>
								
								<!-- 시설 리뷰 -->
								<!-- 리뷰 css -> main.css (78번째) -->
								<section class="sportreview">
									<div class="replyBox" >
										<br>
										<ul>
											<li class="in">
												<li class="name">
												<c:if test="${sreanList.size() == 0}"> 답변예정 입니다.</c:if>
												<c:if test="${sreanList.size() > 0 }"><span id="annum">${sreanList.size()}</span>개의 답변이 달렸습니다.</c:if>
												</li>
												<c:if test="${sessionId == 'admin'}">
												<form name="myform" id="myform" method="post" >
													<div style="display: flex;">
														<textarea type="text" class="srepanContent" id="srepanContent" style="resize:none;" placeholder="답변을 작성해주세요!" ></textarea>
														  <!-- 버튼 크기 수정 main.css 1644번째 -->
													    <li class="btn"><a onclick="answerBtn()" id="swrite"  class="button primary large">등록</a></li>
													</div>
												</form>	
												</c:if>
											</li>
										</ul>
									</div>
									
								<fieldset>
								
									<div class="replyBox" id="answerBox">
										<!-- 관리자가 쓴 답변  -->
										<c:forEach var="srepanDto" items="${sreanList}">
											<ul id="${srepanDto.srepanno}">
												<li class="name">${srepanDto.id}<span>&nbsp;&nbsp;&nbsp;&nbsp;[ ${srepanDto.srepandate} ]</span></li>
												<li class="txt">${srepanDto.srepancontent }</li>
												<!-- 관리자 답변이 아닌경우 버튼노출 안됨 -->
												<!-- sessionId와 sreDto.id가 같을 때만 삭제 노출 -->
												<c:if test="${sessionId == 'admin' }">
													<li class="btn">
														<a onclick="deleteBtn(${srepanDto.srepanno})" class="button small">삭제</a>
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