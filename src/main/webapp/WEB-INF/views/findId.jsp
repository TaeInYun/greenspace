<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="/css/joinLogin.css">
<style type="text/css">
.findIdbtn,#backBtn{
	margin-top: 20px;
	margin-bottom: 10px;
}
#backBtn{
	margin: 0 0 20px 0;
}
#input_group{
	margin-top: 8px;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
   
	$('.tab-link').click(function () {
        var tab_id = $(this).attr('data-tab');
 
        $('.tab-link').removeClass('current');
        $('.tab-content').removeClass('current');
 
        $(this).addClass('current');
        $("#" + tab_id).addClass('current');
	})
	
});
</script>
<head>
<meta charset="EUC-KR">
<title>아이디 찾기</title>
</head>
<body>
<div id="warp">

	<div id="header-logo">
	<a href="/mainpage/nonmember"><img id="logo" src="/upload/logo.png"></a>
	</div>


<div id="container">
	<div id="content">
	<h2 style="text-align: center">아이디 찾기</h2>
	
	<!-- 탭메뉴 -->
		<div id="tab-menu">
			<a class="tab-link current" data-tab="findIdByEmail">이메일주소</a> 
		    <a class="tab-link" data-tab="findIdByPhone">핸드폰번호</a> 
		</div>
	
	<!-- 이메일 주소로 찾기-->
	<div id="findIdByEmail" class="tab-content current">
	<form action="/findIdOK" method="POST">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		<input type="hidden" id="phone" name="phone" value=null required>
			
			<div id="input_group">
				<input type="text" class="input" id="name" name="name" placeholder="이름을 입력하세요" required>
			</div>
				
			<div id="input_group">
				<input type="text" class="input" id="email" name="email" placeholder="이메일을 입력하세요" required>
			</div>
				<input  class="findIdbtn" type="submit" value="아이디찾기">
				<button type="button" id="backBtn" onclick="history.go(-1);" >이전으로</button>			
	</form>
	</div>
	
	
	<!-- 전화번호로찾기 -->
	<div id="findIdByPhone" class="tab-content">
			<form action="/findIdOK" method="POST">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
			<input type="hidden" id="email" name="email" value="null" required>
				<div id="input_group">
					<input type="text" class="input" id="name" name="name"  placeholder="이름을 입력하세요" required>
				</div>
				<div id="input_group">
					<input type="text" id="phone" class="input" name="phone"  placeholder="전화번호를 입력하세요(숫자만)" required>
				</div>
					<input  class="findIdbtn" type="submit" value="아이디찾기">
				<button type="button" id="backBtn" onclick="history.go(-1);" >이전으로</button>			
		</form>
	</div>
	
	</div>
	</div>
</div>
	
</body>
</html>