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
	${id}�� ��й�ȣ ������ �Ϸ�Ǿ����ϴ�. 
	${updatePwdOK}

</body>
</html>