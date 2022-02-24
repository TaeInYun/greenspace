<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>리뷰수정</h2>
	<form action="updateReview" method="post" enctype="multipart/form-data">
		리뷰번호: ${r.no }<br>
		<input type="hidden" name="no" value="${r.no }">
		제목: <input type="text" name="name" value="${r.re_title }"><br>
		평점: <input type="text" name="price" value="${r.re_rate }"><br>
		내용: <input type="text" name="qty" value="${r.re_content }"><br>
		상품번호:<input type="hidden" name="no" value="${r.pro_no }">		
		<input type="hidden" name="thumbnail" value="${r.re_thumbnail }">
		<img src="/upload/review/${r.re_thumbnail }" width="30" height="30">
		상품사진: <input type="file" name="uploadFile"><br>
		<input type="submit" value="수정">
		<input type="reset" value="취소">
	</form>
</body>
</html>