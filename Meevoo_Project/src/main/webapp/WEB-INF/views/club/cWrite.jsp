<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
	<head>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<title>모임글 작성</title>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
		<link rel="stylesheet" href="../css/main_kim.css" />
		<link rel="icon" href="../images/main/logo2.png">
		
<c:if test="${sessionId==null}">
 <script>
   alert ("로그인을 하셔야 모임글 작성이 가능합니다.");
   location.href="/member/login";
 </script>
</c:if>
<script>
  //페이지가 로드되면 실행되는 함수
  window.onload = function() {
	  // 1. 모임장소 검색시 시설 상세페이지 다녀오기
      // URL 파라미터를 가져오는 함수
      function getURLParameter(name) {
          return decodeURIComponent((new RegExp('[?|&]' + name + '=' + '([^&;]+?)(&|#|;|$)').exec(location.search) || [, ""])[1].replace(/\+/g, '%20')) || null;
      }

      // 자식 창의 입력 칸을 가져옴
      var inputField = document.getElementById("inputField");
      var sfnmField = document.querySelector(".sfnm");
      var dongcateField = document.querySelector(".dongcate");
      var clocField = document.querySelector(".cloc");
      var scateField = document.querySelector(".scate");

      // 부모 창에서 전달받은 "sfno" 값을 가져와서 자식 창의 입력 칸에 기입
      var sfnoFromParent = getURLParameter("sfno");
      var sfnmFromParent = getURLParameter("sfnm");
      var dongcateFromParent = getURLParameter("dongcate");
      var clocFromParent = getURLParameter("cloc");
      var scateFromParent = getURLParameter("scate");
      
      inputField.value = sfnoFromParent;
      sfnmField.value = sfnmFromParent;
      dongcateField.value = dongcateFromParent;
      clocField.value = clocFromParent;
      scateField.value = scateFromParent;
      
      /* 
      // 2. 모임일자 선택시 오늘부터 30일까지만 선택 가능
	  // 오늘 날짜를 가져옵니다.
	  var today = new Date().toISOString().split('T')[0];
	  // 30일 후의 날짜를 계산합니다.
	  var thirtyDaysLater = new Date();
	  thirtyDaysLater.setDate(thirtyDaysLater.getDate() + 30);
	  var thirtyDaysLaterStr = thirtyDaysLater.toISOString().split('T')[0];
	  // input 요소에 최소 날짜와 최대 날짜를 설정합니다.
	  var dateInput = document.getElementById('cdodate');
	  dateInput.setAttribute('min', today);
	  dateInput.setAttribute('max', thirtyDaysLaterStr);
       */
	  
  };
  
  
  
  
  //모임글 등록
  function cWriteChkBtn(){
	  if(confirm("모임글을 저장하시겠습니까?")){
		cWriteFrom.submit(); //전송
		alert("모임글이 등록되었습니다.")
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
								<section id="banner">
									<div class="content">
										<header>
											<h1>모임 모집하기</h1>
											<h3>내가 필요한 모임을 직접 만들어보세요.</h3>
											<h4>다양한 사람들과 공통된 관심사로 새로운 연결을 가져봅시다.</h4>
										</header>
									</div>
								</section> 
								 
								<!-- 입력칸 -->
								<section>
								<div>
								  <ul style="margin: 0; margin-bottom: 0.5em; padding: 0;">
								    <li><span style="color: #f56a6a; font-weight: bold;">*</span> 표시된 항목은 필수 항목이므로 반드시 입력하셔야 모임등록이 진행됩니다.</li>
								  </ul>
								</div>
								<form action="/club/cWrite" method="post" name="cWriteFrom" enctype="multipart/form-data" >
								  <div class = "table-wrapper">
								    <table>
								      <colgroup>
								        <col width="22%" />
								        <col width="39%" />
								        <col width="39%" />
								      </colgroup>
									  <tbody>
									    <tr>
										  <th>모임장소 <span style="color: #f56a6a; font-weight: bold;">*</span></th>
										  <td colspan="2">
										    <ul>
										      <li><input type="text" name="sfno" class="sfno" type="button" id="inputField" style="display:block; margin-bottom:0.5em;" placeholder="모임장소를 선택하기 위해 클릭해 주세요" readonly onclick="javascript:location.href='/club/cWriteSearchSF'"></input></li>
										      <li><input type="text" name="sfnm" class="sfnm" placeholder="시설 이름" style="margin-bottom:0.5em;" readonly ></li>
										      <li></li>
										      <li><input type="text" name="cloc" class="cloc" placeholder="주소" style="margin-bottom:0.5em;" readonly ></li>
										    </ul>
										  </td>
									    </tr>
									    <tr>
										  <th>운동종목</th>
										  <td colspan="2">
										    <ul>
										      <li><input type="text" name="scate" class="scate" placeholder="모임장소를 선택하시면 자동으로 기입됩니다" readonly ></li>
										    </ul>
										  </td>
									    </tr>
									    <tr>
										  <th>모임이름 <span style="color: #f56a6a; font-weight: bold;">*</span></th>
										  <td colspan="2">
										    <ul>
										      <li><input type="text" name="cnm" class="cnm" placeholder="한글로 최대 25자 까지 입력 가능 (영문은 최대 50자)"></li>
										    </ul>
										  </td>
									    </tr>
									    <tr>
										  <th>모임일시 <span style="color: #f56a6a; font-weight: bold;">*</span></th>
										  <td>
										    <ul>
										      <li><input type="date" name="cdodate_date2" class="cdodate_date" id="cdodate_date" style="margin-bottom:1em;"  /></li>
										    </ul>
										  </td>
										  <td>
										    <ul>
										      <li><input type="time" name="cdodate_time2" class="cdodate_time" id="cdodate_time"   /></li>
										    </ul>
										  </td>
									    </tr>
									    <tr>
										  <th>모집인원 <span style="color: #f56a6a; font-weight: bold;">*</span></th>
										  <td colspan="2">
										    <ul>
										      <li><input type="number" min="2" max="15" class="crecruitlimit" id="crecruitlimit" name="crecruitlimit" placeholder="작성자 포함 최대 15명까지 모집가능" oninput="this.value = this.value.replace(/[^0-9.]/g, '').replace(/(\..*)\./g, '$1');" /></li>
										    </ul>
										  </td>
									    </tr>
									    <tr>
										  <th>소개내용</th>
										  <td colspan="2">
										    <ul>
										      <li><textarea name="ccontent" class="ccontent" placeholder="모입모집을 위한 소개글을 작성해주세요. (최대 한글 250자 까지 입력 가능)" cols="40" rows="5" ></textarea></li>
										    </ul>
										  </td>
									    </tr>
									    <tr>
										  <th>사진첨부</th>
										  <td colspan="2">
										    <ul>
										      <li><input type="file" name="file" id = "file" class="file" /></li>
										    </ul>
										  </td>
									    </tr>
									  </tbody>
									  <!-- 운동모임 작성 입력 버튼 -->
									  <tfoot>
									    <tr>
										   <th></th>
										   <td colspan="2">
										     <ul class="actions" style="float: right; margin-top: 3em;">
										       <li><input type="button" value="취소" onclick="javascript:location.href='/club/club';" /></li>
										       <li><input type="reset" value="초기화" /></li>
										       <li><input type="button" value="등록" class="primary" onclick="cWriteChkBtn()" /></li>
									         </ul>
										 </td>
									   </tr>
									  </tfoot>
								  <!-- 운동모임 작성 입력 버튼 끝-->
								    </table>
								      <ul>
								        <li><input type="hidden" name="id" id = "id" value="${sessionId }" ></li>
								        <li><input type="hidden" name="dongcate" class="dongcate" placeholder="동 이름" ></li>
								      </ul>
								  </div>
								</form>
								</section>
								 

							    <!-- Footer -->
								<%@ include file="../footer.jsp" %>
						</div>
					</div>
			</div>

		<!-- Scripts -->
			<script src="../js/jquery.min.js"></script>
			<script src="../js/browser.min.js"></script>
			<script src="../js/breakpoints.min.js"></script>
			<script src="../js/util.js"></script>
			<script src="../js/main.js"></script>
	</body>
</html>