<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
   <head>
      <title>QnA</title>
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
											<li><a href="FAQ"> 자주 물어보는 질문(FAQ) </a></li>
											<li class="active" title="선택된 탭"><a href="QnA"> 질의응답(QnA) </a></li>
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
                                    <col width="10%"  />
                                    <col width="*" />
                                    <col width="*" />
                                    <col width="*"/>
                                    <col width="*"/>
                                 </colgroup>
                                 <thead>
                                    <tr>
                                       <th>NO.</th>
                                       <th>제목</th>
                                       <th>작성자</th>
                                       <th>작성일</th>
                                       <th>답변현황</th>
                                    </tr>
                                 </thead>
                                 
                                 
                                 <tbody>
                                    <c:forEach var="qnalist" items="${qnalist}">
                                    <tr>
                                       <td>${qnalist.qnano}</td>
                                       <td>
	                                       <c:forEach begin="1" end="${qnalist.qindent}" step="1" >
									           <img src="/images/icon_reply.png">
									        </c:forEach>
                                       <a href="/notice/QnAView?qnano=${qnalist.qnano}" class="lightgray">${qnalist.qnatitle} </a>
                                       </td>
                                       <td>${qnalist.id}</td>
                                       <td>${qnalist.qnadate}</td>
                                       <td>${qnalist.qnastatus}</td>
                                    </tr>
                                    </c:forEach>
                                 </tbody>
                              </table>
                            </div>
                              
                              
								<!-- Table -->
									<div class="table-wrapper">
										<div style="text-align: right;">
											<a href="/notice/QnAWrite"><button type="button" class="button primary">QnA 작성</button></a>
										</div>
									</div>
                              
                              
                              
					<!-- 하단 넘버링 버튼 -->
					<div class="col-12" style="margin: 0px auto;">
						<ul class="pagination">
							<!-- 첫 페이지 이동 -->
							<c:if test="${pageDto.page !=1}">
								<li><a href="/notice/QnA?page=1" class="button"> <img
										src="../images/general/pageFirst.png" style="width: 15px;" />
								</a></li>
							</c:if>
							<c:if test="${pageDto.page ==1}">
								<li><span class="button disabled"> <img
										src="../images/general/pageFirst.png"
										style="width: 15px; vertical-align: middle;" />
								</span></li>
							</c:if>
							<!-- 첫 페이지 이동 끝-->
							<!-- 이전 페이지 이동 -->
							<c:if test="${pageDto.page>1}">
								<li><a href="/notice/QnA?page=${pageDto.page-1}"
									class="button"> <img
										src="../images/general/pagePrevious.png"
										style="width: 15px; vertical-align: middle;" />
								</a></li>
							</c:if>
							<c:if test="${pageDto.page==1}">
								<li><span class="button disabled"> <img
										src="../images/general/pagePrevious.png"
										style="width: 15px; vertical-align: middle;" />
								</span></li>
							</c:if>
							<!-- 이전 페이지 이동 끝 -->
							<!-- 페이지 리스트 -->
							<c:forEach var="num" begin="${pageDto.startPage}"
								end="${pageDto.endPage}" step="1">
								<c:if test="${num != pageDto.page}">
									<li><a href="/notice/QnA?page=${num}" class="page">${num}</a></li>
								</c:if>
								<c:if test="${num == pageDto.page}">
									<li><a href="/notice/QnA?page=${num}"
										class="page active">${num}</a></li>
								</c:if>
							</c:forEach>
							<!-- 페이지 리스트 끝-->
							<!-- 다음 페이지 이동 -->
							<c:if test="${pageDto.page<pageDto.maxPage}">
								<li><a href="/notice/QnA?page=${pageDto.page+1}"
									class="button"> <img src="../images/general/pageNext.png"
										style="width: 15px; vertical-align: middle;" />
								</a></li>
							</c:if>
							<c:if test="${pageDto.page==pageDto.maxPage}">
								<li><span class="button disabled"> <img
										src="../images/general/pageNext.png"
										style="width: 15px; vertical-align: middle;" />
								</span></li>
							</c:if>
							<!-- 다음 페이지 이동 끝-->
							<!-- 끝 페이지 이동 -->
							<c:if test="${pageDto.page != pageDto.maxPage}">
								<li><a href="/notice/QnA?page=${pageDto.maxPage}"
									class="button"> <img src="../images/general/pageLast.png"
										style="width: 15px; vertical-align: middle;" />
								</a></li>
							</c:if>
							<c:if test="${pageDto.page == pageDto.maxPage}">
								<li><span class="button disabled"> <img
										src="../images/general/pageLast.png"
										style="width: 15px; vertical-align: middle;" />
								</span></li>
							</c:if>
							<!-- 끝 페이지 이동 끝-->
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