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
	<h2>상품 등록</h2>
	<hr>
	<form action="/admin/insertProduct" method="post"  enctype="multipart/form-data">		 
		카테고리 : <select name="cat_code">
					<option value="BA">욕실</option>
					<option value="KI">주방</option>
					<option value="PFO">식품</option>
					<option value="PCO">화장품</option>
					<option value="PPE">애완용품</option>
					<option value="POF">사무용품</option>
					<option value="PDA">일상용품</option>
				</select><br>
		상품이름 : <input type="text" name="pro_name"><br>
		상품브랜드 : <input type="text" name="pro_brand"><br>
		상품가격 : <input type="text" name="pro_price"><br>
		상품할인가 : <input type="text" name="pro_saleprice"><br>
		상품재고 : <input type="text" name="pro_stock"><br>
		상품평균출고날짜 : <input type="text" name="pro_delivery"><br>
		상품내용 : <br><textarea rows="10" cols="80" name="pro_content"></textarea><br>		
		사진 : <input type="file" name="uploadFile"><br>
		 
		<hr>
		<input type="submit" value="등록">
		<input type="reset" value="취소">
	</form>
</body>
</html>