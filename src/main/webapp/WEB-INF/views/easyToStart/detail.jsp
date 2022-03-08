<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	
	<link href="/css/easytostart.css" rel="stylesheet"/> 
	<link rel="stylesheet" href="/css/style.css">
	<link rel="stylesheet" href="/js/jquery-ui/jquery-ui.css">
	
</head>
<body>

	<header id="header">
		<div id="header_box">
			<div id="header1_box">
				<jsp:include page="../header.jsp"/>
			</div>
		</div>
	</header>
		
	<h2>게시물 상세</h2>
	<hr>
	글번호 : ${n.no }<br>
	글제목 : ${n.ets_title}<br>
	글내용 : <br>
	
	<textarea rows="10" cols="80" readonly="readonly">${n.ets_content}</textarea><br>
		조회수 : ${n.ets_hit }<br>
	<a href="updateBoard?no=${n.no }">수정</a>
	<a href="deleteBoard?no=${n.no }">삭제</a>
</body>
</html>