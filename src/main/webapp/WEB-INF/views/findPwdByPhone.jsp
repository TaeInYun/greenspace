<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>��й�ȣ ã��</h3>
	<a href="/findPwdByEmail">�̸����ּ�</a>
	<a href="/findPwdByPhone">�ڵ�����ȣ</a>  

	<p>ȸ�����Խ� ����Ͻ� ���̵�� �ڵ�����ȣ��  �Է��ϼ���</p>
	
	<form action="/resetPwd" method="POST">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		
			<p>
				<label>id</label>
				<input type="text" id="id" name="id" required>
			</p>
			<p>	
				<label>phone</label>
				<input type="text" id="phone" name="phone" required>
			</p>
				<input type="submit" value="��й�ȣ ã��">
				<button type="button" onclick="history.go(-1);" >Cancel</button>
	</form>
</body>
</html>