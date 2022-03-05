<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<H2>커뮤니티</H2>

	<table border="1" width="80%">
		<tr>
			<td>제목</td>
			<td>닉네임</td>
			<td>등록일</td>
			<td>조회수</td>	
		</tr>
		<c:forEach var="c" items="${list }">
			<tr>
				<td><a href="/board/detailCommunity?no=${c.no }">${c.commu_title}</a></td>				 
				<td>${c.nickname }</td>
				<td><fmt:formatDate value="${c.commu_date }" pattern="yy.MM.dd HH:ss"/></td>
				<td>${c.commu_hit }</td>				
			</tr>
		</c:forEach>
	</table> 	

</body>
</html>