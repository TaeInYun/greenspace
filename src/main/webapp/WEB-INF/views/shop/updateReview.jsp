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
	<form action="/shop/updateReview" method="post" enctype="multipart/form-data">
		리뷰번호:<br>
		<input type="text" name="no" value="${r.no }">
		제목: <input type="text" name="re_title" value="${r.re_title }"><br>
		평점: <input type="text" name="re_rate" value="${r.re_rate }"><br>
		내용: <input type="text" name="re_content" value="${r.re_content }"><br>		
		<input type="hidden" name="uploadFile" value="${r.re_thumbnail }">
		<img src="/upload/review/${r.re_thumbnail }" width="30" height="30"> 		   
		상품사진: <input type="file" name="uploadFile"><br> 
		상품번호:<input type="text" name="pro_no" value="${r.pro_no }">	<br>
		회원번호:<input type="text" name="member_no" value="${m.no }">	<br>
		<input type="submit" value="수정">
		<input type="reset" value="취소">
	</form>
</body>
</html>