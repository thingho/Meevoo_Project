<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
   <head>
      <title>전체 회원 목록</title>
      <!-- 제이쿼리 최신 -->
      <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <link rel="stylesheet" href="../css/main_new_yang.css" />
	  <link rel="icon" href="../images/main/logo2.png">
	  
   </head>
   <body class="is-preload">
      <c:if test="${result=='i_success'}"><script>alert("회원이 등록되었습니다.!!");</script></c:if>

      <!-- Wrapper -->
         <div id="wrapper">
            <!-- Main -->
               <div id="main">
                  <div class="inner">
                  
                     <!-- Header -->
					 <%@ include file="../top.jsp" %>
					 
					 <!-- 회원관리 리스트 나오게! -->
						 <div class="Wrap">
					        <!--content-->
					        <div class="content_St">
					        	<div class="content_Area">
					        		<!--card 이거다!!!!!!!!!!!!!!!!!!!-->
					        		<div class="card card_border">
					        			<!--card 맨 위 이름-->
					        			<div class="card_title bottomline">
					                        <h3>전체 회원 관리
					                    	</h3>
					                    </div>
					        			<!--card_title-->
					        			
					        			<!-- 검색 클릭시 -->
											<script>
										    	function userSearchBtn(){
										    		if($("#search_input").val().length<2){
										    			alert("2글자 이상 입력하셔야 합니다.")
										    			$("#search_input").focus();
										    			return false;
										    		}
										    		userSearch.submit();
										    	}
										    </script>
										
										
										<!--card-->
										<div class="card card_border bg_lightblue">
										    <div class="card_option">
										        
										        <!-- 2차 구현에서 하자....
						                        <div class="option_section" style="width:30%;">
					                                <span class="first_tit" style="float:left;text-align : center" ><br>가입 날짜 :</span>
					                                <input type="text" class="Datepicker cald_St hasDatepicker" id="dp1689135199476" style="width:100px; float:left;">
					                                <span style="float:left;"><br> ~ </span>
					                                <input type="text" class="Datepicker cald_St hasDatepicker" id="dp1689135199477" style="width:100px; float:left;">
						                        </div>
						                        <div class="option_section">
					                                <span style="float:left;"><br>현재 상태 :</span>
					                                <select style="width:100px; float:left;">
					                                    <option>가입</option>
					                                    <option>탈퇴</option>
					                                </select>
						                        </div> -->
										        
										        <form class="userSearchBtn" method="post" action="/admin/totalUser" name="userSearch" style="display: flex; align-items: center; justify-content: center;">
										            <select name="category" id="category" style="width: 10%; padding: 0 0 0 0; margin: 0;">
										                <option value="all">전체</option>
										                <option value="id">아이디</option>
										                <option value="usernm">이름</option>
										                <option value="nicknm">닉네임</option>
										            </select>
										            <div class="option_section" style="width: 30%; display: flex; align-items: center;">
										                <input type="search" style="width: 400px; margin: 0 0 0 1px;" name="search_input" id="search_input" value="${search_input}" placeholder="검색어를 입력해주세요." />
										                <button type="button" class="btn_small btn_blue" onclick="userSearchBtn()" style="height: 40px; margin: 0 0 0 1px;">검색</button>
										                <!-- <button type="reset" class="btn btn-success">Reset</button> -->
										            </div>
										        </form>
										    </div>
										</div>
										<!--card-->

										<!--회원 리스트-->
										<div class="card card_border">
						                    
						        			<!--card_title-->
						        			<div class="card paddingnone">
						        				<!--table-->
												<div class="tableStyle_A">
					                                <table>
						                                <colgroup>
						                                    <col width="*%">
						                                    <col width="*%">
						                                    <col width="*%">
						                                    <col width="*%">
						                                    <col width="*%">
						                                    <col width="*%">
						                                    <col width="*%">
						                                    <col width="*%">
						                                    <col width="*%">
						                                    <col width="*%">
						                                </colgroup>
						                                <thead>
						                                    <tr>
						                                        <th>아이디</th>
						                                        <th>패스워드</th>
						                                        <th>이름</th>
						                                        <th>닉네임</th>
						                                        <th>이메일</th>
						                                        <th>회원가입일자</th>
						                                        <th>회원온도</th>
						                                        <th>탈퇴여부</th>
						                                        <th>Edit</th>
						                                    </tr>
						                                </thead>
						                                <tbody>
						                                <!-- userList 가져오기!! -->
						                                <c:forEach var="userList" items="${list}">
						                                   <tr>
															  <td>${userList.id}</td>
															  <td>${userList.pw}</td>
															  <td><a href="/admin/totalUserModify?id=${userList.id}" class="lightgray">${userList.usernm}</a></td>
															  <td>${userList.nicknm}</td>
															  <td>${userList.email}</td>
															  <td><fmt:formatDate value="${userList.joindate}" pattern="yyyy-MM-dd"/></td>
															  <td>${userList.totaltemp}</td>
															  <td>${userList.nowjoin}</td>
						                                      <td><a href="/admin/totalUserModify?id=${userList.id}"><button class="btn_simple btn_blue">수정</button></a>
						                                         <!--  <a onclick="deleteBtn()"><button class="btn_simple btn_green">삭제</button></a> -->
						                                      </td>
														    </tr>
						                                </c:forEach>
						                                      
						                                </tbody>
						                                
						                            </table>
												</div>
												<!--table-->
						        			</div> 
						        			<!--  -->
						        			
						        			
						        			
						        			
									        	<div class="col-12" style="margin: 0px auto;">
												<ul class="pagination">
											      <!-- 첫페이지 이동 -->
											      <c:if test="${page != 1 }">
												      <li class="first">
												         <a href="/admin/totalUser?page=1&search_input=${search_input}" class="button">
												            <img src="../images/general/pageFirst.png" style="width: 15px;" />
												         </a>
												      </li>
											      </c:if>
											      <c:if test="${page == 1 }">
												      <li class="first">
												         <span class="button disabled"> 
												            <img src="../images/general/pageFirst.png" style="width: 15px; vertical-align: middle;" />
														 </span>
												      </li>
											      </c:if>
											      <!-- 첫 페이지 이동 끝-->
											      <!-- 이전페이지 이동 -->
											      <c:if test="${page>1}">
											        <li class="prev">
											           <a href="/admin/totalUser?page=${page-1}&search_input=${search_input}" class="button">
											              <img src="../images/general/pagePrevious.png" style="width: 15px; vertical-align: middle;" />
											           </a>
											        </li>
											      </c:if>
											      <c:if test="${page==1}">
											         <li class="prev">
											            <span class="button disabled"> 
											               <img src="../images/general/pagePrevious.png" style="width: 15px; vertical-align: middle;" />
														</span>
											         </li>
											      </c:if>
											      <!-- 이전 페이지 이동 끝 -->
											      <!-- 페이지리스트 -->
											      <c:forEach begin="${startPage}" end="${endPage}" step="1" var="num">
											        <c:if test="${num != page }">
												       <li class="num">
												          <a href="/admin/totalUser?page=${num}&search_input=${search_input}" class="page">
												           <div>${num}</div>
												          </a>
												       </li>
											        </c:if>
											        <c:if test="${num == page }">
											            <li class="num on">
											               <a href="/admin/totalUser?page=${num}" class="page active">
											                  <div>${num}</div>
											               </a>
											            </li>
											        </c:if>
											      </c:forEach>
											      <!-- 페이지 리스트 끝-->
											      <!-- 다음페이지 이동 -->
											      <c:if test="${page<maxPage}">
											        <li class="next">
											           <a href="/admin/totalUser?page=${page+1}&search_input=${search_input}" class="button">
											              <img src="../images/general/pageNext.png" style="width: 15px; vertical-align: middle;" />
											           </a>
											        </li>
											      </c:if>
											      <c:if test="${page==maxPage }">
											        <li class="next">
											           <span class="button disabled"> 
											              <img src="../images/general/pageNext.png" style="width: 15px; vertical-align: middle;" />
													   </span>
											        </li>
											      </c:if>
											      <!-- 다음 페이지 이동 끝-->
											      <!-- 끝페이지 이동 -->
											      <c:if test="${page != maxPage }">
											        <li class="last">
												      <a href="/admin/totalUser?page=${maxPage}&search_input=${search_input}" class="button">
												         <img src="../images/general/pageLast.png" style="width: 15px; vertical-align: middle;" />
												      </a>
											        </li>
											      </c:if>
											      <c:if test="${page == maxPage }">
												      <li class="last">
											            <span class="button disabled"> <img src="../images/general/pageLast.png" style="width: 15px; vertical-align: middle;" />
														</span>
												      </li>
											      </c:if>
											      
											    </ul>
											</div>	
				
				
										</div>

									
									<!-- Section -->
									<section>
										<!-- Table -->
										<div class="table-wrapper">
											
											<div style="text-align: right;">
												<a href="/admin/totalUserWrite"><button type="button" class="button primary">회원 추가</button></a>
											</div>
										</div>
									</section>
									<!-- // Section -->
						        			
											
										</div>
					        			<!--card-->
					        		</div>
					        		<!--card-->
					        	</div>
					        </div>
					        <!--//content-->
						</div>
										 
					 
                    <%@ include file="../footer.jsp" %> 
					 
					 
                  </div>
               
               
               <!-- Sidebar Start -->
					<%@ include file="../sidebar.jsp" %>
		       <!-- Sidebar End -->
               
               </div>
         
         <!-- Scripts -->
         <script src="../js/jquery.min.js"></script>
         <script src="../js/browser.min.js"></script>
         <script src="../js/breakpoints.min.js"></script>
         <script src="../js/util.js"></script>
         <script src="../js/main.js"></script>
         <script type="text/javascript" src="./Admin Template - Light_files/dataTables.checkboxes.min.js.다운로드"></script>

   </body>
</html>