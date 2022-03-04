<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>



</head>
<body>
		<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
		<c:choose>

				<c:when test="${ updatePwdOK eq'1'}">
					${id}님 비밀번호 변경이 완료되었습니다.
				</c:when>
				<c:otherwise>
					<script>
						alert('비밀번호 변경에 실패하였습니다. 다시 시도하여 주세요.');
						history.go(-1);
					</script>
				</c:otherwise>
		</c:choose>


</body>
</html>
