<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<h3>아이디 찾기</h3>
		<a href="/findIdByEmail">이메일주소</a>
		<a href="/findIdByPhone">핸드폰번호</a>  
	
		<p>회원가입시 등록하신 이름과 핸드폰번호를 입력하세요</p>
		
		<form action="/findIdOK" method="POST">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
			<input type="hidden" id="email" name="email" value="null" required>
				<p>
					<label>name</label>
					<input type="text" id="name" name="name" required>
				</p>
				<p>	
					<label>cellPhone</label>
					<input type="text" id="phone" name="phone" required>
				</p>
					<input type="submit" value="아이디찾기"> 
					<button type="button" onclick="history.go(-1);" >Cancel</button>
		</form>
</body>
</html>