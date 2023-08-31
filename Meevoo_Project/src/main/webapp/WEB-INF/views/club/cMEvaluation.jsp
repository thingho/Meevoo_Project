<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
	<head>
		<title>모임 맴버 평가</title>
		<script src="http://code.jquery.com/jquery-latest.min.js"></script>
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
						<div class="inner">

							<!-- Header -->
						    <%@ include file="../top.jsp" %>

							<!-- Banner -->
								<section id="banner">
									<div class="content">
										<header>
											<h1>최도윤 님! 모임은 어떠셨나요?</h1>
										</header>
									</div>
								</section>
								
							<!-- Section -->
							
								<section>
									<header class="major">
										<h2>모임 참여 인원 : <span>2</span>명</h2>
									</header>
									<form action="doCMEvaluation" method="get" name="cmevaluation" style="clear: both;position: relative;">
									  <div class="table-wrapper">
									  <style>
									    .cmevaluation {border-collapse: collapse; }    
									  </style>
									    <table class="cmevaluation">
										     <colgroup>
										      <col width="10%">
										      <col width="25%">
										      <col width="13%">
										      <col width="13%">
										      <col width="13%">
										      <col width="13%">
										      <col width="13%">
										     </colgroup>
									      <thead>
									        <tr>
									          <th></th>
									          <th></th>
									          <th style="text-align:center">매우좋음</th>
									          <th style="text-align:center">좋음</th>
									          <th style="text-align:center">보통</th>
									          <th style="text-align:center">나쁨</th>
									          <th style="text-align:center">매우나쁨</th>
									        </tr>
									      </thead>
									      <tbody>
									        <tr>
									          <td style="vertical-align : middle">
									            <div>
											      <span class="image">
												    <img src="https://cdn-icons-png.flaticon.com/512/848/848043.png" style="width:100px; border-radius: 50%;" />
												  </span>
									            </div>
									          </td>
									          <td style="vertical-align : middle; ">
												jihunan
									          </td>
									          <td style="vertical-align : middle; text-align:center;">
									           <div class="col-4 col-12-small">
											    <input type="radio" name="evaluation2" id="verygood2" value="verygood">
											    <label for="verygood2"></label>
									           </div>
									          </td>
									          <td style="vertical-align : middle; text-align:center;">
									            <input type="radio" name="evaluation2" id="good2" value="good">
									            <label for="good2"></label>
									          </td>
									          <td style="vertical-align : middle; text-align:center;">
									            <input type="radio" name="evaluation2" id="average2" value="average">
									            <label for="average2"></label>
									          </td>
									          <td style="vertical-align : middle; text-align:center;">
									            <input type="radio" name="evaluation2" id="poor2" value="poor">
									            <label for="poor2"></label>
									          </td>
									          <td style="vertical-align : middle; text-align:center;">
									            <input type="radio" name="evaluation2" id="bad2" value="bad">
									            <label for="bad2"></label>
									          </td>
									        </tr>
									        
									        
									        
									      </tbody>
									    </table>
									  </div>
									  <br>
									  <hr>
									  <br>
									  <div class="col-12"; style="postion:flex; width: 100%;">
										<ul class="actions" style="justify-content: flex-end;">
											<li><input type="reset" value="초기화" /></li>
											<li><input type="button" value="적용" onclick="javascript:location.href='/club/cSRSuggestion';"  class="primary" /></li>
										</ul>
									  </div>
									</form>
								</section>

							

						</div>
					</div>



						</div>
							<!-- Footer -->
						    <%@ include file="../footer.jsp" %>
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