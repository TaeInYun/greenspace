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
	${id}��! ���ο� ��й�ȣ�� �Է��ϼ���

	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">

	<c:choose>
		<c:when test="${ checkPwd eq '1'}">
			<form  action="updatePwdOK" method="POST">
				<p>
					<label>����й�ȣ</label>
					<input type="password" id="pwd" name="pwd" required>
				</p>
				<p>
					<label>�� ��й�ȣ Ȯ��</label>
					<input type="password" id="pwdChek" name="pwdChek" required>
				</p>
				<input type="submit" value="��й�ȣ ����">
				<button type="button" onclick="history.go(-1);" >Cancel</button>
			</form>
		</c:when>
		<c:otherwise>
			<script>
				alert('��ġ�ϴ� ������ �����ϴ�. �ٽ� �õ��ϰų� ȸ�������� ���ּ���');
				history.go(-1);
			</script>
		</c:otherwise>
	</c:choose>

	


</body>
</html>
