<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
		 
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
</head>
<body>
	<h2>게시물 상세</h2>
	<hr>
	글번호 : ${n.no }<br>
	글제목 : ${n.notice_title }<br>
	글내용 : <br>
	<textarea rows="10" cols="80" readonly="readonly">${n.notice_content }</textarea><br>
	조회수 : ${n.notice_hit }<br>
	<a href="updateBoard?no=${n.no }">수정</a>
	<a href="deleteBoard?no=${n.no }">삭제</a>
</body>
</html>