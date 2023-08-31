<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
	<head>
		<title>모임 목록</title>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.29.1/moment.min.js"></script>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../css/main_kim.css" />
		<link rel="icon" href="../images/main/logo2.png">
	</head>
	<body class="is-preload">
		<!-- Wrapper -->
			<div id="wrapper">
				<!-- Main -->
					<div id="main">
					    <div style="z-index: 1; background-color: #f56a6a ; box-shadow: 5px 5px 3px #666; cursor: pointer; position: fixed; display: flex; align-items: center; justify-content: center; right: 1em; top: 75%; width:110px; height:110px; border-radius: 50%;"">
					      <a href="/club/cWrite" ><img src="../images/general/write.png" style="width:70px; height:70px; " ></a>
					    </div>
						<div class="inner">
							<!-- Header -->
							<%@ include file="../top.jsp" %>	
							    <!-- Banner -->
								<section id="banner" style="box-sizing: border-box; margin:0.5em; padding:2em 2em 2em 0; height: 250px;">
									<div class="content" style="box-sizing: border-box; weidth: 60%;">
										<header style="vertical-align: center;">
											<h1>운동 모임</h1>
											<h3>나에게 맞는 모임을 찾아보세요.</h3>
											<h4>좌측 사이드 바에서 관심 운동과 관심 지역을 선택할 수 있습니다.</h4>
										</header>
									</div>
									<span class="image object" style="text-align: center; width: 40%; margin: 0;">
										<img src="../images/main/club2.png" style="width: 300px; margin: 0;"/>
									</span>
								</section>
							    <!-- 회원님을 위한 모임추천 -->
								<section>
									<header class="major">
									  <c:if test="${sessionId == null }">
										<h2>회원님을 위한 모임 추천</h2>
									  </c:if>
									  <c:if test="${sessionId != null }">
										<h2>${sessionName } 님을 위한 모임 추천</h2>
									  </c:if>
									</header>
									<div class="featuresRecs">
									  <c:forEach var="club" items="${recsList}">
										  <article>
										      <!-- 운동종목 별 아이콘 영역 -->
									          <a href="/club/cView?cno=${club.cno}" style="text-decoration: none;">
												<span style="margin: 25px;">
												  <c:if test="${club.scate eq '스케이트'}">
												    <img src="../images/sports/iceSkateIcon.png" style="width:150px;" />
												  </c:if>
												  <c:if test="${club.scate eq '골프'}">
												    <img src="../images/sports/golfIcon.png" style="width:150px;" />
												  </c:if>
												  <c:if test="${club.scate eq '배드민턴'}">
												    <img src="../images/sports/badmintonIcon.png" style="width:150px;" />
												  </c:if>
												  <c:if test="${club.scate eq '테니스'}">
												    <img src="../images/sports/tennisIcon.png" style="width:150px;" />
												  </c:if>
												  <c:if test="${club.scate eq '탁구'}">
												    <img src="../images/sports/tableTennisIcon.png" style="width:150px;" />
												  </c:if>
												  <c:if test="${club.scate eq '풋살'}">
												    <img src="../images/sports/futsalIcon.png" style="width:150px;" />
												  </c:if>
												  <c:if test="${club.scate eq '클라이밍'}">
												    <img src="../images/sports/climbingIcon.png" style="width:150px;" />
												  </c:if>
												  <c:if test="${club.scate eq '볼링'}">
												    <img src="../images/sports/bowlingIcon.png" style="width:150px;" />
												  </c:if>
												  <c:if test="${club.scate eq '농구'}">
												    <img src="../images/sports/basketballIcon.png" style="width:150px;" />
												  </c:if>
												</span>
											  </a>
											  <!-- 운동종목 별 아이콘 영역 끝-->
												<!-- 회원님을 위한 모임추천 내용 -->
												<div class="content" style="margin:  0, 0, 100px, 0; width: 100%;">
												 <!-- 회원님을 위한 모임추천 내용 첫줄: 운동종목, 디데이, 상태, 모집인원-->
												 <div style="width:287px;">
												    <span style="display inline-block; padding: 3px; border: 1px; border-radius: 10%; background-color: rgba(244, 244, 244, 0.5); font-weight: bold; ">${club.scate }</span>
												    &nbsp;
												    <jsp:useBean id="nowRecsLoginList" class="java.util.Date" />
												      <fmt:parseNumber value="${nowRecsLoginList.time / (1000*60*60*24)}" integerOnly="true" var="nowfmtTime" scope="request"/>
												      <fmt:parseNumber value="${club.cdodate_date.time / (1000*60*60*24)}" integerOnly="true" var="dbDtParse" scope="request"/>
												    <c:set var="num" value="${nowfmtTime - dbDtParse}" />
												    <c:if test ="${(nowfmtTime - dbDtParse)>0}">
													    <span style="display inline-block; padding: 3px; border: 1px; border-radius: 10%; background-color: rgba(244, 244, 244, 0.5); font-weight: bold; ">
														      D+${nowfmtTime - dbDtParse}
													    </span>
												    </c:if>
												    <c:if test ="${(nowfmtTime - dbDtParse)<0}">
													    <span style="display inline-block; padding: 3px; border: 1px; border-radius: 10%; background-color: #f56a6a; color: #ffffff; font-weight: bold; ">
														      D${nowfmtTime - dbDtParse}
													    </span>
												    </c:if>
												    <c:if test ="${(nowfmtTime - dbDtParse)==0}">
													    <span style="display inline-block; padding: 3px; border: 1px; border-radius: 10%; background-color: #f56a6a33; font-weight: bold; ">
														      D-${nowfmtTime - dbDtParse}
													    </span>
												    </c:if>
												    &nbsp;
												    <c:if test="${club.cnowstatus eq '모집중'}">
												      <span style="display inline-block; padding: 3px; border: 1px; border-radius: 10%; background-color: #f56a6a; color: #ffffff; font-weight: bold; ">${club.cnowstatus }</span>
												    </c:if>
												    <c:if test="${club.cnowstatus eq '모집완료'}">
												      <span style="display inline-block; padding: 3px; border: 1px; border-radius: 10%; background-color: #f56a6a33; font-weight: bold; ">${club.cnowstatus }</span>
												    </c:if>
												    <c:if test="${club.cnowstatus eq '모임완료'}">
												      <span style="display inline-block; padding: 3px; border: 1px; border-radius: 10%; background-color: rgba(244, 244, 244, 0.5); font-weight: bold; ">${club.cnowstatus }</span>
												    </c:if>
												    &nbsp;
												    <span>
													  <img src="../images/general/members.png" style="width:15px" />
													</span>
													<span style="display inline-block; padding: 3px; border: 1px; border-radius: 10%; font-weight: bold; ">${club.cnowrecruit }/${club.crecruitlimit }</span>
												 </div>
													<!-- 회원님을 위한 모임추천 내용 첫줄 끝: 운동종목, 디데이, 상태, 모집인원 -->
													<!-- 회원님을 위한 모임추천 내용 둘째줄: 모임 이름 -->
												    <br>
													<h3>${club.cnm }</h3>
													<!-- 회원님을 위한 모임추천 내용 둘째줄 끝: 모임 이름 -->
													<!-- 회원님을 위한 모임추천 내용 셋째줄 : 모임위치(동이름), 모임일시 -->
													<span>
													  <img src="../images/general/locationPin.png" style="width:10px" />
													</span>
													<span style="display inline-block; padding: 3px; border: 1px; border-radius: 10%; font-weight: bold; ">${club.dongcate }</span>
													&nbsp;
													<span style="display inline-block; padding: 3px; border: 1px; border-radius: 10%; font-weight: bold; ">
													  <fmt:formatDate value="${club.cdodate_date}" type="both" dateStyle ="long" pattern="yy-MM-dd (E)" />
													</span>
													<span style="display inline-block; padding: 3px; border: 1px; border-radius: 10%; font-weight: bold; ">
													  <fmt:formatDate value="${club.cdodate_time}" type="both" dateStyle ="short" pattern="a hh:mm" />
													</span>
													<!-- 회원님을 위한 모임추천 내용 셋째줄 끝: 모임위치(동이름), 모임일시 -->
												</div>
												<!-- 회원님을 위한 모임추천 내용 끝-->
										  </article>
									  </c:forEach>
									</div>
								</section>
							    <!-- 회원님을 위한 모임추천 끝-->
								
								<!-- 회원님을 기다리는 모임들 -->
								<!-- 회원님을 기다리는 모임들_키워드 검색  -->
								<!-- <script>
								  function clubSearchBtn(){
									  alert("키워드 검색을 진행합니다.");
							    	   
							    	  if($("#s_word").val().length<2){
							    		  alert("2글자 이상 입력하셔야 합니다.");
							    		  $("#s_word").focus();
							    		  return false;
							    	  }
							    	  search.submit();
							      }
								</script> -->
								<!-- 회원님을 기다리는 모임들_키워드 검색 끝 -->
								<!-- 회원님을 기다리는 모임들_필터 검색 ajax -->
								<script>
								  function clubFilterBtn() {
									  alert("필터 검색을 진행합니다.");
									  $.ajax({
										  url:"/club/cFilterAjax",
										  type:"post",
										  data:{"dateDifference":$("#dateDifference").val(),
											    "scate":$("input[name='scate']:checked").val(),
											    "cnowstatus":$(".cnowstatus").val()
											    },
						 				  success:function(data) {
						 					console.log("data : "+data);
											var htmlData="";
						 					for(var i = 0; i <data.length; i++) {
												var href="/club/cView?cno="+data[i].id;
												htmlData +='<article>';
												<!-- 운동종목 별 아이콘 영역 -->
												htmlData +='<a href="/club/cView?cno='+data[i].cno+'" style="text-decoration: none;">';
												htmlData +='<span style="margin: 25px;">';
												if(data[i].scate =='스케이트'){
													htmlData +='<img src="../images/sports/iceSkateIcon.png" style="width:150px;" />';
												}
												if(data[i].scate =='골프'){
													htmlData +='<img src="../images/sports/golfIcon.png" style="width:150px;" />';
												}
												if(data[i].scate =='배드민턴'){
													htmlData +='<img src="../images/sports/badmintonIcon.png" style="width:150px;" />';
												}
												if(data[i].scate =='테니스'){
													htmlData +='<img src="../images/sports/tennisIcon.png" style="width:150px;" />';
												}
												if(data[i].scate =='탁구'){
													htmlData +='<img src="../images/sports/tableTennisIcon.png" style="width:150px;" />';
												}
												if(data[i].scate =='풋살'){
													htmlData +='<img src="../images/sports/futsalIcon.png" style="width:150px;" />';
												}
												if(data[i].scate =='클라이밍'){
													htmlData +='<img src="../images/sports/climbingIcon.png" style="width:150px;" />';
												}
												if(data[i].scate =='볼링'){
													htmlData +='<img src="../images/sports/bowlingIcon.png" style="width:150px;" />';
												}
												if(data[i].scate =='농구'){
													htmlData +='<img src="../images/sports/basketballIcon.png" style="width:150px;" />';
												}
												htmlData +='</span>';
												htmlData +='</a>';
												<!-- 운동종목 별 아이콘 영역 끝-->
												<!-- 회원님을 기다리는 모임들 내용 -->
												htmlData +='<div class="content" style="margin:  0, 0, 100px, 0; width: 100%;">';
												<!-- 회원님을 기다리는 모임들 내용 첫줄: 운동종목, 디데이, 상태, 모집인원-->
												htmlData +='<div style="width:287px;">';
												htmlData +='<div style="width:287px;">';
												htmlData +='<span style="display inline-block; padding: 3px; border: 1px; border-radius: 10%; background-color: rgba(244, 244, 244, 0.5); font-weight: bold; ">'+data[i].scate+'</span>';
												htmlData +='&nbsp;';
												<!-- 디데이 -->
												var currentDate = moment(); // 현재 날짜와 시간
												var targetDate = moment(data[i].cdodate_date); // 비교하려는 대상 날짜와 시간
												if (targetDate.isBefore(currentDate, 'day')) {
													  // 지난 날짜인 경우
													  htmlData += '<span style="display inline-block; padding: 3px; border: 1px; border-radius: 10%; background-color: rgba(244, 244, 244, 0.5); font-weight: bold; ">';
													  htmlData += (moment(data[i].cdodate_date).startOf("day+1").fromNow());
													  
													  htmlData += '</span>';
													} else if (targetDate.isSame(currentDate, 'day')) {
													  // 오늘인 경우
													  htmlData += '<span style="display inline-block; padding: 3px; border: 1px; border-radius: 10%; background-color: #f56a6a33; font-weight: bold; ">';
													  htmlData += (moment(data[i].cdodate_date).startOf("day+1").fromNow());
													  htmlData += '</span>';
													} else {
													  // 지나지 않은 날짜인 경우
													  htmlData += '<span style="display inline-block; padding: 3px; border: 1px; border-radius: 10%; background-color: #f56a6a; color: #ffffff; font-weight: bold; ">';
													  htmlData += (moment(data[i].cdodate_date).startOf("day+1").fromNow());
													  htmlData += '</span>';
													}
												<!-- 디데이 끝-->
												htmlData +='&nbsp;';
												if(data[i].cnowstatus =='모집중'){
													htmlData +='<span style="display inline-block; padding: 3px; border: 1px; border-radius: 10%; background-color: #f56a6a; color: #ffffff; font-weight: bold; ">'+data[i].cnowstatus+'</span>';
												}
												if(data[i].cnowstatus =='모집완료'){
													htmlData +='<span style="display inline-block; padding: 3px; border: 1px; border-radius: 10%; background-color: #f56a6a33; font-weight: bold; ">'+data[i].cnowstatus+'</span>';
												}
												if(data[i].cnowstatus =='모임완료'){
													htmlData +='<span style="display inline-block; padding: 3px; border: 1px; border-radius: 10%; background-color: rgba(244, 244, 244, 0.5); font-weight: bold; ">'+data[i].cnowstatus+'</span>'+data[i].cnowstatus+'</span>';
												}
												htmlData +='&nbsp;';
												htmlData +='<span>';
												htmlData +='<img src="../images/general/members.png" style="width:15px" />';
												htmlData +='</span>';
												htmlData +='<span style="display inline-block; padding: 3px; border: 1px; border-radius: 10%; font-weight: bold; ">'+data[i].cnowrecruit+'/'+data[i].crecruitlimit+'</span>';
												htmlData +='</div>';
												<!-- 회원님을 기다리는 모임들 내용 첫줄 끝: 운동종목, 디데이, 상태, 모집인원 -->
												<!-- 회원님을 기다리는 모임들 내용 둘째줄: 모임 이름 -->
												htmlData +='<br>';
												htmlData +='<h3>'+data[i].cnm+'</h3>';
												<!-- 회원님을 기다리는 모임들 내용 둘째줄 끝: 모임 이름 -->
												<!-- 회원님을 기다리는 모임들 내용 셋째줄 : 모임위치(동이름), 모임일시 -->
												htmlData +='<span>';
												htmlData +='<img src="../images/general/locationPin.png" style="width:10px" />';
												htmlData +='</span>';
												htmlData +='<span style="display inline-block; padding: 3px; border: 1px; border-radius: 10%; font-weight: bold; ">'+data[i].dongcate+'</span>';
												htmlData +='&nbsp;';
												
												htmlData +='<span style="display inline-block; padding: 3px; border: 1px; border-radius: 10%; font-weight: bold; ">';
												htmlData +=(moment(data[i].cdodate_date).format("YY-MM-DD ddd"));
												htmlData +='</span>';
												htmlData +='<span style="display inline-block; padding: 3px; border: 1px; border-radius: 10%; font-weight: bold; ">';
												htmlData +=(moment(data[i].cdodate_time).format("HH:mm a"));
												htmlData +='</span>';
												<!-- 회원님을 기다리는 모임들 내용 셋째줄 끝: 모임위치(동이름), 모임일시 -->
												htmlData +='</div>';
												<!-- 회원님을 기다리는 모임들 내용 끝-->
												htmlData +='</article>';
						 					}
						 					$(".featuresAll").html(htmlData);
						 				  }, 
						 				  error:function(){
						 					  alert("모든 항목을 선택해 주세요.");
						 				  }
									  }); //ajax
								  } //clubFilterBtn()
								</script>
								<!-- 회원님을 기다리는 모임들_필터 검색 ajax 끝-->
								<section>
									<header class="major">
										<h2>회원님을 기다리는 모임들</h2>
									</header>
									<!-- 회원님을 기다리는 모임들 목록 -->
									<div class="featuresAll">
									  <c:forEach var="club" items="${list}">
										  <article>
										      <!-- 운동종목 별 아이콘 영역 -->
										      <a href="/club/cView?page=${pageDto.page}&cno=${club.cno}" style="text-decoration: none;">
												<span style="margin: 25px;">
												  <c:if test="${club.scate eq '스케이트'}">
												    <img src="../images/sports/iceSkateIcon.png" style="width:150px;" />
												  </c:if>
												  <c:if test="${club.scate eq '골프'}">
												    <img src="../images/sports/golfIcon.png" style="width:150px;" />
												  </c:if>
												  <c:if test="${club.scate eq '배드민턴'}">
												    <img src="../images/sports/badmintonIcon.png" style="width:150px;" />
												  </c:if>
												  <c:if test="${club.scate eq '테니스'}">
												    <img src="../images/sports/tennisIcon.png" style="width:150px;" />
												  </c:if>
												  <c:if test="${club.scate eq '탁구'}">
												    <img src="../images/sports/tableTennisIcon.png" style="width:150px;" />
												  </c:if>
												  <c:if test="${club.scate eq '풋살'}">
												    <img src="../images/sports/futsalIcon.png" style="width:150px;" />
												  </c:if>
												  <c:if test="${club.scate eq '클라이밍'}">
												    <img src="../images/sports/climbingIcon.png" style="width:150px;" />
												  </c:if>
												  <c:if test="${club.scate eq '볼링'}">
												    <img src="../images/sports/bowlingIcon.png" style="width:150px;" />
												  </c:if>
												  <c:if test="${club.scate eq '농구'}">
												    <img src="../images/sports/basketballIcon.png" style="width:150px;" />
												  </c:if>
												</span>
											  </a>
											  <!-- 운동종목 별 아이콘 영역 끝-->
												<!-- 회원님을 기다리는 모임들 내용 -->
												<div class="content" style="margin:  0, 0, 100px, 0; width: 100%;">
												 <!-- 회원님을 기다리는 모임들 내용 첫줄: 운동종목, 디데이, 상태, 모집인원-->
												 <div style="width:287px;">
												    <span style="display inline-block; padding: 3px; border: 1px; border-radius: 10%; background-color: rgba(244, 244, 244, 0.5); font-weight: bold; ">${club.scate }</span>
												    &nbsp;
												    <jsp:useBean id="nowNow" class="java.util.Date" />
												    <fmt:parseNumber value="${nowNow.time / (1000*60*60*24)}" integerOnly="true" var="nowfmtTime" scope="request"/>
												    <fmt:parseNumber value="${club.cdodate_date.time / (1000*60*60*24)}" integerOnly="true" var="dbDtParse" scope="request"/>
												    <c:set var="num" value="${nowfmtTime - dbDtParse}" />
												    <c:if test ="${(nowfmtTime - dbDtParse)>0}">
													    <span style="display inline-block; padding: 3px; border: 1px; border-radius: 10%; background-color: rgba(244, 244, 244, 0.5); font-weight: bold; ">
														      D+${nowfmtTime - dbDtParse}
													    </span>
												    </c:if>
												    <c:if test ="${(nowfmtTime - dbDtParse)<0}">
													    <span style="display inline-block; padding: 3px; border: 1px; border-radius: 10%; background-color: #f56a6a; color: #ffffff; font-weight: bold; ">
														      D${nowfmtTime - dbDtParse}
													    </span>
												    </c:if>
												    <c:if test ="${(nowfmtTime - dbDtParse)==0}">
													    <span style="display inline-block; padding: 3px; border: 1px; border-radius: 10%; background-color: #f56a6a33; font-weight: bold; ">
														      D-${nowfmtTime - dbDtParse}
													    </span>
												    </c:if>
												    &nbsp;
												    <c:if test="${club.cnowstatus eq '모집중'}">
												      <span style="display inline-block; padding: 3px; border: 1px; border-radius: 10%; background-color: #f56a6a; color: #ffffff; font-weight: bold; ">${club.cnowstatus }</span>
												    </c:if>
												    <c:if test="${club.cnowstatus eq '모집완료'}">
												      <span style="display inline-block; padding: 3px; border: 1px; border-radius: 10%; background-color: #f56a6a33; font-weight: bold; ">${club.cnowstatus }</span>
												    </c:if>
												    <c:if test="${club.cnowstatus eq '모임완료'}">
												      <span style="display inline-block; padding: 3px; border: 1px; border-radius: 10%; background-color: rgba(244, 244, 244, 0.5); font-weight: bold; ">${club.cnowstatus }</span>
												    </c:if>
												    &nbsp;
												    <span>
													  <img src="../images/general/members.png" style="width:15px" />
													</span>
													<span style="display inline-block; padding: 3px; border: 1px; border-radius: 10%; font-weight: bold; ">${club.cnowrecruit }/${club.crecruitlimit }</span>
												 </div>
													<!-- 회원님을 기다리는 모임들 내용 첫줄 끝: 운동종목, 디데이, 상태, 모집인원 -->
													<!-- 회원님을 기다리는 모임들 내용 둘째줄: 모임 이름 -->
												    <br>
													<h3>${club.cnm }</h3>
													<!-- 회원님을 기다리는 모임들 내용 둘째줄 끝: 모임 이름 -->
													<!-- 회원님을 기다리는 모임들 내용 셋째줄 : 모임위치(동이름), 모임일시 -->
													<span>
													  <img src="../images/general/locationPin.png" style="width:10px" />
													</span>
													<span style="display inline-block; padding: 3px; border: 1px; border-radius: 10%; font-weight: bold; ">${club.dongcate }</span>
													&nbsp;
													<span style="display inline-block; padding: 3px; border: 1px; border-radius: 10%; font-weight: bold; ">
													  <fmt:formatDate value="${club.cdodate_date}" type="both" dateStyle ="long" pattern="yy-MM-dd (E)" />
													</span>
													<span style="display inline-block; padding: 3px; border: 1px; border-radius: 10%; font-weight: bold; ">
													  <fmt:formatDate value="${club.cdodate_time}" type="both" dateStyle ="short" pattern="a hh:mm" />
													</span>
													<!-- 회원님을 기다리는 모임들 내용 셋째줄 끝: 모임위치(동이름), 모임일시 -->
												</div>
												<!-- 회원님을 기다리는 모임들 내용 끝-->
											</article>
									  </c:forEach>
										<!-- 하단 넘버링 버튼 -->
										<div class="col-12" style="margin: 150px auto;">
											<ul class="pagination">
											    <!-- 첫 페이지 이동 -->
											    <c:if test="${pageDto.page !=1}">
												  <li>
												    <a href="/club/club?page=1" class="button">
												      <img src="../images/general/pageFirst.png" style="width:15px; vertical-align: middle;" />
												    </a>
												  </li>
											    </c:if>
											    <c:if test="${pageDto.page ==1}">
												  <li>
												    <span class="button disabled">
												      <img src="../images/general/pageFirst.png" style="width:15px; vertical-align: middle;" />
												    </span>
												  </li>
											    </c:if>
												<!-- 첫 페이지 이동 끝-->
												<!-- 이전 페이지 이동 -->
												<c:if test="${pageDto.page>1}">
												  <li>
												    <a href="/club/club?page=${pageDto.page-1}" class="button">
												      <img src="../images/general/pagePrevious.png" style="width:15px; vertical-align: middle;" />
												    </a>
												  </li>
												</c:if>
												<c:if test="${pageDto.page==1}">
												  <li>
												    <span class="button disabled">
												      <img src="../images/general/pagePrevious.png" style="width:15px; vertical-align: middle;" />
												    </span>
												  </li>
												</c:if>
												<!-- 이전 페이지 이동 끝 -->
												<!-- 페이지 리스트 -->
												<c:forEach var="num" begin="${pageDto.startPage}" end="${pageDto.endPage}" step="1" >
												  <c:if test="${num != pageDto.page}" >
												    <li><a href="/club/club?page=${num}" class="page">${num}</a></li>
												  </c:if>
												  <c:if test="${num == pageDto.page}" >
												    <li><a href="/club/club?page=${num}" class="page active">${num}</a></li>
												  </c:if>
												</c:forEach>
												<!-- 페이지 리스트 끝-->
												<!-- 다음 페이지 이동 -->
												<c:if test="${pageDto.page<pageDto.maxPage}">
												  <li>
												    <a href="/club/club?page=${pageDto.page+1}" class="button">
												      <img src="../images/general/pageNext.png" style="width:15px; vertical-align: middle;" />
												    </a>
												  </li>
												</c:if>
												<c:if test="${pageDto.page==pageDto.maxPage}">
												  <li>
												    <span class="button disabled">
												      <img src="../images/general/pageNext.png" style="width:15px; vertical-align: middle;" />
												    </span>
												  </li>
												</c:if>
												<!-- 다음 페이지 이동 끝-->
												<!-- 끝 페이지 이동 -->
											    <c:if test="${pageDto.page != pageDto.maxPage}">
												  <li>
												    <a href="/club/club?page=${pageDto.maxPage}" class="button">
												      <img src="../images/general/pageLast.png" style="width:15px; vertical-align: middle;" />
												    </a>
												  </li>
											    </c:if>
											    <c:if test="${pageDto.page == pageDto.maxPage}">
												  <li>
												    <span class="button disabled">
												      <img src="../images/general/pageLast.png" style="width:15px; vertical-align: middle;" />
												    </span>
												  </li>
											    </c:if>
												<!-- 끝 페이지 이동 끝-->
											</ul>
										</div>
										<!-- 하단 넘버링 버튼 끝 -->
									</div>
									<!-- 회원님을 기다리는 모임들 목록 끝-->
								</section>
								<!-- 회원님을 기다리는 모임들 끝 -->
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