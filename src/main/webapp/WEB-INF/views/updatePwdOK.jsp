<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="/css/joinLogin.css">

<head>
<meta charset="EUC-KR">
<title>비밀번호 변경 완료</title>
</head>
<body>
<div id="warp">

	<div id="header-logo">
	<a href="/mainpage/nonmember"><img id="logo" src="/upload/logo.png"></a>
	</div>

<div id="container">
	<div id="content">
	<h2 style="text-align: center">비밀번호 변경 완료</h2>
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		
		<c:choose>		
				<c:when test="${ updatePwdOK eq'1'}">
				<div id="show_box">
					${id}님 비밀번호 변경이<br>
					완료되었습니다.
					</div>	
					<a href = "/login"><button id="loginBtn">로그인</button></a>	
				</c:when>
				<c:otherwise>
					<script>
						alert('비밀번호 변경에 실패하였습니다. 다시 시도하여 주세요.');
						history.go(-1);
					</script>
				</c:otherwise>
		</c:choose>
	</div>
</div>
</div>	

</body>
</html>
