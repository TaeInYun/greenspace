<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
</head>
<body>
	<H2>챌린지 목록</H2>

	<table border="1" width="80%">
		<tr>
			<td>번호</td>
			<td>제목</td>
			<td>내용</td>
			<td>나무 수</td>		
			<td>관리</td>			
		</tr>
		<c:forEach var="c" items="${list }">
			<tr>
				<td>${c.no }</td>
				<td>${c.chg_title}</td>				 
				<td>${c.chg_content }</td>
				<td>${c.chg_tree }</td>	
				<td><input type="button" onclick="location.href='/admin/updateChg?no=${c.no }'" value="수정">
				<input type="button" onclick="location.href='/admin/deleteChg?no=${c.no }'" value="삭제">
				</td>
			</tr>
		</c:forEach>
	</table> 	
	<div>
	<a href="/admin/insertChg">추가</a>
	</div>
	
</body>
</html>