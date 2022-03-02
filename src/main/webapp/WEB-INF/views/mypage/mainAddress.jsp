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
	<h1>메인배송지</h1>
	<hr>
		
			배송지이름:${a.addr_title }<br>
			우편번호:${a.addr_postal}<br>
			받는사람이름:${a.addr_receiver }<br>
			배송지:${a.addr_road }<br>
			배송지상세:${a.addr_detail }<br>
			배송지휴대폰번호:${a.addr_phone }<br>		
		
		<a href="/mypage/updateAddress?no=${a.no}"> 수정하기 </a>
			

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
		<c:forEach var="a2" items="${list }">	<!-- taglib -->	
		
			<tr>
				<td>
				<a href="/mypage/updateAddress?no=${a2.no}">${a2.addr_title }</a>
				</td>
				<td>
					${a2.addr_postal} 					
				</td>				 
				<td>${a2.addr_receiver }</td>
				<td>${a2.addr_road }</td>
				<td>${a2.addr_detail }</td>
				<td>${a2.addr_phone }</td>
								
			</tr>		
				
				<a href="/mypage/insertAddressSub"><button >배송지추가</button></a>
		</c:forEach>
	</table> 
</body>
</html>