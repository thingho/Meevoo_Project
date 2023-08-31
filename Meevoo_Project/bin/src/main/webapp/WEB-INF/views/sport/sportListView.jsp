<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>체육시설 상세페이지</title>
		<!-- 제이쿼리 최신 -->
		<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
		 <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<link rel="stylesheet" href="../css/main_kmh.css" />
	</head>
	<body class="is-preload">
			
			<script>
				// 1. 리뷰쓴거 등록하기
				function reviewBtn(){
					if("${sessionId}"==""){
						alert("로그인을 하셔야 리뷰등록이 가능합니다.");
						location.href="/member/login";
						return false;
					}
					
					if($("#sreviewContent").val() == ""){
						alert("리뷰글을 작성하셔야 등록이 가능합니다.");
						return false;
					}
					
					alert("리뷰글을 등록합니다.");
					
					//ajax구문
              	  	$.ajax({
              		  url:"/sport/reviewInsert",
              		  type:"post",
              		data:{"id":"${sessionId}",
          			    "sfno":"${sdto.sfno}",
          			    "srecontent":$("#sreviewContent").val(),
          			    "sstar": $('[name=star]:checked').val()
          		  },
          		  success:function(data){
          			  var dataHtml="";
          			  alert("리뷰 저장 성공");
          			  //하단리뷰 1개 가져오기
          			  console.log(data);
          			  //하단에 리뷰추가코드
          			  dataHtml += "<ul id='"+ data.sreno +"'>";
          			  dataHtml += "<li class='name'>"+ data.id +"<span>&nbsp;&nbsp;&nbsp;[ "+ moment(data.sredate).format("YYYY-MM-DD HH:mm:ss") +" ]</span></li>";
          			  dataHtml += "<li class='star'><span class='srestar' style='color: rgba(250, 208, 0, 0.99);'>";
	              			if (data.sstar == 1) {
	              			    dataHtml += "★";
	              			} else if (data.sstar == 2) {
	              			    dataHtml += "★ ★";
	              			} else if (data.sstar == 3) {
	              			    dataHtml += "★ ★ ★";
	              			} else if (data.sstar == 4) {
	              			    dataHtml += "★ ★ ★ ★";
	              			} else if (data.sstar == 5) {
	              			    dataHtml += "★ ★ ★ ★ ★";
	              			}
              			  dataHtml += "</span>&nbsp;&nbsp;별점&nbsp;"+data.sstar+"</li>";
              			  dataHtml += "<li class='txt'>"+ data.srecontent +"</li>";
              			  dataHtml += "<li class='btn'>";
              			  dataHtml += "<a onclick=\"updateBtn("+data.sreno+",'"+data.id+"','"+data.sredate+"','"+data.sstar+"','"+data.srecontent+"')\" class='button primary small'>수정</a>&nbsp";
              			  dataHtml += "<a onclick=\"deleteBtn("+data.sreno+")\" class='button small'>삭제</a>";
              			  dataHtml += "</li>";
              			  dataHtml += "</ul>";
              			  
              			  $("#reviewBox").prepend(dataHtml);  //prepend(위),append(아래),html(모두삭제후 추가)
              			  
              			  //글자삭제
              			  $("#sreviewContent").val("");
              			  $('[name=star]:checked').val("");
              			  
              			  //총개수 수정
                    	  var renum = Number($("#renum").text())+1;
                    	  $("#renum").text(renum);
              			  
              			  
              		  },
              		  error:function(){
              			  alert("실패");
              		  }
              	  });//ajax
				} // 리뷰 등록
				
				
				// 2. 리뷰쓴거 삭제하기
				function deleteBtn(sreno){
              	  if(confirm("리뷰를 삭제하시겠습니까?")){
                  	  $.ajax({
                  		  url:"/sport/reviewDelete",
                  		  type:"post",
                  		  data:{"sreno":sreno }, // 댓글번호
                  		  success:function(data){
                  			  alert(sreno+"번 리뷰가 삭제되었습니다.");
                  			  $("#"+sreno).remove();  // 삭제
                  			  //총개수 수정
	                    	  var renum = Number($("#renum").text())-1;
	                    	  $("#renum").text(renum);
                  		  },
                  		  error:function(){
                  			  alert("실패");
                  		  }
                  	  });//ajax
              	  }//if
                }//삭제버튼 -->
                
                
             	// 3. 리뷰 수정 저장
                function updateSave(sreno){
              	  
              	  if(confirm("수정한 리뷰글을 저장하시겠습니까?")){
              		  $.ajax({
                  		  url:"/sport/reviewUpdateSave",
                  		  type:"post",
                  		  data:{ "sreno":sreno,
                  			     "srecontent":$("#updateContent").val()}, 
                  		  success:function(data){
                  			  alert(sreno+"번 리뷰가 수정되었습니다.");
                  			  
                  			  var dataHtml="";
                  			  
                  			  //댓글화면 변경
                  			  dataHtml += "<li class='name'>"+ data.id +"<span>&nbsp&nbsp[ "+ moment(data.sredate).format("YYYY-MM-DD HH:mm:ss") +" ]</span></li>";
	                  		  dataHtml += "<span class='srestar' style='color: rgba(250, 208, 0, 0.99);'>";
	       	      			  dataHtml += getStars(sstar);  
	       	      			  dataHtml += "</span>&nbsp;&nbsp;별점 "+data.sstar+"</li>";
                  			  dataHtml += "<li class='txt'>"+ data.srecontent +"</li>";
                  			  dataHtml += "<li class='btn'>";
                  			  dataHtml += "<a onclick=\"updateBtn("+data.sreno+",'"+data.id+"','"+data.sredate+"','"+data.sstar+"','"+data.srecontent+"')\" class='button primary small'>수정</a>&nbsp";
                			  dataHtml += "<a onclick=\"deleteBtn("+data.sreno+")\" class='button small'>삭제</a>";
                			  dataHtml += "</li>";
                  			  
                 		 	  $("#"+sreno).html(dataHtml);
                  		  },
                  		  error:function(){
                  			  alert("실패");
                  		  }
                  	  });//ajax
              	  }//if
              	  
              	  
                }//리뷰 수정 저장 끝
                
                
				// 4. 리뷰쓴거 수정하기
 			 	function updateBtn(sreno,id,sredate,sstar,srecontent){
					if(confirm("댓글을 수정하시겠습니까?")){
            		 let dataHtml="";
	            	 
	      			 dataHtml += "<li class='name'>"+ id +"<span>&nbsp;&nbsp;&nbsp;[ "+ moment(sredate).format("YYYY-MM-DD HH:mm:ss") +" ]</span></li>";
	      			 dataHtml += "<li class='star'>";
	      			 dataHtml += "<span class='srestar' style='color: rgba(250, 208, 0, 0.99);'>";
	      			 dataHtml += getStars(sstar);  
	      			 dataHtml += "</span>&nbsp;&nbsp;별점 "+sstar+"</li>";
            		 dataHtml += "<li class='txt'>";
            		 dataHtml += "<textarea type='text' class='updateContent' id='updateContent'>"+srecontent+"</textarea>";
            		 dataHtml += "</li>";
            		 dataHtml += "<li class='btn'>";
            		 dataHtml += "<a onclick=\"updateSave("+sreno+")\" class='button primary small'>저장</a>&nbsp;";
            		 dataHtml += "<a onclick=\"cancelBtn("+sreno+",'"+id+"','"+sredate+"','"+sstar+"','"+srecontent+"')\" class='button small'>취소</a>";
            		 dataHtml += "</li>";
	
            		 $("#"+sreno).html(dataHtml);
	            	  }//if
	              }// 수정창 띄우기 -->
	              
	              function getStars(sstar) {
	            	  if (0 < sstar && sstar <= 1) {
	            	    return '★';
	            	  } else if (1 < sstar && sstar <= 2) {
	            	    return '★ ★';
	            	  } else if (2 < sstar && sstar <= 3) {
	            	    return '★ ★ ★';
	            	  } else if (3 < sstar && sstar <= 4) {
	            	    return '★ ★ ★ ★';
	            	  } else if (4 < sstar && sstar <= 5) {
	            	    return '★ ★ ★ ★ ★';
	            	  }
	            	}
	              
	              
	              // 5. 리뷰 수정 취소
	              function cancelBtn(sreno,id,sredate,sstar,srecontent){
                  	  alert("댓글 수정을 취소하셨습니다.");
                  	  var dataHtml="";
          			  
          			  //댓글화면 변경
        			  dataHtml += "<li class='name'>"+ id +"<span>&nbsp;&nbsp;&nbsp;[ "+ moment(sredate).format("YYYY-MM-DD HH:mm:ss") +" ]</span></li>";
        			  dataHtml += "<span class='srestar' style='color: rgba(250, 208, 0, 0.99);'>";
 	      			  dataHtml += getStars(sstar);  
 	      			  dataHtml += "</span>&nbsp;&nbsp;별점 "+sstar+"</li>";
           			  dataHtml += "<li class='txt'>"+ srecontent +"</li>";
           			  dataHtml += "<li class='btn'>";
           			  dataHtml += "<a onclick=\"updateBtn("+sreno+",'"+id+"','"+sredate+"','"+sstar+"','"+srecontent+"')\" class='button primary small'>수정</a>&nbsp";
           			  dataHtml += "<a onclick=\"deleteBtn("+sreno+")\" class='button small'>삭제</a>";
           			  dataHtml += "</li>";
           			  
          			  $("#"+sreno).html(dataHtml);
                  	  
                    }//리뷰 수정 취소 끝
                    
                    
                    // 6. 신고버튼 누르기
                    function reportBtn(sreno, id,sfno){
                    	if("${sessionId}"==""){
    						alert("로그인을 하셔야 신고가 가능합니다.");
    						location.href="/member/login";
    						return false;
    					}
                    	
    				 	if(confirm("리뷰글을 신고 하시겠습니까?")){
    				 		location.href="/sport/sportReviewReport?sfno="+sfno+"&page=${page}&sreno="+sreno+"&id="+id;
                  		  	return false;
    				 	}
    				 	
    				 	
    				}
                    
                    // 7. 찜하기 버튼(insert)
       				function sPickBtn(sfno){
       					if("${sessionId}"==""){
    						alert("로그인을 하셔야 찜하기가 가능합니다.");
    						location.href="/member/login";
    						return false;
    					}
       					if(confirm("찜하기를 등록하시겠습니까?")){
       						const spickyn = $("#spicklike").data("value");
                        	  $.ajax({
                        		  url:"/sport/sportPick",
                        		  type:"post",
                        		  data:{"id": "${sessionId}",
                        			  	"sfno" : sfno,
                        			  	"spickyn" : spickyn},
                        		  success:function(data){
                        			  alert("찜하기가 등록되었습니다.");
                        			  alert(spickno)
                        			  var dataHtml="";
                        			  
                        			  dataHtml += "<li>";
                        			  dataHtml += "<a class='button primary' id='spickcancel' onclick=\"sPickCancelBtn("+sfno+")\">♥ 시설 찜하기 [ ${spickList.size()+1} ]</a>";
                        			  dataHtml += "</li>";
                          			  $("#"+sfno).html(dataHtml);
                          			  
                          			  /* dataHtml += "<a class='button primary' id='spickcancel' onclick=\"sPickCancelBtn("+data.sfno+"','"+data.spickno+"')\">♥ 시설 찜하기 [ ${spickList.size()+1} ]</a>";
                        			  $("#"+spickno).html(dataHtml); */
                          			  
                        		  },
                        		  error:function(){
                        			  alert("실패");
                        		  }
                        	  });//ajax
                    	  }//if
                      }//찜하기 버튼 끝
                      
                      
                   // 8. 찜하기 취소하기(delete)
      				function sPickCancelBtn(sfno,spickno){
                    	  if(confirm("찜하기를 취소하시겠습니까?")){
                        	  $.ajax({
                        		  url:"/sport/sportPickCancel",
                        		  type:"post",
                        		  data:{"sfno" : sfno,
                        			  	"id" : "${sessionId}",
                        			  	"spickno" : spickno}, // 댓글번호
                        		  success:function(data){
                        			  alert("찜하기가 취소 되었습니다.");
                        			  /* $("#"+spickno).remove(); */  // 삭제
                        			  
                        			  let dataHtml="";
                        			  
                        			  dataHtml += "<li>";
                        			  dataHtml += "<a class='button' id='spicklike' onclick=\"sPickBtn("+sfno+")\" data-value='Yes'>♡ 시설 찜하기 [ ${spickList.size()-1} ]</a>";
                        			  dataHtml += "</li>";
                        			  //dataHtml += "<a class='button' id='spicklike' onclick=\"sPickBtn("+data.sfno+")\" data-value='Yes'>♡ 시설 찜하기 [ ${spickList.size()-1} ]</a>";
                          			  $("#"+sfno).html(dataHtml)
                        			  
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
												<li>${sdto.sfno}. ${sdto.sfnm}</li>
											</ul>
										</div>
										<div class="imgurl">
											<ul>
												<li><a href="${sdto.imgurl1}" target="_blank"><img src="${sdto.imgurl1}"></a></li>
												<li><a href="${sdto.imgurl2}" target="_blank"><img src="${sdto.imgurl2}"></a></li>
												<li><a href="${sdto.imgurl3}" target="_blank"><img src="${sdto.imgurl3}"></a></li>
												<li><a href="${sdto.imgurl4}" target="_blank"><img src="${sdto.imgurl4}"></a></li>
												<li><a href="${sdto.imgurl5}" target="_blank"><img src="${sdto.imgurl5}"></a></li>
											</ul>
										</div>
										<div class="day">
											<p class="txt">운동종목<span>${sdto.scate}</span></p>
											<p class="txt">동이름<span>${sdto.dongcate}</span></p>
											<p class="txt">주소<span>${sdto.addr}</span></p>
										</div>
										<div class="day">
											<c:if test="${sdto.telno == 'NA'}">
												<p class="txt">전화번호<span>X</span></p>
											</c:if>
											<c:if test="${sdto.telno != 'NA'}">
												<p class="txt">전화번호<span>02) ${sdto.telno}</span></p>
											</c:if>
											<c:if test="${sdto.homepage == null}">
												<p class="txt">홈페이지URL<span>X</span></p>
											</c:if>
											<c:if test="${sdto.homepage != null}">
												<p class="txt">홈페이지URL<span><a href="${sdto.homepage}">${sdto.homepage}</a></span></p>
											</c:if>
											<p class="txt">별점<span>${sdto.savgstar}</span></p>
										</div>
										<div class="convenient">
											<c:if test="${sdto.wifi == 'O'}">
												<img src="/convenient/wifiO.png">
											</c:if>
											<c:if test="${sdto.wifi == 'X'}">
												<img src="/convenient/wifiX.png">
											</c:if>
											<c:if test="${sdto.pet == 'O'}">
												<img src="/convenient/petO.png">
											</c:if>
											<c:if test="${sdto.pet == 'X'}">
												<img src="/convenient/petX.png">
											</c:if>
											<c:if test="${sdto.parking == 'O'}">
												<img src="/convenient/parkingO.png">
											</c:if>
											<c:if test="${sdto.parking == 'X'}">
												<img src="/convenient/parkingX.png">
											</c:if>
											<c:if test="${sdto.slope == 'O'}">
												<img src="/convenient/slopeO.png">
											</c:if>
											<c:if test="${sdto.slope == 'X'}">
												<img src="/convenient/slopeX.png">
											</c:if><br>
											<p class="txt">와이파이</p>
											<p class="txt">반려동물</p>
											<p class="txt">주차장</p>
											<p class="txt">출입구경사로</p>
										</div>
									<!-- 지도 데이터 불러오기 -->
									<div id="map"></div>
									
									</div>
									<br>
									<!-- Buttons 수정 ->  main.css (1294번째)-->
									<ul class="actions">
									       <div id="${sdto.sfno}">
											<c:if test="${spickcount == 0 || spickcount == null}">
												<li><a class="button" id="spicklike" onclick="sPickBtn(${sdto.sfno})" data-value="Yes">♡ 시설 찜하기 [ ${spickList.size()} ]</a></li>
											</c:if>
											<c:if test="${spickcount == 1}">
												<c:forEach var="spickDto" items="${spickList}">
												 <c:if test="${sessionId == spickDto.id}">
												 <c:if test="${spickDto.sfno == sdto.sfno}">					 
												 <li><a class="button primary" id="spickcancel" onclick="sPickCancelBtn(${sdto.sfno},'${spickDto.spickno}')">♥ 시설 찜하기 [ ${spickList.size()} ]</a></li>
												 </c:if>
												 </c:if>
												 </c:forEach>
												<%-- <li><a class="button primary" id="spickcancel" onclick="sPickCancelBtn(${sdto.sfno})">♥ 시설 찜하기 [ ${spickList.size()} ]</a></li> --%>
											</c:if>
									       </div>
										<li><a href="/sportreport/sportReportWrite?sfno=${sdto.sfno}&page=${page}" class="button primary">시설 문의글 작성</a></li>
										<li><button onclick="openChildWindow()" class="button primary">모임 생성</button></li>
										<li><a href="sportList?page=${page}&slist_word=${slist_word}&sportDto=${sportDto}" class="button primary">시설 목록으로</a></li>
									</ul>
								</section>
								
								<script>
							        function openChildWindow() {
							        	// 부모 페이지의 URL에서 "sfno" 키의 값을 추출
							            var parentURL = window.location.href;
							            var sfnoValue = getURLParameter("sfno", parentURL);

							            // URL에 전달할 데이터를 포함하여 자식 창 열기
							            var url = "http://localhost:8000/club/cWrite?sfno=" + encodeURIComponent(sfnoValue);
							            
							            var sfnmValue = "${sdto.sfnm }";
							            var dongcateValue = "${sdto.dongcate }";
							            var clocValue = "${sdto.addr}";
							            var scateValue = "${sdto.scate}";
							            
							            // URL에 추가 파라미터를 붙여서 자식 창을 열기
							            url += "&sfnm=" + encodeURIComponent(sfnmValue);
							            url += "&dongcate=" + encodeURIComponent(dongcateValue);
							            url += "&cloc=" + encodeURIComponent(clocValue);
							            url += "&scate=" + encodeURIComponent(scateValue);
							            
							            window.open(url, "_self", "height=300,width=400");
							        }
							
							        // URL 파라미터를 가져오는 함수
							        function getURLParameter(name, url) {
							            var params = new URLSearchParams(new URL(url).search);
							            return params.get(name);
							        }
							    </script>
								
								<!-- 시설 리뷰 -->
								<!-- 리뷰 css -> main.css (78번째) -->
								<section class="sportreview">
									<div class="content" style="text-align: center;">
										<li class="name">${sdto.sfnm} 시설 리뷰</li>
									</div>
									<div class="replyBox">
										<br>
										<ul>
											<li class="in">
												<li class="name">총 <span id="renum">${sreList.size()}</span>개의 리뷰가 달려있습니다.</li>
												<form name="myform" id="myform" method="post" >
													<fieldset class="sportstar" >
														<!-- 별점 수정 main.css 1192번 -->
														<span class="text-bold">별점을 선택해주세요</span>
														<input type="radio" name="star" value="5" id="star1"><label
															for="star1">★</label>
														<input type="radio" name="star" value="4" id="star2"><label
															for="star2">★</label>
														<input type="radio" name="star" value="3" id="star3"><label
															for="star3">★</label>
														<input type="radio" name="star" value="2" id="star4"><label
															for="star4">★</label>
														<input type="radio" name="star" value="1" id="star5" checked><label
															for="star5">★</label>
													</fieldset>
													<div style="display: flex;">
														<textarea type="text" class="sreviewContent" id="sreviewContent" placeholder="시설 리뷰글을 작성해주세요!" ></textarea>
																  <!-- 버튼 크기 수정 main.css 1644번째 -->
													    <li class="btn"><a onclick="reviewBtn()" id="swrite"  class="button primary large">등록</a></li>
													</div>
												</form>	
											</li>
										</ul>
									</div>
									
								<fieldset>
									
									<div class="replyBox" id="reviewBox">
										<!--  쓴 글 부분  -->
										<c:forEach var="sreDto" items="${sreList}">
											<ul id="${sreDto.sreno}">
												<li class="name">${sreDto.id}<span>&nbsp;&nbsp;&nbsp;&nbsp;[ ${sreDto.sredate} ]</span></li>
												<li class="star"><span class="srestar" style="color: rgba(250, 208, 0, 0.99);">
													<c:if test="${0 < sreDto.sstar && sreDto.sstar <= 1 }">★</c:if> 
													<c:if test="${1 < sreDto.sstar && sreDto.sstar <= 2 }">★ ★</c:if> 
													<c:if test="${2 < sreDto.sstar && sreDto.sstar <= 3 }">★ ★ ★</c:if> 
													<c:if test="${3 < sreDto.sstar && sreDto.sstar <= 4 }">★ ★ ★ ★</c:if> 
													<c:if test="${4 < sreDto.sstar && sreDto.sstar <= 5 }">★ ★ ★ ★ ★</c:if> 
												</span>&nbsp;&nbsp;별점 ${sreDto.sstar}</li>
												<li class="txt">${sreDto.srecontent }</li>
		
												<!-- 자신의 댓글이 아닌경우 버튼노출 안됨 -->
												<!-- sessionId와 sreDto.id가 같을 때만 수정, 삭제 노출 -->
												<c:if test="${sessionId == sreDto.id }">
													<li class="btn">
														<a onclick="updateBtn(${sreDto.sreno},'${sreDto.id}','${sreDto.sredate}','${sreDto.sstar}','${sreDto.srecontent}')" class="button primary small">수정</a> 
														<a onclick="deleteBtn(${sreDto.sreno})" class="button small">삭제</a>
													</li>
												</c:if>
												<c:if test="${sessionId != sreDto.id }">
													<li class="btn">
														<a name="rerepclick" onclick="reportBtn(${sreDto.sreno},'${sreDto.id}','${sreDto.sfno}' )" class="button primary small">신고</a>
													</li>
												</c:if>
											</ul>
										</c:forEach>
									</div>
								</fieldset>
								<!-- //댓글 -->
								
								</section>
								
						<br>	
						<!-- Footer -->
						<%@ include file="../footer.jsp" %>
						</div>
						
					</div>

					
				<!-- Sidebar -->
				<%@ include file="../sidebar.jsp" %>
			</div>
			
			<!-- 발급받은 APP KEY를 사용하여 지도 불러오기 -->
			<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=45f6ecba7dd368758230a1304931199f&libraries=services"></script>
			<script>
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = { 
			        center: new kakao.maps.LatLng('${sdto.lat}', '${sdto.lng}'), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };
			
			var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			
			if('${sdto.scate}'== '볼링') var imageSrc = '/markericon/bowling_marker.png';
			else if('${sdto.scate}'== '배드민턴') var imageSrc = '/markericon/badminton_marker.png';
			else if('${sdto.scate}'== '클라이밍') var imageSrc = '/markericon/climbing_marker.png';
			else if('${sdto.scate}'== '풋살') var imageSrc = '/markericon/futsal_marker.png';
			else if('${sdto.scate}'== '스케이트') var imageSrc = '/markericon/iceskate_marker.png';
			else if('${sdto.scate}'== '테니스') var imageSrc = '/markericon/tennis_marker.png';
			else if('${sdto.scate}'== '탁구') var imageSrc = '/markericon/tabletennis_marker.png';
			else if('${sdto.scate}'== '농구') var imageSrc = '/markericon/basketball_marker.png';
			else var imageSrc = '/markericon/golf_marker.png';
			
			
			var imageSize = new kakao.maps.Size(130, 90), // 마커이미지의 크기입니다
			    imageOption = {offset: new kakao.maps.Point(33, 69)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
			      
			// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
			var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption),
			    markerPosition = new kakao.maps.LatLng('${sdto.lat}', '${sdto.lng}'); // 마커가 표시될 위치입니다
			
			// 마커를 생성합니다
			var marker = new kakao.maps.Marker({
			    position: markerPosition, 
			    image: markerImage // 마커이미지 설정 
			});
			
			// 마커가 지도 위에 표시되도록 설정합니다
			marker.setMap(map);
			
			// 커스텀 오버레이에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
			var content = '<div class="customoverlay">' +
			    		  '<a>' +
			    		  '<span class="title">${sdto.sfnm}</span>' +
			    		  '</a>' +
			    		  '</div>';

			// 커스텀 오버레이가 표시될 위치입니다 
			var position = new kakao.maps.LatLng('${sdto.lat}', '${sdto.lng}');  

			// 커스텀 오버레이를 생성합니다
			var customOverlay = new kakao.maps.CustomOverlay({
			    map: map,
			    position: position,
			    content: content,
			    yAnchor: 1 
			});
			</script>
			<!-- Scripts -->
			<script src="../js/jquery.min.js"></script>
			<script src="../js/browser.min.js"></script>
			<script src="../js/breakpoints.min.js"></script>
			<script src="../js/util.js"></script>
			<script src="../js/main.js"></script>

	</body>
</html>