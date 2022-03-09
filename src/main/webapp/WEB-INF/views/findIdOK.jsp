<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="/css/joinLogin.css">
<style type="text/css">
#loginBtn,#backBtn{
	margin-top: 30px;
	margin-bottom: 10px;
}
#backBtn{
	margin: 0 ;
}
#input_group{
	margin-top: 8px;
}
</style>
<head>
<title>아이디 찾기 결과</title>
</head>
<body>
<div id="warp">

	<div id="header-logo">
	<a href="/mainpage/nonmember"><img id="logo" src="/upload/logo.png"></a>
	</div>

	<div id="container">
			<div id="content">
			<h2 style="text-align: center">아이디 찾기 결과</h2>
			<div id="show_box">
				회원님이 가입하신 아이디는<br>
				<strong>${ id }</strong> 입니다.
			</div>
			<a href = "/login"><button id="loginBtn">로그인</button></a>		
			<button type="button" id="backBtn" onclick="history.go(-1);" >이전으로</button>							 
		`</div>
	</div>	
	
</div>
</body>
</html>