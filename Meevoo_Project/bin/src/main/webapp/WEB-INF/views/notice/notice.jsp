<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
   <head>
      <title>공지사항</title>
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
                        <br>
                        <br>
					 <!-- 중간에 공지사항 탭 넣기 : 공지사항 템플릿 -->
						<div id="container" class="container sub_container">
							<div class="contents" id="contents">
								<!-- breadcrumbs End -->
								<div class="cont-body">
									<div class="tab equal">
										<ul class="nav">
											<li class="active" title="선택된 탭"><a href="notice"> 공지사항 </a></li>
											<li><a href="FAQ"> 자주 물어보는 질문(FAQ) </a></li>
											<li><a href="QnA"> 질의응답(QnA) </a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>

				<!-- list형식으로 출력하기 -->
				<div class="table-wrapper">
					<table>
						<colgroup>
							<col width="10%" />
							<col width="*" />
							<col width="15%" />
							<col width="15%" />
							<col width="*%" />
						</colgroup>
						<thead>
							<tr>
								<th>NO.</th>
								<th>제목</th>
								<th>작성자</th>
								<th>작성일</th>
								<!-- <th>조회수</th> -->
								<c:if test="${sessionId=='admin' }">
									<th>Edit</th>
								</c:if>
							</tr>
						</thead>
						<tbody>
							<!-- notice 공지사항 리스트 가져오기!! -->
							<c:forEach var="nlist" items="${nlist}">
								<tr>
									<td>${nlist.notino}</td>
									<td><a href="/notice/noticeView?notino=${nlist.notino}" class="lightgray">${nlist.notititle}</a></td>
									<td>${nlist.notiid}</td>
									<td><fmt:formatDate value="${nlist.notidate}"
											pattern="yyyy-MM-dd" /></td>
									<%-- <td>${nlist.notihit}</td> --%>
									
									<c:if test="${sessionId=='admin' }">
										<td><a href="/notice/noticeModify?notino=${nlist.notino }"><button class="btn_simple btn_blue">수정</button></a></td>
									</c:if>
									
								</tr>
							</c:forEach>
						</tbody>
					</table>
					
					
					<c:if test="${sessionId=='admin' }">
						<!-- 공지사항작성 Start -->
						<section>
							<!-- Table -->
							<div class="table-wrapper">
								<div style="text-align: right;">
									<a href="/notice/noticeWrite"><button type="button" class="button primary">공지사항 작성</button></a>
								</div>
							</div>
						</section>
						<!-- 공지사항 작성 End -->
					</c:if>


				<div class="col-12" style="margin: 0px auto;">
					<ul class="pagination">
				      <!-- 첫페이지 이동 -->
				      <c:if test="${page != 1 }">
					      <li class="first">
					         <a href="/notice/notice?page=1&search_input=${search_input}" class="button">
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
				           <a href="/notice/notice?page=${page-1}&search_input=${search_input}" class="button">
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
					          <a href="/notice/notice?page=${num}&search_input=${search_input}" class="page">
					           <div>${num}</div>
					          </a>
					       </li>
				        </c:if>
				        <c:if test="${num == page }">
				            <li class="num on">
				               <a href="/notice/notice?page=${num}" class="page active">
				                  <div>${num}</div>
				               </a>
				            </li>
				        </c:if>
				      </c:forEach>
				      <!-- 페이지 리스트 끝-->
				      <!-- 다음페이지 이동 -->
				      <c:if test="${page<maxPage}">
				        <li class="next">
				           <a href="/notice/notice?page=${page+1}&search_input=${search_input}" class="button">
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
					      <a href="/notice/notice?page=${maxPage}&search_input=${search_input}" class="button">
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

				<!-- Footer -->
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