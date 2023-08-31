<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
   <head>
      <title>FAQ</title>
      <!-- 제이쿼리 최신 -->
      <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <link rel="stylesheet" href="../css/main_new_yang.css" />
   </head>
   <body class="is-preload">

      <!-- Wrapper -->
         <div id="wrapper">

            <!-- Main -->
               <div id="main">
                  <div class="inner">

                     <!-- Header -->
                        <%@ include file="../top.jsp" %>

                    

					 <!-- 중간에 공지사항 탭 넣기 : 공지사항 템플릿 -->
						<div id="container" class="container sub_container">
					
					 <br>
                     <br>
					
							<div class="contents" id="contents">
								<!-- breadcrumbs End -->
								<div class="cont-body">
									<div class="tab equal">
										<ul class="nav">
											<li><a href="notice"> 공지사항 </a></li>
											<li class="active" title="선택된 탭"><a href="FAQ"> 자주 물어보는 질문(FAQ) </a></li>
											<li><a href="QnA"> 질의응답(QnA) </a></li>
											<!-- <li class="active" title="선택된 탭"><a href="QnA"> 질의응답(QnA) </a></li>  -->
										</ul>
									</div>
								</div>
							</div>
						</div>
							

                     <!-- list형식으로 출력하기 -->
                           <div class="table-wrapper">
                              <table>
                                 <colgroup>
                                    <col width="3%"  />
                                    <col width="30%" />
                                    <col width="*" />
                                    <col width="*" />
                                    
                                 </colgroup>
                                 <thead>
                                    <tr>
                                       <th>NO.</th>
                                       <th>제목</th>
                                       <th>답변</th>
                                    </tr>
                                 </thead>
                                 <tbody>
                                    <c:forEach var="faqlist" items="${faqlist}">
                                    <tr>
                                       <td>${faqlist.faqno}</td>
                                       <!-- <td><a href="/sport/sportnoticeView?fcltyno=${faqlist.faqq}" class="lightgray">${faqlist.faqq} </a></td> -->
                                       <td>${faqlist.faqq}</td>
                                       <td>${faqlist.faqa}</td>
                                       <c:if test="${sessionId=='admin' }">
                                          <td><a href="/notice/FAQModify?faqno=${faqlist.faqno }"><button class="btn_simple btn_blue">수정</button></a>
                                       </c:if>
                                    </tr>
                                    </c:forEach>
                                 </tbody>
                              </table>
                            </div>
                              
                              
                               <c:if test="${sessionId=='admin' }">
									<!-- Table -->
									<div class="table-wrapper">
										<div style="text-align: right;">
											<a href="/notice/FAQWrite"><button type="button" class="button primary">FAQ 작성</button></a>
										</div>
									</div>
                               </c:if>
								
                              
					<!-- 하단 넘버링 버튼 -->
					<div class="col-12" style="margin: 0px auto;">
						<ul class="pagination">
					      <!-- 첫페이지 이동 -->
					      <c:if test="${page != 1 }">
						      <li class="first">
						         <a href="/notice/FAQ?page=1" class="button">
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
					           <a href="/notice/FAQ?page=${page-1}" class="button">
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
						          <a href="/notice/FAQ?page=${num}" class="page">
						           <div>${num}</div>
						          </a>
						       </li>
					        </c:if>
					        <c:if test="${num == page }">
					            <li class="num on">
					               <a href="/notice/FAQ?page=${num}" class="page active">
					                  <div>${num}</div>
					               </a>
					            </li>
					        </c:if>
					      </c:forEach>
					      <!-- 페이지 리스트 끝-->
					      <!-- 다음페이지 이동 -->
					      <c:if test="${page<maxPage}">
					        <li class="next">
					           <a href="/notice/FAQ?page=${page+1}" class="button">
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
						      <a href="/notice/FAQ?page=${maxPage}" class="button">
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
                           

				<%@ include file="../footer.jsp" %>
					 
                  </div>
               </div>

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