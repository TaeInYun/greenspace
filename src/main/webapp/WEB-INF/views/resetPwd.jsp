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
	
	<form  action="updatePwdOK" method="POST">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		<c:choose>
			<c:when test="${ checkPwd eq '1'}">
			 <p>
           		<label>����й�ȣ</label>
            	<input type="text" id="pwd" name="pwd" required>
         	</p>
         	<p>   
            	<label>�� ��й�ȣ Ȯ��</label>
            	<input type="text" id="pwdChek" name="pwdChek" required>
         	</p>
            	<input type="submit" value="��й�ȣ ����">
            	<button type="button" onclick="history.go(-1);" >Cancel</button>
			</c:when>
			<c:otherwise>
				<script>
					alert('���Ե� ���̵� �����ϴ�.');
					history.go(-1);
				</script>
			</c:otherwise>
		</c:choose>
	</form>

</body>
</html>