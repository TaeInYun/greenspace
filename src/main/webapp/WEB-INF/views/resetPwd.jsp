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

	<h3>��й�ȣ �ʱ�ȭ</h3> 
	���ο� ��й�ȣ�� �Է��ϼ���
	
	<form  action="resetPwd" method="POST">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		${checkPwd}
		
		<c:set target="${checkPwd}" property="c">
			${checkPwd.c}
		
		</c:set>
		
	
			
	</form>
	
   
	
	

	
</body>
</html>