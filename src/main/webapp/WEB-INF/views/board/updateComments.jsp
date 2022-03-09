<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>	

<div class="card align-middle"> 
	<div class="card-title"> 
			<h2 class="card-title text-center"></h2> 
	</div> 
	<div class="card-body">  
			<form action="/board/updateComments" method="post">		  
				<input type="hidden" name="no" value="${no}">		 
				<input type="hidden" name="member_no" value="${member_no}">
				<textarea name="com_content" rows="3">${comments.com_content}</textarea>	
				<button class="btn btn-lg btn-primary btn-block" type="submit">수정하기</button> 
			</form>
	</div> 
</div>



	
</body>
</html>