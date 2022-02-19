<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>아이디 찾기</title>

</head>
<body>
	<h3>아이디 찾기</h3>
	<form action="/findId" method="POST">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
			<p>
				<label>Email</label>
					<input type="text" id="email" name="email" required>
			</p>
				<input type="submit" value="이메일 찾기">
					<button type="button" onclick="history.go(-1);" >Cancel</button>
	</form>
	

</body>
</html>