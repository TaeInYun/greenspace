<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="/css/board.css" rel="stylesheet"/> 
</head>
<body>

<jsp:include page="../header.jsp"/>

<H2>주소목록</H2>

	<table border="1" width="80%">
		<tr>
			<td>주소번호</td>
			<td>주소이름</td>
			<td>우편번호</td>
			<td>주소</td>
			<td>주소상세</td>			
			<td>받는사람</td>	
			<td>상세보기</td>		
		</tr>
		<c:forEach var="a" items="${aa }">
			<tr>
				<td>
			     ${a.no }
				</td>
				<td>
					${a.addr_title} 					
				</td>				 
				<td>${a.addr_postal }</td>
				<td>${a.addr_road }</td>
				<td>${a.addr_detail }</td>			
				<td>${a.addr_receiver }</td>	
				<td><a href="/mypage/detailAddress?no=${a.no}"><button>상세보기</button></a></td>		
			</tr>
		</c:forEach>
	</table> 	

</body>
</html>