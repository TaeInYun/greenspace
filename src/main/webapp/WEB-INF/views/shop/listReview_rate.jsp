<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<H2>상품리뷰</H2>

	<table border="1" width="80%">
		<tr>
			<td>리뷰번호</td>
			<td>리뷰제목</td>
			<td>리뷰내용</td>
			<td>회원번호</td>			
		</tr>
		<c:forEach var="r" items="${list }">
			<tr>
				<td>${r.no }</td>
				<td>
					<a href="/shop/detailReview?no=${r.no}">${r.re_title} </a>					
				</td>				 
				<td>${r.re_content }</td>
				<td>${r.member_no }</td>			
			</tr>
		</c:forEach>
	</table> 	
	<hr>
	
</body>
</html>