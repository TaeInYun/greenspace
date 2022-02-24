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

<H2>주소목록</H2>

	<table border="1" width="80%">
		<tr>
			<td>주소번호</td>
			<td>주소이름</td>
			<td>우편번호</td>
			<td>주소</td>
			<td>주소상세</td>			
			<td>받는사람</td>			
		</tr>
		<c:forEach var="a" items="${aa }">
			<tr>
				<td>${a.no }</td>
				<td>
					<a href="/mypage/detailAddress?no=${a.no}">${a.addr_title} </a>					
				</td>				 
				<td>${a.addr_postal }</td>
				<td>${a.addr_road }</td>
				<td>${a.addr_detail }</td>			
				<td>${a.addr_receiver }</td>			
			</tr>
		</c:forEach>
	</table> 	

</body>
</html>