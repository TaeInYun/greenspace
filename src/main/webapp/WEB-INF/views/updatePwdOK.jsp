<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<link rel="stylesheet" href="/css/joinLogin.css">

<head>
<meta charset="EUC-KR">
<title>��й�ȣ ���� �Ϸ�</title>
</head>
<body>
<div id="warp">

	<div id="header-logo">
	<a href="/mainpage/nonmember"><img id="logo" src="/upload/logo.png"></a>
	</div>

<div id="container">
	<div id="content">
	<h2 style="text-align: center">��й�ȣ ���� �Ϸ�</h2>
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		
		<c:choose>		
				<c:when test="${ updatePwdOK eq'1'}">
				<div id="show_box">
					${id}�� ��й�ȣ ������<br>
					�Ϸ�Ǿ����ϴ�.
					</div>	
					<a href = "/login"><button id="loginBtn">�α���</button></a>	
				</c:when>
				<c:otherwise>
					<script>
						alert('��й�ȣ ���濡 �����Ͽ����ϴ�. �ٽ� �õ��Ͽ� �ּ���.');
						history.go(-1);
					</script>
				</c:otherwise>
		</c:choose>
	</div>
</div>
</div>	

</body>
</html>
