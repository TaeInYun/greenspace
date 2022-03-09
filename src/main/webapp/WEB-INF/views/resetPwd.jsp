<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
<title>비밀번호 초기화</title>
</head>
<body>
<div id="warp">

	<div id="header-logo">
	<a href="/mainpage/nonmember"><img id="logo" src="/upload/logo.png"></a>
	</div>
	
<div id="container">
	<div id="content">	
	<h2 style="text-align: center">비밀번호 초기화</h2>
	<div id="show_text" style="">
	<strong>${id}</strong>&nbsp;님!&nbsp;<br>
	새로운 비밀번호를 입력하세요.
	</div>
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">

	<c:choose>
		<c:when test="${ checkPwd eq '1'}">
			<form  action="updatePwdOK" method="POST">
				
					<div id="input_group">
					<input type="password" class="input" id="pwd" name="pwd" placeholder="새 비밀번호" required>
				</div>
				<div id="input_group">
					
					<input type="password" class="input" id="pwdChek" name="pwdChek" placeholder="새 비밀번호 확인" required>
				</div>
				<input class="findPwdbtn" type="submit" value="비밀번호 변경">
				<button type="button" id="backBtn" onclick="history.go(-1);" >이전으로</button>
			</form>
		</c:when>
		<c:otherwise>
			<script>
				alert('일치하는 정보가 없습니다. 다시 시도하거나 회원가입을 해주세요');
				history.go(-1);
			</script>
		</c:otherwise>
		</c:choose>
		</div>
	</div>
</div>
	


</body>
</html>
