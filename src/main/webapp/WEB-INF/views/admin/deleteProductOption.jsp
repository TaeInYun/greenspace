<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>옵션 삭제</h2>
	<hr>
	<form action="/admin/deleteProductOption" method="post">
		<input type="hidden" name="no" value="${no}">		 				
		<input type="submit" value="삭제">
	</form>
</body>
</html>