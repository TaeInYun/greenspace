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
					${id}�� ��й�ȣ ������ �Ϸ�Ǿ����ϴ�.
				</c:when>
				<c:otherwise>
					<script>
						alert('��й�ȣ ���濡 �����Ͽ����ϴ�. �ٽ� �õ��Ͽ� �ּ���.');
						history.go(-1);
					</script>
				</c:otherwise>
		</c:choose>


</body>
</html>
