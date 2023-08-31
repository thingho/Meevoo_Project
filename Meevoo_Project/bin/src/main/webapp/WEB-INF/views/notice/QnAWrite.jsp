<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE HTML>
<html>
   <head>
      <title>QnA 추가하기</title>
      <!-- 제이쿼리 최신 -->
      <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
      <meta charset="utf-8" />
      <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
      <link rel="stylesheet" href="../css/main_yang.css" />
      <script>
	     function writeQnABtn(){
	    	 alert("QnA가 등록되었습니다");
	    	 writeQnAFrm.submit(); //전송
	    	 
	     }
	  </script>
	  <!-- 날짜가져오기 : 아직 못함 -->
	  <script>
		  document.getElementById('currentDate').value = new Date().toISOString().substring(0, 10);
	  </script>
	  
   </head>
   <body class="is-preload">

	<c:if test="${sessionId == null}">
		<script>
		  alert("로그인을 하셔야 리뷰등록이 가능합니다.");
		  location.href="/member/login";
		</script>
	</c:if>


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
					                        <h3>모임 생성하기
					                    	</h3>
					                    </div>
					        			<!--card_title-->
					        			
					        			
					        			
					        			
									  <div class="container body">
									    <div class="main_container">
									      <div class="right_col" role="main" style="min-height: 100%;">
									        <div class="">
									          <div class="clearfix"></div>
									          <div class="row">
									            <div class="col-md-12 col-sm-12">
									              <div class="x_panel">

									                <div class="x_content">
									                  <form class="" action="/notice/QnAWrite" method="post" name="writeQnAFrm" enctype="multipart/form-data"
									                    novalidate="">
									                    
									                   
									                    
									                    <!-- no 디폴트값을 그냥 0으로 넣고 쿼리문에서 nextval로 넣어둠 -->
								                        <input class="form-control" name="notino" type="hidden" >
								                        
									                    <div class="field item form-group">
									                      <label class="col-form-label col-md-3 col-sm-3  label-align">작성자<span
									                          class="required">*</span></label>
									                      <div class="col-md-6 col-sm-6">
									                        <input class="form-control" type="text" name="id" value=${sessionId }>
									                      </div>
									                    </div>
									                    <div class="field item form-group">
									                      <label class="col-form-label col-md-3 col-sm-3  label-align">제목<span
									                          class="required">*</span></label>
									                      <div class="col-md-6 col-sm-6">
									                        <input class="form-control" type="text" name="qnatitle" >
									                      </div>
									                    </div>
									                    
									                    <div class="field item form-group">
									                      <label class="col-form-label col-md-3 col-sm-3  label-align">작성일<span
									                          class="required">*</span></label>
									                      <div class="col-md-6 col-sm-6">
									                        <input class="form-control" name="qnadate"  type="date" value="currentDate"> 
									                      </div>
									                    </div>
									                    
									                     <!-- <div class="field item form-group">
									                      <label class="col-form-label col-md-3 col-sm-3  label-align">답변현황<span
									                          class="required">*</span></label>
									                      <div class="col-md-6 col-sm-6">
									                        <input type="text" class="form-control" name="qnastatus" value="답변대기">
									                      </div>
									                    </div> -->
									                    <input type="hidden" class="form-control" name="qnastatus" value="답변대기">
									                        
									                    <div class="field item form-group">
									                      <label class="col-form-label col-md-3 col-sm-3  label-align">내용<span
									                          class="required">*</span></label>
									                      <div class="col-md-6 col-sm-6">
									                        <textarea  name="qnacontent"></textarea>
									                      </div>
									                    </div>
									                   
									                    <div class="ln_solid">
									                      <div class="form-group">
									                        <div class="col-md-6 offset-md-3">
									                          <button type="button" onclick="writeQnABtn()" class="btn btn-primary" style="margin: 0 auto;">Submit</button>
									                          <button type="reset" class="btn btn-success">Reset</button>
									                        </div>
									                      </div>
									                    </div>
									                  </form>
									                  
									                </div>
									              </div>
									            </div>
									          </div>
									        </div>
									      </div>
									    </div>
									  </div>
					        			
					        		</div>
					        		<!--card-->
					        	</div>
					        </div>
					        <!--//content-->
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
         <script type="text/javascript" src="./Admin Template - Light_files/dataTables.checkboxes.min.js.다운로드"></script>
         
         <!-- 회원수정 페이지 -->
           <script src="../Gentelella Alela! __files/jquery.min.js.다운로드"></script>
 		   <script src="../Gentelella Alela! __files/multifield.js.다운로드"></script>
     	   <script src="../Gentelella Alela! __files/validator.js.다운로드"></script>
     	   <script src="../Gentelella Alela! __files/jquery.min.js(1).다운로드"></script>
 		   <script src="../Gentelella Alela! __files/bootstrap.bundle.min.js.다운로드"></script>
  		   <script src="../Gentelella Alela! __files/fastclick.js.다운로드"></script>
  		   <script src="../Gentelella Alela! __files/nprogress.js.다운로드"></script>

  		   <script src="../Gentelella Alela! __files/custom.min.js.다운로드"></script>
  		   <script defer="" src="../Gentelella Alela! __files/v2cb3a2ab87c5498db5ce7e6608cf55231689030342039"
            integrity="sha512-DI3rPuZDcpH/mSGyN22erN5QFnhl760f50/te7FTIYxodEF8jJnSFnfnmG/c+osmIQemvUrnBtxnMpNdzvx1/g=="
            data-cf-beacon="{&quot;rayId&quot;:&quot;7e682d96cce7afc9&quot;,&quot;token&quot;:&quot;cd0b4b3a733644fc843ef0b185f98241&quot;,&quot;version&quot;:&quot;2023.4.0&quot;,&quot;si&quot;:100}"
            crossorigin="anonymous"></script>

   </body>
</html>