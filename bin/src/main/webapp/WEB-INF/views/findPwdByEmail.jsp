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

	<p>ȸ�����Խ� ����Ͻ� ���̵�� �̸����ּҸ� �Է��ϼ���</p>
	
	<form action="/resetPwd" method="POST">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		<input type="hidden" id="phone" name="phone" value="null" required>
			<p>
				<label>id</label>
				<input type="text" id="id" name="id" required>
			</p>
			
			<p>	
				<label>Email</label>
				<input type="text" id="email" name="email" required>
			</p>
			
			<input type="submit" value="��й�ȣ ã��">
			<button type="button" onclick="history.go(-1);" >Cancel</button>
	</form>
</body>
</html>