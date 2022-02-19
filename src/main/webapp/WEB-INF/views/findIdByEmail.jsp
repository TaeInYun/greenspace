<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>아이디 찾기</title>

</head>
<body>
	<h3>아이디 찾기</h3>

		<p>
			<label>Email</label>
				<input type="text" id="email" name="email" required>
		</p>
		<p class="w3-center">
			<input type="submit" value="이메일 찾기">
			<button type="button" onclick="history.go(-1);" class="w3-button w3-block w3-black w3-ripple w3-margin-top w3-margin-bottom w3-round">Cancel</button>
		</p>

</body>
</html>