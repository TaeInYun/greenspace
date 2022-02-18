<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>상품 상세</h2>
	<hr>
	상품이름 : ${p.pro_name }<br>
	상품가격 :${p.pro_price}<br>
	상품할인가 :${p.pro_saleprice}<br>
	상품설명 : <br>
	<textarea rows="10" cols="80" readonly="readonly">${p.pro_content }</textarea><br>
	 
	조회수 : ${p.pro_hit }<br>	 
	첨부파일명 : ${p.PRO_THUMBNAIL }<br>
	 <img  src="/upload/${p.PRO_THUMBNAIL }" width="200" height="200">
</body>
</html>