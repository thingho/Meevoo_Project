<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<!--
	Editorial by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>Join</title>
<meta charset="utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="description" content="JARDIN SHOP" />
<meta name="keywords" content="JARDIN SHOP" />
<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scaleable=no" />
<link rel="stylesheet" href="../css/main.lee.css" />
<link rel="stylesheet" href="../css/login.lee.css" /> 
<link rel="stylesheet" href="../css/content.lee.css" />
<style>
	.attention{text-align: center;}
	#emailList{margin: 5px 0 0;}
	#pta_email{height:80px;}
	.addressType{text-align: left;}
	#postcode{text-align: left;}
	#m{width:30px; margin:7px; font-size: 12px;}
	#f{width:30px; margin:7px; font-size: 12px;}
	#chk_e{width:100px; padding:8px 0 0 10px;}
	#postcode1{height:50px; padding: 0;}
	#pta_email{display: none;}
	#id{padding:10px 0 0 0;}
	#korname{padding:10px 0 0 0;}
	.inter{padding:10px 0 0 10px;}
	#li_email{padding:0;}
	#birth{height:30px;}
	#dongcate{height:30px;}
	#scate{height:30px;}
	#btnA{padding:0 0 20px 0;}
</style>
<!-- 제이쿼리 최신 -->
<script  src="http://code.jquery.com/jquery-latest.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- <script type="text/javascript">
//joinform_check 함수로 유효성 검사
function joinform_check() {
	//변수에 담아주기
  var name = document.getElementById("name");
  var id = document.getElementById("mem_id");
  var pw = document.getElementById("mem_pw");
  var pw2 = document.getElementById("mem_pw2");
  var email1 = document.getElementById("mem_email1");
  var email2 = document.getElementById("mem_email2");
  var m = document.getElementById("m");
  var f = document.getElementById("f");
  var addr1 = document.getElementById("addr1");
  var addr2 = document.getElementById("addr2");
  var birth = document.getElementById("mem_birth");
  var exercise = document.getElementById("mem_exercise");
  
  if (name.value == "") {
    alert("이름을 입력하세요.");
    name.focus();
    return false;
  };
  
  if (id.value == "") { //해당 입력값이 없을 경우 같은말: if(!id.value)
    alert("아이디를 입력하세요.");
    id.focus(); //focus(): 커서가 깜빡이는 현상, blur(): 커서가 사라지는 현상
    return false; //return: 반환하다 return false:  아무것도 반환하지 말아라 아래 코드부터 아무것도 진행하지 말것
  };

  if (pw.value == "") {
    alert("비밀번호를 입력하세요.");
    pw.focus();
    return false;
  };

  //비밀번호 영문자+숫자+특수조합(8~25자리 입력) 정규식
  /* var pwdCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^*+=-])(?=.*[0-9]).{8,25}$/; */

  if (!pwCheck.test(pw.value)) {
    alert("비밀번호는 숫자만 5자리 사용해야 합니다.");
    pw.focus();
    return false;
  };

  if (pw2.value !== pw.value) {
    alert("비밀번호가 일치하지 않습니다..");
    pw2.focus();
    return false;
  };

  if (email1.value == "") {
	    alert("비밀번호를 입력하세요.");
	    email1.focus();
	    return false;
	  };

  if (email2.value == "") {
	    alert("비밀번호를 한번 더 입력하세요.");
	    email2.focus();
	    return false;
	  };

  if (!f.checked && !m.checked) { //둘다 미체크시
    alert("성별을 선택해 주세요.");
    f.focus();
    return false;
  }

  if (addr1.value == "") {
    alert("우편번호를 검색하세요.");
    addr1.focus();
    return false;
  }
  
  if (addr2.value == "") {
    alert("상세주소를 입력하세요.");
    addr2.focus();
    return false;
  }
  
  var reg = /^[0-9]+/g; //숫자만 입력하는 정규식

  if (!reg.test(mobile.value)) {
    alert("전화번호는 숫자만 입력할 수 있습니다.");
    mobile.focus();
    return false;
  }


  if (!agree.checked) { //체크박스 미체크시
    alert("약관 동의를 체크하세요.");
    agree.focus();
    return false;
  }

//입력 값 전송
  document.join_form.submit(); //유효성 검사의 포인트   
}

/* //아이디 중복체크 팝업창(현재 공백문서)
function id_check() {
  //window.open("팝업될 문서 경로", "팝업될 문서 이름", "옵션");
  window.open("", "", "width=600, height=200, left=200, top=100");
} */

</script> -->

<!-- 사용할페이지 -->

<script type="text/javascript"> /* 글자수, 입력 조건 스크립트 */
	function joinform_check(){
		let nameCheck = /^[ㄱ-ㅎ가-힣]{2,}$/ //^[ㄱ-ㅎ가-힣].{1,}$/ ; // ^ 는 시작 [모든 국문자] + 는 하나이상 $ 는 끝
		let numCheck = /^[0-9]+$/ ;  //숫자인지
		let korCheck = /^[ㄱ-ㅎ가-힣]+$/ ; //한글인지
		let alphaCheck = /^[a-zA-Z]+$/ ; //영문자인지
		let etcCheck = /^[!@#$%^&*,.?_-]+$/ ; //특수문자인지
		let idCheck = /^[a-z]{2,}$/ ; //영문자, 숫자, _ 만 가능 {} 는 자릿수
		let idCheck1 = /^[a-zA-Z0-9_]{2,5}$/ ; //영문자, 숫자, _ 만 가능 {} 는 자릿수
		let idCheck2 = /^[a-zA-Z]{1}[a-zA-Z0-9_]{2,5}$/ ; //1번째 무조건 영문자만 가능
		let pwCheck = /^(?=.*[a-zA-Z])(?=.*[0-9])(?=.*[!@#$%^&*]).{2,7}$/ ;  // ? 는 비교 . 은 한개씩 * 모든 것  즉 한개씩 모든 것을 가져와서 비교해라 한개라도 있으면 True 
		let pwCheck2 = /^[0-9]{5}$/ ;
		let phoneCheck = /^[0-9]{2,3}-[0-9]{3,4}-[0-9]{4}$/ ; 010-1111-1111
		
		if(!nameCheck.test($("#name").val())){
			alert("2글자 이상, 한글만 입력가능합니다.");
			$("#name").focus();
			return false;
		}
		
		//아이디 입력, 소문자 2자리 이상 입력 가능
		if ($("#id").val()!="") {
			if(!idCheck.test($("#id").val())){
				alert("영문 소문자 2자리 이상 입력이 가능합니다.");
				$("#id").focus();
				return false;
			}
		  }else{
		    alert("아이디를 입력하세요.");
		    $("#id").focus();
		    return false;
		  }
		
		//비밀번호 입력, 숫자 5자리만 입력 가능
		if($("#pw").val()!=""){
			if(!pwCheck2.test($("#pw").val())){
				alert("5자리 숫자만 입력이 가능합니다.");
				$("#pw").focus();
				return false;
			}
		}else{
			alert("비밀번호를 입력하세요");
			$("#pw").focus();
			return false;
		}
		
		//비밀번호 확인 입력
		if($("#pw2").val()!=""){
			if ($("#pw2").val() != $("#pw").val()) {
			    alert("비밀번호가 일치하지 않습니다..");
			    $("#pw2").focus();
			    return false;
			}
		}else{
			alert("비밀번호를 한번 더 확인하세요")
			$("#pw2").focus();
			return false;
		}
		
		//이메일 아이디 입력
		if ($("#email1").val()=="") {
		    alert("이메일을 입력하세요.");
		    $("#email1").focus();
		    return false;
		}

		/* //이메일 주소 입력
		if ($("#email2").val()=="") {
		    alert("이메일을 입력하세요.");
		    $("#email2").focus();
		    return false;
		} */
		
		
		//우편번호, 도로명 주소 입력
		if ($("#addr1").val()=="") {
		    alert("우편번호를 검색하세요.");
		    $("#addr1").focus();
		    return false;
		}
		
		//상세주소 입력
		if ($("#addr2").val()=="") {
			alert("상세주소를 입력하세요.");
			$("#addr2").focus();
		    return false;
		}
		
		//태어난해 입력
		if ($("#birth").val()=="") {
			alert("태어난 해를 선택하세요.");
			$("#birth").focus();
		    return false;
		}
		
		//관심지역 입력
		if ($("#dongcate").val()=="") {
			alert("관심지역을 선택하세요.");
			$("#dongcate").focus();
		    return false;
		}

		//운동종목 입력
		if ($("#scate").val()=="") {
			alert("운동종목을 선택하세요.");
			$("#scate").focus();
		    return false;
		}
		
		
			alert("가입을 축하합니다^^")
			memberFrm.submit(); //전송
		
	}
</script> <!-- 사용할페이지 -->

<!-- 우편번호찾기 스크립트 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript"> 
function addrBtn() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.roadAddress;
            }
            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("addr3").value = extraAddr;
            } else {
                document.getElementById("addr3").value = '';
            }
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('postcode').value = data.zonecode;
            document.getElementById("addr1").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("addr2").focus();
        }
    }).open();
}
</script>


</head>
	
	<body class="is-preload">

		<!-- Wrapper -->
			<div id="wrapper">

				<!-- Main -->
					<div id="main">
						<div class="inner">

						<!-- top.jsp -->
						<%@ include file="../top.jsp" %>


							 	<!-- contents -->
								<div id="contents">
									<div id="member">
										<h2><strong>회원가입</strong>
										<span>회원으로 가입하시면 보다 더 다양한 혜택을 누리실 수 있습니다.</span></h2>
										
					
										<div class="attention">
											<ul>
												<li>* 표시된 항목은 필수 항목이므로 반드시 입력하셔야 회원가입이 진행됩니다.</li>
											</ul>
										</div>
					
										<form action="/member/join" id="memberFrm" name="memberFrm" method="post" onsubmit="check()">
										
										<div class="memberbd">
											<table summary="이름, 아이디, 비밀번호, 비밀번호 확인, 이메일, 이메일확인, 주소, 생년, 성별, 스포츠 종목 순으로 회원가입 정보를 등록할수 있습니다." class="memberWrite" border="1" cellspacing="0">
												<caption display="none">회원가입 입력</caption>
												<colgroup>
												<col width="22%" class="tw30" />
												<col width="*" />
												</colgroup>
												<tbody>
													<tr>
														<th scope="row"><span>이름 *</span></th>
														<td>
															<ul class="pta">
																<li class="r10"><input type="text" name="usernm" id="name" class="w134"/></li>
																<li id="korname"><span class="mvalign">※ 한글만 사용가능</span></li>
															</ul>
														</td>
													</tr>
													<tr>
														<th scope="row" style="height:56.59px;"><span>아이디 *</span></th>
														<td style="height:56.59px;">
															<ul class="pta" style="margin:0;">
																<li class="r10"><input type="text" name="id" id="id" class="w134" /></li>
																<li id="idKeyText" style="width:100px; padding:8px 0 0 0;"><a onclick="idcheckBtn()" class="button primary small fit">중복확인</a></li>
																<li id="idCheckText" class="pt5"><span class="mvalign">※ 영문 소-문자 2자리 이상 입력 가능</span></li>
															</ul>
														</td>
													</tr>
													
													<script type="text/javascript">
														function idcheckBtn(){ //ajax은 페이지가 아닌 값으로 넘겨준다.
																//alert("아이디 중복검사");
															$.ajax({
																url:"idcheck",
																type:"get",
																data:{"id" :$("#id").val()},
																success:function(result){
																	//alert("아이디를 확인하였습니다.");
																	/* checkId = result; */
																	console.log("checkedId : "+result);
																	if($("#id").val()!=""){
																		if(result=="success"){
																			$("#idCheckText").html("<span class='mvalign blue'>* 사용가능한 아이디입니다.</span>")
																		}else{
																			$("#idCheckText").html("<span class='mvalign red'>* 아이디를 사용할 수 없습니다.</span>")
																			$("#id").val("");
																		}
																	}else{
																		alert("아이디를 입력 후 중복확인을 해주세요");
																		$("#id").focus();
																	}
																},
																error:function(){
																	alert("실패");
																	$("#id").focus();
																}
															});
														}
													</script>
													<tr>
														<th scope="row"><span>비밀번호 *</span></th>
														<td>
															<ul class="pta">
																<li class="r10"><input type="password" name="pw" id="pw" class="w134" /></li>
																<li style="padding:10px 0 0 0;"><span class="mvalign">※ 숫자로 5자만 가능</span></li>
															</ul>
														</td>
													</tr>
													<script>
														function pwKey(){
															let pw1 = $("#pw").val();
															if(pw1 == $("#pw2").val()){
																$("#pwKeyText").html("<span class='mvalign blue'>* 비밀번호가 일치합니다.</span>")
															}else{
																$("#pwKeyText").html("<span class='mvalign red'>* 비밀번호가 일치하지 않습니다.</span>")
															}
															
															console.log($("#pw2").val());
															return false;
														}
													</script>
													
													<tr>
														<th scope="row"><span>비밀번호 확인 *</span></th>
														<td>
															<ul class="pta">
																<li class="r10"><input type="password" onkeyup="pwKey()" id="pw2" class="w134" /></li>
																<li id="pwKeyText">
																</li>
															</ul>
														</td>
													</tr>
													<tr>
														<th scope="row"><span>이메일</span></th>
														<td>
															<ul class="pta">
																<li id="li_email"><input type="text" name="email" id="email1" class="w134" style="width:163px;"/></li>
																<!-- <li><input type="text" name="email1" id="email1" class="w134" style="width:163px;"/></li>
																<li id=valign1><span id="middle" class="valign">&nbsp;@&nbsp;</span></li>
																<li class="r10"><input type="text" name="email2" id="email2" class="w134" style="width:163px;"/></li> -->
																<!-- <script> <사용할 스크립트>
																	function email_chn(){
																		console.log($("#emailList").val());
																		if($("#emailList").val()=="txt"){
																			$("#email2").val("");
																			$("#email2").attr("readonly",false);
																			$("#email2").focus();
																		}else{
																			$("#email2").val($("#emailList").val());
																			$("#email2").attr("readonly",true);
																		}
																	}
																</script> <사용할 스크립트> -->
																<!-- <li>
																	<select id="emailList" onchange="email_chn()">
																		<option value="txt" selected="selected">직접입력</option>
																		<option value="naver.com">naver.com</option>
																		<option value="daum.net">daum.net</option>
																		<option value="hanmail.net">hanmail.net</option>
																		<option value="nate.com">nate.com</option>    
																		<option value="yahoo.co.kr">yahoo.co.kr</option>    
																		<option value="paran.com">paran.com</option>    
																		<option value="empal.com">empal.com</option>    
																		<option value="hotmail.com">hotmail.com</option>    
																		<option value="korea.com">korea.com</option>    
																		<option value="lycos.co.kr">lycos.co.kr</option>    
																		<option value="dreamwiz.com">dreamwiz.com</option>    
																		<option value="hanafos.com">hanafos.com</option>    
																		<option value="chol.com">chol.com</option>    
																		<option value="gmail.com">gmail.com</option>    
																		<option value="empas.com">empas.com</option>
																	</select>&nbsp;&nbsp;&nbsp;
																</li>
																<input type="hidden" name="email" id="email" value=""> -->
																<li id="chk_e"><a onclick="emailBtn()" style="cursor: pointer;" class="button primary small fit">인증코드 발송</a></li>
															</ul>
															<!-- <script>
																$("#email1").blur(function(){
																	email();
																});
																$("#email2").change(function(){
																	email();
																});
																function email(){
																	const email1 = $("#email1").val();
																	const middle = $("#middle").text();
																	const email2 = $("#email2").val();
																	if(email1 != "" && address != ""){
																		$("#email").val(email1+middle+email2);
																	}
																}
															</script> -->
															<script> <!-- <사용할 스크립트>
																let temp_code=""; //전역변수로 사용
																
																function emailBtn(){
																	if($("#name").val()=="" || $("#email1").val()==""/*  || $("#email2").val()=="" */){
																		alert("이름과 이메일을 입력한 후 인증코드 발송 버튼을 클릭하세요");
																	}else{
																		$("#pta_email").css("display","block");
																	}
																	
																	$.ajax({
																		url:"/member/emailSend",
																		type:"post",
																		data:{"usernm":$("#name").val(),"email":$("#email1").val()/* +"@"+$("#email2").val() */},
																		success:function(data){
																			alert("이메일이 발송되었습니다.");
																			temp_code = data;
																			console.log("pwCode : "+temp_code);
																			$("#name").attr("readonly",true);
																		},
																		error:function(){
																			alert("실패");
																		}
																	});
																}
																
																function authBtn(){
																	if($("#temp_code").val().length==0){
																		alert("인증코드를 입력하셔야 합니다.");
																		$("#temp_code").focus();
																		return false;
																	}
																	console.log("authBtn : "+temp_code)
																	console.log("authBtn2 : "+$("#temp_code").val())
																	
																	if(temp_code==$("#temp_code").val()){
																		
																		alert("이메일 인증이 완료되었습니다.");
																	}else{
																		alert("이메일 인증코드가 틀립니다. 다시 인증요청을 해주세요");
																		$("#temp_code").val("");
																	}
																} -->
															</script> <!-- <사용할 스크립트> -->
															<ul id="pta_email" class="pta">
																<li class="r10"><input type="email" id="temp_code" class="w134" /></li>
																<li style="width:100px; text-align:center; margin:0 auto; padding:8px 0 0 0;"><a style="cursor: pointer;" onclick="authBtn()" class="button primary small fit">인증코드 확인</a></li>
																<li class="pt5"><span class="mvalign">※ 이메일을 확인해서 인증코드를 입력해주세요</span></li>
															</ul>
														</td>
													</tr>
													<tr>
														<th scope="row" id="genderchk"><span>성별 *</span></th>
														<td>
															<ul class="pta">
																<li class="gender">
																	<input type="radio" name="gender" id="receive_yes" class="radio_t" value="male" checked="checked"/><label for="receive_yes" id="m">남</label>
																</li>
																<li class="gender">
																	<input type="radio" name="gender" id="receive_no" class="radio_t" value="female" /><label for="receive_no" id="f">여</label>
																</li>
															</ul>
														</td>
													</tr>
													<tr>
														<th scope="row"><span>주소 *</span></th>
														<td>
															<ul class="pta">
																<li id="postcode1">
																	<input type="text" name="postcode" id="postcode" class="w134" readonly/>&nbsp;
																</li>
																<li style="width:100px; padding:8px 0 0 10px;">
																	<a onclick="addrBtn()" class="button primary small fit"><span>우편번호 찾기</span></a></li>
																<li class="pt5"><input type="text" name="addr" id="addr1" class="addressType" readonly/></li>
																<li class="pt5"><input type="text" name="addr2" id="addr2" class="addressType" /></li>
																<li class="pt5"><input type="text" name="addr3" id="addr3" class="addressType" /></li>
																<li class="cb" style="padding:5px 0 0 0;">
																<!-- <input type="hidden" name="email" id="email"> -->
																	<span class="mvalign">※ 주소를 정확히 적어 주세요.</span>
																</li>
															</ul>
														</td>
													</tr>
													
<!-- <script>
 function check() {
   var email1 = document.getElementById('addr1').value;
   var email2 = document.getElementById('addr2').value;
   var email3 = document.getElementById('addr3').value;
   
   var email = email1 + ' ' + email2 + ' ' + email3;
   
   // form 태그에 값을 설정하여 전송
   document.getElementById('email').value = email;
   console.log(email);
  /*  alert("회원가입이 완료되었습니다."); */
  
 }
</script> -->
													<tr>
														<th scope="row"><span>태어난해 *</span></th>
														<td>
															<ul class="pta">
																<li>
																	<select id="birth" name="birth">
																		<option value='' selected="selected">선택하세요</option>
																		<script name="birth">
																			for(var i=1953; i<=2009; i++){
																				document.write("<option value="+ i +">" + i + "년"+ "</option>");	
																			};
																		</script>
																	</select>
																</li>
																<li>&nbsp;<span class="valign">년</span>&nbsp;&nbsp;&nbsp;</li>
															</ul>
														</td>
													</tr>
													<tr>
														<th scope="row"><span>관심지역 *</span></th>
														<td>
															<ul class="pta">
																<li>
																	<select id="dongcate" name="dongcate">
																		<option value='' selected="selected" id="mem_dongcate">선택하세요</option>
																		<c:forEach var="dongcate" items="${dongcate }">
																			<option value='${dongcate }' >${dongcate }</option>
																		</c:forEach>																		
																	</select>
																</li>
																<li class="inter"><span class="mvalign">※ 관심지역으로 운동모임을 추천해드립니다.</span></li>
															</ul>
														</td>
													</tr>
													<tr>
														<th scope="row"><span>관심운동종목 *</span></th>
														<td>
															<ul class="pta">
																<li>
																	<select id="scate" name="scate">
																		<option value='' selected="selected" id="mem_exercise">선택하세요</option>
																		<c:forEach var="scate" items="${scate }">
																			<option value='${scate }' >${scate }</option>
																		</c:forEach>																		
																	</select>
																</li>
																<li class="inter"><span class="mvalign">※ 관심운동으로 운동모임을 추천해드립니다.</span></li>
															</ul>
														</td>
													</tr>
													
												</tbody>
												</table>
											</div>
											
					
										</div>
										
										
										
										<!-- Btn Area -->
										<div class="btnArea" id="btnA">
											<div class="bCenter">
												<ul>
													<li><a style="cursor:pointer;" onclick="joinform_check()" class="button small fit">가입하기</a></li>
													<li><a href="../main" class="button primary small fit">취소하기</a></li>
												</ul>
											</div>
										</div>
										<!-- //Btn Area -->
										</form>
										
										<!-- <script type="text/javascript" src="../js/jquery.fancybox-1.3.4.pack.js"></script>
										<link rel="stylesheet" type="text/css" href="../css/jquery.fancybox-1.3.4.css" />
										<script type="text/javascript">
										$(function(){
										
											// business input
											var firstchk = $("input:radio[name=business]:checked").attr("id");
											$(".businessTy").css("display","none");
											$("#partner").click(function(){
												$(".businessTy").css("display","block");
											});
											$("#general").click(function(){
												$(".businessTy").css("display","none");
											});
											$("#"+firstchk).click();
											
										
											// popup
											var winWidth = $(window).width();
											if(winWidth > 767){
												var layerCheck = 540;
											}else{
												var layerCheck = 320;
											}
										
											/* $(".addressBtn").fancybox({
												'autoDimensions'    : false,
												'showCloseButton'	: false,
												'width' : layerCheck,
												'padding' : 0,
												'type'			: 'iframe',
												'onComplete' : function() {
													$('#fancybox-frame').load(function() { // wait for frame to load and then gets it's height
													$('#fancybox-content').height($(this).contents().find('body').height());
													});
												}
											}); */
										
										
										});
										</script> -->


								</div>
							 

								</section>
								
								<!-- //footer.jsp -->
								<%@ include file="../footer.jsp" %>
								
								
						</div>
					</div>
				
				
				<!-- sidebar.jsp -->
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