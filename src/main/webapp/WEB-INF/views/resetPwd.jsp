<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>


	<h3>��й�ȣ �ʱ�ȭ</h3> 
	<hr>
	���ο� ��й�ȣ�� �Է��ϼ���
	
	
	<form action="" method="POST">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
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
	</form>
	
	
	
</body>
</html>