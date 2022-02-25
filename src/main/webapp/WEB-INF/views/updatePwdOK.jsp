<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
	${id}님 비밀번호 변경이 완료되었습니다. 
	${updatePwdOK}

</body>
</html>