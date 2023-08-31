<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
   <head>
      <title>전체 모임 목록 페이지</title>
      <!-- 제이쿼리 최신 -->
      <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <link rel="stylesheet" href="../css/main_new_yang.css" />
  <script>
     function updateBtn(){
    	if(confirm("회원정보를 수정하시겠습니까?")){
	    	 update.submit(); //전송
    	}
     }
  </script>     
  <script>
      function deleteClubBtn(){
    	  if(confirm("게시글을 삭제하시겠습니까?")){
    		  delete.submit(); //전송
    		  //location.href="/admin/totalUserModify?id=${userList.id}";
    	  }
      }
  </script>
        
   </head>
   <body class="is-preload">
      <c:if test="${result=='i_success'}"><script>alert("게시글이 등록되었습니다.!!");</script></c:if>
      
      <!-- Wrapper -->
         <div id="wrapper">

            <!-- Main -->
               <div id="main">
                  <div class="inner">

                     <!-- Header -->
					 <%@ include file="../top.jsp" %>
					 
					 <!-- 전체 모임 리스트 나오게! -->
						 <div class="Wrap">
					        <!--content-->
					        <div class="content_St">
					        	<div class="content_Area">
					        		<!--card 이거다!!!!!!!!!!!!!!!!!!!-->
					        		<div class="card card_border">
					        		
					        			<!--card 맨 위 이름-->
					        			<div class="card_title bottomline">
					                        <h3>전체 게시글 관리
					                    	</h3>
					                    </div>
					        			<!--card_title-->
					        			
					        			<script>
										    	function clubSearchBtn(){
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
										        <form class="clubSearchBtn" method="post" action="/admin/totalWrite" name="userSearch" style="display: flex; align-items: center; justify-content: center;">
										            <select name="category" id="category" style="width: 10%; padding: 0 0 0 0; margin: 0;">
										                <option value="all">전체</option>
										                <option value="id">작성자</option>
										                <option value="cnm">모임이름</option>
										                <option value="sfno">모임장소</option>
										            </select>
										
										            <div class="option_section" style="width: 30%; display: flex; align-items: center;">
										                <input type="search" style="width: 400px; margin: 0 0 0 1px;" name="search_input" id="search_input" value="${search_input}" placeholder="검색어를 입력해주세요." />
										                <button type="button" class="btn_small btn_blue" onclick="clubSearchBtn()" style="height: 40px; margin: 0 0 0 1px;">검색</button>
										            </div>
										        </form>
										    </div>
										</div>
										<!--card-->
										
										<!--회원 리스트-->
										<div class="card card_border">
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
						                                        <th>번호</th>
						                                        <th>작성자</th>
						                                        <th>모임 이름</th>
						                                        <th>작성일자</th>
						                                        <th>모임일자</th>
						                                        <th>모임장소</th>
						                                        <th>모임시설</th>
						                                        <th>Edit</th>
						                                    </tr>
						                                </thead>
						                                
						                                <tbody>
						                                <!-- clubList 가져오기!! -->
						                                <c:forEach var="clublist" items="${clublist}">
						                                   <tr>
															  <td>${clublist.cno}</td>
															  <td>${clublist.id}</td>
															  <td><a href="/club/cView?cno=${clublist.cno}" class="lightgray">${clublist.cnm}</a></td>
															  <td><fmt:formatDate value="${clublist.cwrdate}" pattern="yyyy-MM-dd"/></td>
															  <td><fmt:formatDate value="${clublist.cdodate}" pattern="yyyy-MM-dd"/></td>
															  <td>${clublist.cloc}</td>
															  <td>${clublist.sfno}</td>
						                                      <td><a href="/admin/totalWriteModify?cno=${clublist.cno }"><button class="btn_simple btn_blue">수정</button></a>
						                                          <!-- <button type="button" onclick="deleteClubBtn()" class="btn_simple btn_green">삭제</button> -->
						                                      </td>
														    </tr>
						                                 </c:forEach>
						                                
						                                </tbody>
						                            </table>
												</div>
												<!--table-->
						        			</div>
						        			
						        			<!-- 하단 넘버링 버튼 -->
											<div class="col-12" style="margin: 0px auto;">
												<ul class="pagination">
											      <!-- 첫페이지 이동 -->
											      <c:if test="${pageDto1.page != 1 }">
												      <li class="first">
												         <a href="/admin/totalWrite?page=1&search_input=${search.search_input}" class="button">
												            <img src="../images/general/pageFirst.png" style="width: 15px;" />
												         </a>
												      </li>
											      </c:if>
											      <c:if test="${pageDto1.page == 1 }">
												      <li class="first">
												         <span class="button disabled"> 
												            <img src="../images/general/pageFirst.png" style="width: 15px; vertical-align: middle;" />
														 </span>
												      </li>
											      </c:if>
											      <!-- 첫 페이지 이동 끝-->
											      <!-- 이전페이지 이동 -->
											      <c:if test="${pageDto1.page>1}">
											        <li class="prev">
											           <a href="/admin/totalWrite?page=${pageDto1.page-1}&search_input=${search.search_input}" class="button">
											              <img src="../images/general/pagePrevious.png" style="width: 15px; vertical-align: middle;" />
											           </a>
											        </li>
											      </c:if>
											      <c:if test="${pageDto1.page==1}">
											         <li class="prev">
											            <span class="button disabled"> 
											               <img src="../images/general/pagePrevious.png" style="width: 15px; vertical-align: middle;" />
														</span>
											         </li>
											      </c:if>
											      <!-- 이전 페이지 이동 끝 -->
											      <!-- 페이지리스트 -->
											      <c:forEach begin="${pageDto1.startPage}" end="${pageDto1.endPage}" step="1" var="num">
											        <c:if test="${num != pageDto1.page }">
												       <li class="num">
												          <a href="/admin/totalWrite?page=${num}&search_input=${search.search_input}" class="page">
												           <div>${num}</div>
												          </a>
												       </li>
											        </c:if>
											        <c:if test="${num == pageDto1.page }">
											            <li class="num on">
											               <a href="/admin/totalWrite?page=${num}" class="page active">
											                  <div>${num}</div>
											               </a>
											            </li>
											        </c:if>
											      </c:forEach>
											      <!-- 페이지 리스트 끝-->
											      <!-- 다음페이지 이동 -->
											      <c:if test="${pageDto1.page<pageDto1.maxPage}">
											        <li class="next">
											           <a href="/admin/totalWrite?page=${pageDto1.page+1}&search_input=${search.search_input}" class="button">
											              <img src="../images/general/pageNext.png" style="width: 15px; vertical-align: middle;" />
											           </a>
											        </li>
											      </c:if>
											      <c:if test="${pageDto1.page==pageDto1.maxPage }">
											        <li class="next">
											           <span class="button disabled"> 
											              <img src="../images/general/pageNext.png" style="width: 15px; vertical-align: middle;" />
													   </span>
											        </li>
											      </c:if>
											      <!-- 다음 페이지 이동 끝-->
											      <!-- 끝페이지 이동 -->
											      <c:if test="${pageDto1.page != pageDto1.maxPage }">
											        <li class="last">
												      <a href="/admin/totalWrite?page=${pageDto1.maxPage}&search_input=${search.search_input}" class="button">
												         <img src="../images/general/pageLast.png" style="width: 15px; vertical-align: middle;" />
												      </a>
											        </li>
											      </c:if>
											      <c:if test="${pageDto1.page == pageDto1.maxPage }">
												      <li class="last">
											            <span class="button disabled"> <img src="../images/general/pageLast.png" style="width: 15px; vertical-align: middle;" />
														</span>
												      </li>
											      </c:if>
											      
											    </ul>
											</div>	
						        			
						        			
						        			
						        			
						        			
											<!-- 관리자가 새로운 모임 작성 -->
												<!-- Section -->
												<section>
													<!-- Table -->
													<div class="table-wrapper">
														<div style="text-align: right;">
															<a href="/admin/totalWriteWrite"><button type="button" class="button primary">모임 추가</button></a>
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