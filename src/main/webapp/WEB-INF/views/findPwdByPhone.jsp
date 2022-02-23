<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>비밀번호 찾기</h3>
	<a href="/findPwdByEmail">이메일주소</a>
	<a href="/findPwdByPhone">핸드폰번호</a>  

	<p>회원가입시 등록하신 아이디와 핸드폰번호를  입력하세요</p>
	
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
				<input type="submit" value="비밀번호 찾기">
				<button type="button" onclick="history.go(-1);" >Cancel</button>
	</form>
</body>
</html>