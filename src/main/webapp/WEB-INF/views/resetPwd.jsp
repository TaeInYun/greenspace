<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<h3>비밀번호 초기화</h3> 
	새로운 비밀번호를 입력하세요
	
	<form  action="resetPwd" method="POST">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		${checkPwd}
		
		<c:set target="${checkPwd}" property="c">
			${checkPwd.c}
		
		</c:set>
		
	
			
	</form>
	
   
	
	

	
</body>
</html>