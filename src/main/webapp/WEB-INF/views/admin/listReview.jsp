<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/admin.css" rel="stylesheet"/>
<link rel="stylesheet" href="/css/style.css"> 
</head>
<body>
<div id="root">
	<header id="header">
			<div id="header_box">
				<jsp:include page="../header.jsp"/>
			</div>
		</header>
		<section id="container">
		<div id="container_box">
		
		<section id="content">
	

	<table border="1" width="80%">
		<tr>
			<td>리뷰번호</td>
			<td>리뷰제목</td>
			<td>리뷰내용</td>
			<td>회원번호</td>			
		</tr>
		<c:forEach var="r" items="${r2 }">
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
	</section>
	<aside id="aside">
						<jsp:include page="../admin/adminAside.jsp"/>				 		 
	</aside>
	</div>
	</section>	
	</div>
</body>
</html>