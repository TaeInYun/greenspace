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
		<!--  리뷰번호:
		<input type="hidden" name="no"> <br> -->
		제목: <input type="text" name="re_title"> <br>
		평점: <input type="text" name="re_rate"> <br>
		내용: <input type="text" name="re_content"> <br>			
		상품번호: <br> 
		<input type="text" name="no" value="<%=request.getQueryString().substring(7)%>"> <br> 
		작성자:	<input type="text" name="member_no" value="${m.no}"> <br>
		상품사진: <input type="file" name="uploadFile"> <br>
		<input type="submit" value="등록">
		<input type="reset" value="취소">
	</form>
</body>
</html>