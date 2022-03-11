<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
	
	<form action="insertReview" method="post"
			enctype="multipart/form-data">		
		<!--  리뷰번호:
		<input type="hidden" name="no"> <br> -->
		제목: <input type="text" name="re_title"> <br>
		평점: <input type="text" name="re_rate"> <br>
	     <!--  <input type="text" name="re_content"> <br> -->	
		내용:  <textarea rows="10" cols="80" name="re_content"></textarea> <br>
		<!--상품번호:  --> <input type="hidden" name="pro_no" value="${pro_no} "> 
		<!--작성자:  -->	<input type="hidden" name="member_no" value="${m.no}">
		상품사진: <input type="file" name="uploadFile"> <br>
		<input type="submit" value="등록">
		<input type="reset" value="취소">
	</form>
</body>
</html>