<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>


	<h3>비밀번호 초기화</h3> 
	<hr>
	새로운 비밀번호를 입력하세요
	
	
	<form action="" method="POST">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
			<p>
				<label>새비밀번호</label>
				<input type="text" id="pwd" name="pwd" required>
			</p>
			<p>	
				<label>새 비밀번호 확인</label>
				<input type="text" id="pwdChek" name="pwdChek" required>
			</p>
				<input type="submit" value="비밀번호 변경">
				<button type="button" onclick="history.go(-1);" >Cancel</button>
	</form>
	
	
	
</body>
</html>