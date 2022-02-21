<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>리뷰작성</h2>
	<form action="insertReview" method="post"
			enctype="multipart/form-data">		
		리뷰번호: ${r.no }<br>
		<input type="hidden" name="no" value="${r.no }">	
		제목: <input type="text" name="re_title"> <br>
		내용: <input type="text" name="re_content"> <br>		
		평점: <input type="text" name="re_rate"> <br>
		상품번호: ${r.pro_no }<br>
		<input type="hidden" name="no" value="${r.pro_no }">		
		상품사진: <input type="file" name="uploadFile"> <br>
		<input type="submit" value="등록">
		<input type="reset" value="취소">
	</form>
</body>
</html>