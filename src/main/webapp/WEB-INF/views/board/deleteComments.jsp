<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>	
	<form action="/board/deleteComments" method="post">
		 ���� �����ϳ���?
		<input type="hidden" name="no" value="${no}">
		<input type="hidden" name="commu_no" value="${commu_no}">
		<input type="submit" value="Ȯ��">
	</form>
</body>
</html>