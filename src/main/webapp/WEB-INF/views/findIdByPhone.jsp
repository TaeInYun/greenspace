<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>���̵� ã��</h3>
		<a href="/findIdByEmail">�̸����ּ�</a>
		<a href="/findIdByPhone">�ڵ�����ȣ</a>  
	
		<p>ȸ�����Խ� ����Ͻ� �̸��� �ڵ�����ȣ�� �Է��ϼ���</p>
		
		<form action="/findIdOK" method="POST">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
			<input type="hidden" id="email" name="email" value=null required>
				<p>
					<label>name</label>
					<input type="text" id="name" name="name" required>
				</p>
				<p>	
					<label>cellPhone</label>
					<input type="text" id="phone" name="phone" required>
				</p>
					<input type="submit" value="���̵�ã��">
					<button type="button" onclick="history.go(-1);" >Cancel</button>
		</form>





�ڵ������� ã��
<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
</body>
</html>