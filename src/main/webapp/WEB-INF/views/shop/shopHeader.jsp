<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

</script>
</head>
<body>
<div>
	<a href="/shop/listProduct_home?filter=pro_hit">베스트</a> 
	<a href="/shop/listProduct_home?filterASC=pro_saleprice">특가</a>	
	<a href="/shop/listProduct_home?filter=pro_date">신상품</a>
	<form action="/shop/listProduct_home" method="post">
		<input type="text" name="keyword" id="keyword" >
		<input type="submit" value="검색" id="submit">
	</form>
	<a href="/shop/cart">찜하기</a> 
	<a href="/shop/cart">카트</a> 
</div>	 
	
	 
</body>
</html>