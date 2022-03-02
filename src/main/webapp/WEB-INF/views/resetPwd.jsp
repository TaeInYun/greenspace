<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>

	<h3>비밀번호 초기화</h3> 
	새로운 비밀번호를 입력하세요
	
	<form  action="updatePwdOK" method="POST">
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		<c:choose>
			<c:when test="${ checkPwd eq '1'}">
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
			</c:when>
			<c:otherwise>
				<script>
					alert('가입된 아이디가 없습니다.');
					history.go(-1);
				</script>
			</c:otherwise>
		</c:choose>
	</form>

</body>
</html>