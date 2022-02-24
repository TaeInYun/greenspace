<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>메인배송지</h2>
	<table border="1" width="80%">
		<tr>
			<td>배송지이름</td>
			<td>우편번호</td>
			<td>받는사람이름</td>
			<td>배송지</td>
			<td>배송지상세</td>
			<td>배송지휴대폰번호</td>
			
		</tr>
		<c:forEach var="a" items="${a }">
			<tr>
				<td>${a.addr_title }</td>
				<td>
					<a href="/admin/updateAddress?no=${a.no}">${a.addr_postal} </a>					
				</td>				 
				<td>${a.addr_recevier }</td>
				<td>${a.addr_road }</td>
				<td>${a.addr_detail }</td>
				<td>${a.addr_phone }</td>
								
			</tr>
			
		</c:forEach>
	</table> 
		<hr>
	<h2>서브배송지</h2>
	<table border="1" width="80%">
		<tr>
			<td>배송지이름</td>
			<td>우편번호</td>
			<td>받는사람이름</td>
			<td>배송지</td>
			<td>배송지상세</td>
			<td>배송지휴대폰번호</td>
			
		</tr>
		<c:forEach var="a2" items="${a2 }">
		
		
			<tr>
				<td>${a2.addr_title }</td>
				<td>
					<a href="/admin/updateAddress?no=${a2.no}">${a2.addr_postal} </a>					
				</td>				 
				<td>${a2.addr_recevier }</td>
				<td>${a2.addr_road }</td>
				<td>${a2.addr_detail }</td>
				<td>${a2.addr_phone }</td>
								
			</tr>
			
		</c:forEach>
	</table> 
</body>
</html>