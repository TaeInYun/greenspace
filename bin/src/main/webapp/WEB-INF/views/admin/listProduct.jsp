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
	<H2>상품목록</H2>
	<table border="1" width="80%">
		<tr>
			<td>상품번호</td>
			<td>상품이름</td>
			<td>상품브랜드</td>
			<td>상품가격</td>
			<td>상품할인가</td>
			<td>재고수</td>
			<td>카테고리</td>
		</tr>
		<c:forEach var="p" items="${list }">
			<tr>
				<td>${p.no }</td>
				<td>
					<a href="/admin/detailProduct?no=${p.no}">${p.pro_name} </a>					
				</td>				 
				 
				<td>${p.pro_brand }</td>
				<td>${p.pro_price }</td>
				<td>${p.pro_saleprice }</td>
				<td>${p.pro_stock }</td>
				<td>${p.cat_name }</td>
			</tr>
		</c:forEach>
	</table>
</body>
</html>