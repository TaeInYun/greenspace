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
	<h2>리뷰상세</h2>
	<hr>
	제목: ${r.re_title }<br>
	내용: ${r.re_content }<br>
	작성일: ${r.re_date }<br>
	상품번호: ${r.pro_no }<br>
	회원번호: ${r.member_no }<br>
	조회수: ${r.re_hit }<br>
	좋아요수: ${r.re_like }<br>
	주문번호: ${r.order_no }<br>
	평점: ${r.re_rate }<br>	
	<img src="/upload/review/${r.re_thumbnail }" width="100" height="100">
	<hr>
	<a href="/shop/updateReview?no=${r.no}"><button >수정하기</button></a>
	<!--  <a href="deleteReview?no=${r.no }">삭제</a>-->
</body>
</html>