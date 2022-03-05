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
	${id}님! 새로운 비밀번호를 입력하세요

	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">

	<c:choose>
		<c:when test="${ checkPwd eq '1'}">
			<form  action="updatePwdOK" method="POST">
				<p>
					<label>새비밀번호</label>
					<input type="password" id="pwd" name="pwd" required>
				</p>
				<p>
					<label>새 비밀번호 확인</label>
					<input type="password" id="pwdChek" name="pwdChek" required>
				</p>
				<input type="submit" value="비밀번호 변경">
				<button type="button" onclick="history.go(-1);" >Cancel</button>
			</form>
		</c:when>
		<c:otherwise>
			<script>
				alert('일치하는 정보가 없습니다. 다시 시도하거나 회원가입을 해주세요');
				history.go(-1);
			</script>
		</c:otherwise>
	</c:choose>

	


</body>
</html>
