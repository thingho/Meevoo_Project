<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML>
<html>
	<head>
		<title>모임글 상세</title>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../css/main_kim.css" />
		<link rel="icon" href="../images/main/logo2.png">
		<style>
			.dropdown-content {
			  display: none;
			  position: absolute;
			  background-color: rgba(255,255,255,0.1);
			  text-decoration: none;
			  min-width: 160px;
			  padding: 8px;
			  box-shadow: 0px 8px 16px 0px rgba(0,0,0,0.1);
			}
			.dropdown-content a {
			  padding: 12px 16px;
			  text-decoration: none;
			  display: block;
			  color: inherit;
			}
			.dropdown-content a:hover {background-color: #f1f1f1 opacity: 0.3;}
			.dropdown:hover .dropdown-content {display: block;}
		</style>
		<c:if test="${sessionId==null}">
		 <script>
		   alert ("로그인을 하셔야 모임글 상세 페이지에 접속이 가능합니다.");
		   location.href="/member/login";
		 </script>
		</c:if>	
		
		<script>
		  function deleteBtn(){
			  if(confirm("모임글을 삭제하시겠습니까?")){
				  location.href="cDelete?cno=${cdto.cno}"
			  }
		  }		
		</script>
	</head>
	<body class="is-preload">
		<!-- Wrapper -->
			<div id="wrapper">
				<!-- Main -->
					<div id="main">
						<div class="inner">
							<!-- Header -->
							<%@ include file="../top.jsp" %>	
							    <!-- Banner -->
								<section id="banner" style="box-sizing: border-box; margin:0.5em; padding:2em 2em 2em 0; height: 250px; ">
									<span class="content">
										<header>
										  <!-- 우상단 세부메뉴 점세개 -->
										  <c:if test="${sessionId == cdto.id }">
										  <div class="dropdown" style="position: relative; display: inline-block; float: right; ">
										    <input type="image" src="../images/general/ellipsisVertical.png" style="width: 30px; display: flex; float:right;" >
										      <div class="dropdown-content" style="top:-15px; left: -160px; background-color: #ffffff;">
										         <div><span><a href="/club/club?page=${param.page}"><img src="../images/general/previousPage.png" style="width:20px; vertical-align: middle;" />&nbsp;&nbsp;&nbsp;&nbsp;목록 보기</a></span></div>
										         <div><span><a href="/clubreport/clubReportWrite?cno=${cdto.cno}"><img src="../images/general/report.png" style="width:20px; vertical-align: middle;" />&nbsp;&nbsp;&nbsp;&nbsp;신고 하기</a></span></div>
										         <div><span><a href="/club/cUpdate?cno=${cdto.cno }"><img src="../images/general/write.png" style="width:20px; vertical-align: middle;" />&nbsp;&nbsp;&nbsp;&nbsp;수정 하기</a></span></div>
										         <div><span><a onclick="deleteBtn()"><img src="../images/general/delete.png" style="width:20px; vertical-align: middle;" />&nbsp;&nbsp;&nbsp;&nbsp;삭제 하기</a></span></div>
										      </div>
										  </div>
										  </c:if>
										  <c:if test="${sessionId != cdto.id }">
										  <div class="dropdown" style="position: relative; display: inline-block; float: right; ">
										    <input type="image" src="../images/general/ellipsisVertical.png" style="width: 30px; display: flex; float:right;" >
										      <div class="dropdown-content" style="top:-15px; left: -160px; background-color: #ffffff;">
										         <div><span><a href="/club/club"><img src="../images/general/previousPage.png" style="width:20px; vertical-align: middle;" />&nbsp;&nbsp;&nbsp;&nbsp;뒤로 가기</a></span></div>
										         <div><span><a href="/clubreport/clubReportWrite?cno=${cdto.cno}"><img src="../images/general/report.png" style="width:20px; vertical-align: middle;" />&nbsp;&nbsp;&nbsp;&nbsp;신고 하기</a></span></div>
										      </div>
										  </div>
										  </c:if>
										  <!-- 우상단 세부메뉴 점세개 끝-->
										  <h1>${cdto.cnm}</h1>
										    <div style="width:70%; margin: 0 0 2em 0; padding: 1em 0 0 0;">
	  									       <span style="display: inline-block; padding: 10px; border: 1px; border-radius: 10%; background-color: rgba(244, 244, 244, 0.5); ">
											      <c:if test="${cdto.scate eq '스케이트'}">
												    <img src="../images/sports/iceSkateIcon.png" style="width: 30px; vertical-align: middle;" />
												  </c:if>
												  <c:if test="${cdto.scate eq '골프'}">
												    <img src="../images/sports/golfIcon.png" style="width: 30px; vertical-align: middle;" />
												  </c:if>
												  <c:if test="${cdto.scate eq '배드민턴'}">
												    <img src="../images/sports/badmintonIcon.png" style="width: 30px; vertical-align: middle;" />
												  </c:if>
												  <c:if test="${cdto.scate eq '테니스'}">
												    <img src="../images/sports/tennisIcon.png" style="width: 30px; vertical-align: middle;" />
												  </c:if>
												  <c:if test="${cdto.scate eq '탁구'}">
												    <img src="../images/sports/tableTennisIcon.png" style="width: 30px; vertical-align: middle;" />
												  </c:if>
												  <c:if test="${cdto.scate eq '풋살'}">
												    <img src="../images/sports/futsalIcon.png" style="width: 30px; vertical-align: middle;" />
												  </c:if>
												  <c:if test="${cdto.scate eq '클라이밍'}">
												    <img src="../images/sports/climbingIcon.png" style="width: 30px; vertical-align: middle;" />
												  </c:if>
												  <c:if test="${cdto.scate eq '볼링'}">
												    <img src="../images/sports/bowlingIcon.png" style="width: 30px; vertical-align: middle;" />
												  </c:if>
												  <c:if test="${cdto.scate eq '농구'}">
												    <img src="../images/sports/basketballIcon.png" style="width: 30px; vertical-align: middle;" />
												  </c:if>
											      &nbsp;&nbsp;
											      <span style="font-size:1em; font-weight: bold; text-align: center;">${cdto.scate}</span>
										       </span>
										       &nbsp;&nbsp;&nbsp;
										       
										       
										       <!-- @@@@찜하기 버튼-지원@@@@ -->
										       <script>
										          var cpickNum="";
										          function pickBtn(){
										        	  
										        	  const cpick_tag = document.querySelector('#cpick');
										        	  const cpick = cpick_tag.dataset.value; //0,1
										        	  //alert("data-value : "+ cpick); //0:찜을 하지 않은 경우, 1:찜을 한경우
										        	  
										        	  //alert("찜개수 : "+ $("#totalPick").text());
										        	  if("${sessionId}"=="" || "${sessionId}"==null){
								    						alert("로그인을 하셔야 찜하기가 가능합니다.");
								    						location.href="/member/login";
								    						return false;
								    					}
										        	  
										        	  if(cpick==0){
												        	  if(confirm("찜하기를 하시겠습니까?")){
												        		  $.ajax({
												        			 url:"/club/clubPick",
												        			 type:"post",
												        			 data:{	"id":"${sessionId}",
												        				 	"cno":"${cdto.cno}"},
												        			 success:function(data){
												        				 cpickNum = data;	 //등록된 cpickno를 저장 
												        				 //alert("cpickNum1 : "+ cpickNum);
												        				 //alert("찜개수 : "+( Number($("#totalPick").text() )+1 ) );
												        				 $("#totalPick").text(Number($("#totalPick").text())+1);
												        				 $("#cpick").attr("style","background-color:#f56a6a; color:#fff; display:inline-block; padding: 10px; cursor:pointer; border: 1px; border-radius: 10%; ");
												        				 cpick_tag.setAttribute('data-value', '1');
												        			 },
												        			 error:function(){
												        				 //alert("실패");
												        			 }
												        			});//ajax
												        	  	}
										        	 	 }else{
										        		   
											        		  if(confirm("찜하기를 취소하시겠습니까?")){
												        		  $.ajax({
												        			 url:"/club/clubPickCancel",
												        			 type:"post",
												        			 data:{	"id":"${sessionId}",
												        				 	"cno":"${cdto.cno}"},
												        			 success:function(data){
												        				 cpickNum = data;
												        				 //alert("찜개수 : "+( Number($("#totalPick").text() )-1 )   );
												        				 $("#totalPick").text(Number($("#totalPick").text())-1);
												        				 $("#cpick").attr("style","background-color: rgba(244, 244, 244, 0.5); color:#000; display:inline-block; padding: 10px; cursor:pointer; border: 1px; border-radius: 10%; ");
												        				 cpick_tag.setAttribute('data-value', '0');
												        			 },
												        			 error:function(){
												        				 //alert("실패");
												        			 }
												        		});//ajax
											        	 	  }//if
										        	 	 	}//else
										          }//pickBtn()
										       </script>
		 										   <span id="cpick" onclick="pickBtn()" data-value="${data_value}" style="display:inline-block; padding: 10px; border: 1px; border-radius: 10%; background-color: rgba(244, 244, 244, 0.5); cursor:pointer;  ">
													  <img src="../images/general/index.png" style="width:30px; vertical-align: middle;" />
												      &nbsp;
												      <span style="font-size:1em; font-weight: bold; text-align: center;">저장&nbsp;&nbsp;</span><span id="totalPick">${cdto.ctotalpick}</span>
											       </span>
										       <!-- @@@@찜하기 버튼-지원@@@@ -->
	 										  <%--  <span style="display: inline-block; padding: 10px; border: 1px; border-radius: 10%; background-color: rgba(244, 244, 244, 0.5); ">
												  <img src="../images/general/index.png" style="width:30px; vertical-align: middle;" />
											      &nbsp;
											      <span style="font-size:1em; font-weight: bold; text-align: center;">저장&nbsp;&nbsp;${cdto.ctotalpick}</span>
										       </span> --%>
										       
										       
										       &nbsp;&nbsp;&nbsp;
											      <c:if test="${cdto.cnowstatus eq '모집중'}">
											        <span style="display: inline-block; padding: 10px; border: 1px; border-radius: 10%; background-color: #f56a6a; color: #ffffff; font-size:1em; font-weight: bold; text-align: center; ">
												      <img src="../images/general/memberAdd.png" style="width:30px; vertical-align: middle;" />
												      <span>${cdto.cnowstatus}</span>
										            </span>
												  </c:if>
												  <c:if test="${cdto.cnowstatus eq '모집완료'}">
												    <span style="display: inline-block; padding: 10px; border: 1px; border-radius: 10%; background-color: #f56a6a33; font-size:1em; font-weight: bold; text-align: center; ">
												      <img src="../images/general/memberDone.png" style="width:30px; vertical-align: middle;" />
												      <span>${cdto.cnowstatus}</span>
												    </span>
												  </c:if>
												  <c:if test="${cdto.cnowstatus eq '모임완료'}">
												    <span style="display: inline-block; padding: 10px; border: 1px; border-radius: 10%; background-color: rgba(244, 244, 244, 0.5); font-size:1em; font-weight: bold; text-align: center;">
												      <img src="../images/general/clubdone.png" style="width:30px; vertical-align: middle;" />
												      <span>${cdto.cnowstatus}</span>
												    </span>
												  </c:if>
											</div>
										</header>
									</span>
								</section>
								<!-- Banner 끝-->
							    <!-- Section: 운동모임 작성자 정보 -->
								<section style="padding: 0; vertical-align: center;">
									<header class="major">
									</header>
									<div class="features" style="margin: 0; width: 100%;">
									    <article style="margin: 0; width: 100%;">
											<span style="margin: 25px;">
											  <c:if test="${cdto.userimg == null }">
			                                   		<img src="https://cdn-icons-png.flaticon.com/512/848/848043.png" style="width:110px; border-radius: 50%;"/>
			                                   	</c:if>
												<c:if test="${cdto.userimg != null }">
			                                   		<img src="${cdto.userimg }" style="width:150px; border-radius: 50%; border: 1px solid rgba(210, 215, 217, 0.75);" />
												</c:if>
											</span>
											<div class="content" style="margin:  0, 0, 100px, 0;">
												<h3 style="display inline-block; padding: 3px; border: 1px; border-radius: 10%; font-weight: bold; margin:0.5em;">${cdto.nicknm}</h3>
												<p style="display inline-block; padding: 3px; border: 1px; border-radius: 10%; font-weight: bold; margin:0.5em;">${cdto.selfintro}</p>
											</div>
										</article>
									</div>
								</section>
								<!-- Section: 운동모임 작성자 정보 끝-->

							    <!-- Section: 운동모임 모임 정보 -->
								<section>
									<header class="major">
										<h2>모임 정보</h2>
									</header>
									<div style="margin-bottom:2em;">
										 <div style="display: flex; flex-direction: row; width: 100%; " >
										  <div style="width: 40%; padding: 1em;">
									        <span class="sfinfo" style="width: 40%; ">
									          <a href="#" class="image" style="width:100%;">
									            <img src="${cdto.imgurl1}" style="width:100%; "/>
									          </a>
									        </span>
									       </div>
	 									  <div class="content" style=" width: 55%; padding: 1.5em 0.5em 0.1em 3em;" >
	 									    <div>
	 									      <!-- 운동모임 모임 정보\d-day, 일자 -->
										      <p style="margin-bottom: 1em;">모임일자&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
										        <span style="font-weight: bold; color: #f56a6a">
										          <jsp:useBean id="nowRecsLoginList" class="java.util.Date" />
												    <fmt:parseNumber value="${nowRecsLoginList.time / (1000*60*60*24)}" integerOnly="true" var="nowfmtTime" scope="request"/>
												    <fmt:parseNumber value="${cdto.cdodate_date.time / (1000*60*60*24)}" integerOnly="true" var="dbDtParse" scope="request"/>
												      <c:set var="num" value="${nowfmtTime - dbDtParse}" />
												        <c:if test ="${(nowfmtTime - dbDtParse)>0}">
													      <span style="color: #f56a6a; font-weight: bold; ">
														    D+${nowfmtTime - dbDtParse}
													      </span>
												        </c:if>
												        <c:if test ="${(nowfmtTime - dbDtParse)<0}">
													      <span style="color: #f56a6a; font-weight: bold; ">
														    D${nowfmtTime - dbDtParse}
													      </span>
												        </c:if>
												        <c:if test ="${(nowfmtTime - dbDtParse)==0}">
													      <span style="color: #f56a6a; font-weight: bold; ">
														    D-${nowfmtTime - dbDtParse}
													      </span>
												        </c:if>
										        </span>&nbsp;&nbsp;
										        <span style="display inline-block; padding: 3px; border: 1px; border-radius: 10%; font-weight: bold; ">
										          <fmt:formatDate value="${cdto.cdodate_date}" type="both" dateStyle ="long" pattern="yyyy-MM-dd (E)" />
										        </span>
										        <span style="display inline-block; padding: 3px; border: 1px; border-radius: 10%; font-weight: bold; ">
										          <fmt:formatDate value="${cdto.cdodate_time}" type="both" dateStyle ="short" pattern="a hh:mm" />
										        </span>
										      </p>
										      <!-- 운동모임 모임 정보\d-day, 일자 끝-->
										      <p style="margin-bottom: 1em;">모임장소&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${cdto.sfnm}</p>
										      <p style="margin-bottom: 1em;">모임주소&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;${cdto.addr}</p>
	 									    </div>
										    <!-- 운동모임 모임 정보\편의시설 -->
	 									    <div>
										      <p style="margin: 0;">편의시설</p>
	 									      <c:if test="${cdto.wifi eq 'O'}">
	 									        <div style="display: inline-block; margin: 10px; text-align: center;">
										          <figure><img src="../images/facilities/wifiIconO.png" style="width:70px;" /></figure>
										          <p style="font-size: 10px;">와이파이</p>
	 									        </div>
	 									      </c:if>
	 									      <c:if test="${cdto.wifi eq 'X'}">
	 									        <div style="display: inline-block; margin: 10px; text-align: center;">
										          <figure><img src="../images/facilities/wifiIconX.png" style="width:70px;" /></figure>
										          <p style="font-size: 10px;">와이파이</p>
	 									        </div>
	 									      </c:if>
	 									      <c:if test="${cdto.pet eq 'O'}">
	 									        <div style="display: inline-block; margin: 10px; text-align: center;">
										          <figure><img src="../images/facilities/petIconO.png" style="width:70px" /></figure>
										          <p style="font-size: 10px;">반려동물</p>
	 									        </div>
	 									      </c:if>
	 									      <c:if test="${cdto.pet eq 'X'}">
	 									        <div style="display: inline-block; margin: 10px; text-align: center;">
										          <figure><img src="../images/facilities/petIconX.png" style="width:70px" /></figure>
										          <p style="font-size: 10px;">반려동물</p>
	 									        </div>
	 									      </c:if>
	 									      <c:if test="${cdto.parking eq 'O'}">
	 									        <div style="display: inline-block; margin: 10px; text-align: center;">
										          <figure><img src="../images/facilities/parkingIconO.png" style="width:70px;" /></figure>
										          <p style="font-size: 10px;">주차장</p>
	 									        </div>
	 									      </c:if>
	 									      <c:if test="${cdto.parking eq 'X'}">
	 									        <div style="display: inline-block; margin: 10px; text-align: center;">
										          <figure><img src="../images/facilities/parkingIconX.png" style="width:70px;" /></figure>
										          <p style="font-size: 10px;">주차장</p>
	 									        </div>
	 									      </c:if>
	 									      <c:if test="${cdto.slope eq 'O'}">
	 									        <div style="display: inline-block; margin: 10px; text-align: center;">
										          <figure><img src="../images/facilities/rampIconO.png" style="width:70px;" /></figure>
										          <p style="font-size: 10px;">입구경사로</p>
	 									        </div>
	 									      </c:if>
	 									      <c:if test="${cdto.slope eq 'X'}">
	 									        <div style="display: inline-block; margin: 10px; text-align: center;">
										          <figure><img src="../images/facilities/rampIconX.png" style="width:70px;" /></figure>
										          <p style="font-size: 10px;">입구경사로</p>
	 									        </div>
	 									      </c:if>
	 									    </div>
	 									    <!-- 운동모임 모임 정보\편의시설 끝-->
	 									  </div>
	 									 </div>
	 									  <div class="col-12" style="float: right; ">
								            <a href="/sport/sportListView?sfno=${cdto.sfno}" class="button primary">모임장소 상세보기</a>
								          </div>
									</div>
									<hr style="margin-top: 5em; ">
									<div>
								      ${cdto.ccontent}
									</div>
									&nbsp;
								    <div>
								      <c:if test="${cdto.cimg != null}">
								        <img src="/upload/${cdto.cimg}" style="width:20%;"/>
								      </c:if>
								      <c:if test="${cdto.cimg == null}">
								       <p>업로드 된 파일 없습니다.</p>
								      </c:if>
								   </div>
								</section>
								<!-- Section: 운동모임 모임 정보 끝-->
								
						        <!-- Section: 운동모임 모집 인원 -->
								<section>
								   <div class="recruit-member">
									  <div class="top clear" style= "margin-bottom: 0.5em;">
										<header class="major">
											<h2 style= "margin-bottom: 0.5em;">모집 인원</h2>
										</header>
									  </div>
										  <div style="float: right; margin-bottom: 1.5em;">
											<div class="fr" style="display: flex; flex-direction: row; float: right;">
											  <div class="red">
											    <span style="color: #f56a6a; margin-right: 5px;">■</span>
											    <span>확정</span>
											  </div>
											</div>
									      </div>
									      
									  <style>
									    #progress {appearance: none; width: 100%; height: 20px; border: 1px solid rgba(210, 215, 217, 0.75); border-radius: 50px; }
									    #progress::-webkit-progress-bar {background:#ffffff; border-radius:10px; }
									    #progress::-webkit-progress-value {border-radius:10px; background: #f56a6a; }
									  </style>    
									  <div class="progress" style="clear:both; margin-bottom: 2em ;">
									    <progress id="progress" value="${(cdto.cnowrecruit/cdto.crecruitlimit)*100}" min="0" max="100" style="margin-bottom: 0.7em;"></progress>
									      <div style="display: flex; justify-content: space-between; width: 100%; hight: 100%; font-weight: bold;">
									        <div>
									          <span style="color: #f56a6a;">${cdto.cnowrecruit}</span>
									          <span>명</span>
									        </div>
									        <div>
									          <span>${cdto.crecruitlimit}</span>
									          <span>명</span>
									        </div>
									      </div>
									  </div>
								   <script>
								   	// 1. 모인 신청 버튼
								   	function clubJoinBtn(){
								   		if(confirm("해당 모임을 신청하시겠습니까?")){
								   			alert("신청이 완료되었습니다.");
								   		}
								   	}
								   
								   	// 2. 모임 평가 버튼
								   	function clubReviewBtn(){
								   		if(confirm("모임평가 페이지로 이동하시겠습니까?")){
								   		location.href='/club/cMEvaluation';
								   		}else{
								   		alert("모임정보 페이지로 이동합니다.");
								   		location.href='/club/cSRSuggestion';
								   		}
								   	}
								   	
								   	
								 	// 3. 신청하기 버튼(insert)
								 	
				       				function clubJoinBtn(cno){
				       					if("${sessionId}"==""){
				    						alert("로그인을 하셔야 신청하기가 가능합니다.");
				    						location.href="/member/login";
				    						return false;
				    					}
				       					if(confirm("모임신청을 하시겠습니까?")){
				                        	  $.ajax({
				                        		  url:"/club/clubJoinUser",
				                        		  type:"post",
				                        		  data:{"id": "${sessionId}",
				                        			  	"cno" : cno},
				                        		  success:function(data){
				                        			  alert("신청하기가 완료되었습니다.");
				                        			  alert(cno)
				                        			  var dataHtml="";
				                        			  
				                        			  dataHtml += "<button type='button' onclick='clubJoinBtn()' id='apply-btn' class='button primary disabled fit'>신청완료</button>";
				                          			  $("#"+cno).html(dataHtml);
				                          			  
				                        		  },
				                        		  error:function(){
				                        			  alert("실패");
				                        		  }
				                        	  });//ajax
				                    	  }//if
				                      }//신청하기 버튼 끝
				                      
								   </script>
								   
								   <c:if test="${(cdto.cnowrecruit/cdto.crecruitlimit)*100 != 100}">
									   <c:if test="${cjoincount == 0}">
									   <div class="col-12">
									     <button type="button" onclick="clubJoinBtn(${cdto.cno})" id="apply-btn" class="button primary fit">신청하기</button>
									   </div>
									   </c:if>
								   </c:if>
								   <c:if test="${cjoincount == 1}">
								   	   <c:forEach var="cjoinDto" items="${cjoinList}">
									   <c:if test="${sessionId == cjoinDto.id}">
									     <c:if test="${cjoinDto.cno == cdto.cno}">
									     	<div class="col-12" id="${cdto.cno}">
									     	 <button type="button" onclick="clubJoinBtn()" id="apply-btn" class="button primary disabled fit">신청완료</button>
									     	</div>
									    </c:if>
								   	  </c:if>
								   	 </c:forEach>
								   </c:if>
								   <c:if test="${(cdto.cnowrecruit/cdto.crecruitlimit)*100 == 100}">
								   <div class="col-12">
								     <button type="button" onclick="clubReviewBtn()" id="apply-btn" class="button primary fit">모임평가</button>
								   </div>
								   </c:if>
								   
								   <!-- 모임글 상태에 따른 버튼 적용
								   <div class="col-12">
								     <button type="button" onclick="" id="apply-btn" class="button primary fit">모집완료</button>
								   </div>
								   &nbsp;
								   <div class="col-12" style="text-align: center;">
								     <button type="button" onclick="" id="apply-btn" class="button fit" style="width: 49.5%">취소하기</button>
								     <button type="button" onclick="" id="apply-btn" class="button primary fit" style="width: 49.5%">신청승인 대기중</button>
								   </div>
								   &nbsp;
								   <div class="col-12" style="text-align: center;">
								     <button type="button" onclick="" id="apply-btn" class="button fit" style="width: 49.5%">취소하기</button>
								     <button type="button" onclick="" id="apply-btn" class="button primary fit" style="width: 49.5%">승인완료</button>
								   </div>
								   &nbsp;
								   <div class="col-12">
								     <button type="button" onclick="" id="apply-btn" class="button primary fit">모임완료</button>
								   </div>
								   -->
									
								</section>
						<!-- 		
						Section
						<section>
							<header class="major">
								<h2>댓글</h2>
							</header>
							<div class="replyWrite" style="width: 100%; overflow: hidden;">
							  <ul style="list-style: none;">
								<li class="in">
								  <p class="txt" style="font-weight: bold;">총 <span style="color: #f56a6a; ">3</span> 개의 댓글이 달려있습니다.</p>
								</li>
								  <div style="display: flex;">
								    <textarea class="replyType" placeholder="댓글을 입력해 주세요" cols="40" rows="5" style="margin-right: 0.5em;"></textarea>
								    <input type="submit" value="등록" class="primary" style="height: 100%" />
								  </div>
							  </ul>
							</div>
							<div class="replyBox" style="width:100%; border-top: 1px solid rgba(210, 215, 217, 0.75); overflow: hidden;">
							  <ul style="position: flex; border-bottom: 1px solid; rgba(210, 215, 217, 0.75); margin: 1em 0 1em 0; padding: 1em 20px 0px 20px;list-style: none;">
							    <li style="font-weight: 600; color: #555; padding: 0 0 10px 0;">honghong111 <span style="color:#888; font-weight:normal;">[ 7.9(일) 오후 1:00 ]</span></li>
							    <li style="width: 100%; color: #888; line-height:1.5; word-break:keep-all; padding: 0;">안녕하세여 모임글 작성자 입니다. 많은 관심 부탁해요!</li>
							    <li>
							      <div class="col-12" style="width: 100%; margin-bottom: 2em; postion: flex;">
									<ul class="actions" style="flex-direction: row-reverse;">
									  <li style="">
										<li><input type="button" value="수정" /></li>
										<li><input type="button" value="삭제" /></li>
									  </li>
									</ul>
								  </div>
							    </li>
							  </ul>
							  <ul style="position: flex; border-bottom: 1px solid; rgba(210, 215, 217, 0.75); margin: 1em 0 1em 0; padding: 1em 20px 0px 20px;list-style: none;">
							    <li style="font-weight: 600; color: #555; padding: 0 0 10px 0;">honghong111 <span style="color:#888; font-weight:normal;">[ 7.9(일) 오후 1:00 ]</span></li>
							    <li style="width: 100%; color: #888; line-height:1.5; word-break:keep-all; padding: 0;">안녕하세여 모임글 작성자 입니다. 많은 관심 부탁해요!</li>
							    <li>
							      <div class="col-12" style="width: 100%; margin-bottom: 2em; postion: flex;">
									<ul class="actions" style="flex-direction: row-reverse;">
									  <li style="">
										<li><input type="button" value="신고" /></li>
									  </li>
									</ul>
								  </div>
							    </li>
							  </ul>
							  <ul style="position: flex; border-bottom: 1px solid; rgba(210, 215, 217, 0.75); margin: 1em 0 1em 0; padding: 1em 20px 0px 20px;list-style: none;">
							    <li style="font-weight: 600; color: #555; padding: 0 0 10px 0;">honghong111 <span style="color:#888; font-weight:normal;">[ 7.9(일) 오후 1:00 ]</span></li>
							    <li style="width: 100%; color: #888; line-height:1.5; word-break:keep-all; padding: 0;">안녕하세여 모임글 작성자 입니다. 많은 관심 부탁해요!</li>
							    <li>
							      <div class="col-12" style="width: 100%; margin-bottom: 2em; postion: flex;">
									<ul class="actions" style="flex-direction: row-reverse;">
									  <li style="">
										<li><input type="button" value="수정" /></li>
										<li><input type="button" value="삭제" /></li>
									  </li>
									</ul>
								  </div>
							    </li>
							  </ul>
							
							</div>
						</section>
						 -->
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