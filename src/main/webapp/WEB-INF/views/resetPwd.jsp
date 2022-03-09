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
<title>��й�ȣ �ʱ�ȭ</title>
</head>
<body>
<div id="warp">

	<div id="header-logo">
	<a href="/mainpage/nonmember"><img id="logo" src="/upload/logo.png"></a>
	</div>
	
<div id="container">
	<div id="content">	
	<h2 style="text-align: center">��й�ȣ �ʱ�ȭ</h2>
	<div id="show_text" style="">
	<strong>${id}</strong>&nbsp;��!&nbsp;<br>
	���ο� ��й�ȣ�� �Է��ϼ���.
	</div>
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">

	<c:choose>
		<c:when test="${ checkPwd eq '1'}">
			<form  action="updatePwdOK" method="POST">
				
					<div id="input_group">
					<input type="password" class="input" id="pwd" name="pwd" placeholder="�� ��й�ȣ" required>
				</div>
				<div id="input_group">
					
					<input type="password" class="input" id="pwdChek" name="pwdChek" placeholder="�� ��й�ȣ Ȯ��" required>
				</div>
				<input class="findPwdbtn" type="submit" value="��й�ȣ ����">
				<button type="button" id="backBtn" onclick="history.go(-1);" >��������</button>
			</form>
		</c:when>
		<c:otherwise>
			<script>
				alert('��ġ�ϴ� ������ �����ϴ�. �ٽ� �õ��ϰų� ȸ�������� ���ּ���');
				history.go(-1);
			</script>
		</c:otherwise>
		</c:choose>
		</div>
	</div>
</div>
	


</body>
</html>
