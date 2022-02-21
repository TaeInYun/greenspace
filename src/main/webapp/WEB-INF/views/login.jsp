<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	<h2>로그인</h2>
		<form action="login" method="post">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
				아이디 : <input type="text" name="username"><br>
				암호 : <input type="password" name="password"><br>
			<input type="submit" value="로그인">

    	<div>
    	

	    	<a href="/findIdByEmail">아이디 찾기</a> 
	     	<a href="/findPwdByEmail">비밀번호 찾기</a> 
	     	
	     	<p>계정이 없으신가요?</p>
	     	
	       <a href="/join">회원가입</a>
       </div>
	</form>
</body>
</html>