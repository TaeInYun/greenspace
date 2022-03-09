<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="/css/joinLogin.css">
<style type="text/css">
.findPwdbtn,#backBtn{
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
<title>비밀번호 찾기</title>
</head>
<body>
<div id="warp">

	<div id="header-logo">
	<a href="/mainpage/nonmember"><img id="logo" src="/upload/logo.png"></a>
	</div>

<div id="container">
	<div id="content">
<h2 style="text-align: center">비밀번호 찾기</h2>

		<!-- 탭메뉴 -->
		<div id="tab-menu">
			<a class="tab-link current" data-tab="findPwdByEmail">이메일주소</a> 
		    <a class="tab-link" data-tab="findPwdByPhone">핸드폰번호</a> 
		</div>
	
	<!-- 이메일 주소로 찾기-->
	<div id="findPwdByEmail" class="tab-content current">
		<form action="/resetPwd" method="POST">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
			<input type="hidden" id="phone" name="phone" value="null" required>
				<div id="input_group">
					<input type="text" class="input" name="id" placeholder="아이디를 입력하세요" required>
				</div>
				
				<div id="input_group">
					<input type="text" class="input" name="email" placeholder="이메일 주소를 입력하세요" required>
				</div>	
				
		<input  class="findPwdbtn" type="submit" value="비밀번호 찾기">
		<button type="button" id="backBtn" onclick="history.go(-1);" >이전으로</button>			
		</form>
	</div>

	
	<!-- 휴대전화로 찾기 -->
	<div id="findPwdByPhone" class="tab-content">
		<form action="/resetPwd" method="POST">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		<input type="hidden" id="email" name="email" value="null" required>
		<div id="input_group">
				<input type="text" id="id" class="input" name="id" placeholder="아이디를 입력하세요" required>
		</div>
			
		<div id="input_group">
				<input type="text" id="phone" class="input" name="phone" placeholder="전화번호를 입력하세요(숫자만)" required>
		</div>
		<input  class="findPwdbtn" type="submit" value="비밀번호 찾기">
		<button type="button" id="backBtn" onclick="history.go(-1);" >이전으로</button>			
		</form>
		</div>
		
		
	</div>
</div>
</div>	
</body>
</html>