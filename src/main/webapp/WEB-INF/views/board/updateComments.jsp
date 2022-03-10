<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/style.css">
<style type="text/css">
 	p{
 		text-align: center;
 	}
 	textarea{
 		margin-left: 20px;
 		margin-right: 20px;
 		margin-top: 20px;
 	}
 	button{
 		 margin-left: 20px;
 		 margin-right: 20px;
 		 margin-bottom: 10px;
 	}
</style>
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
				<textarea name="com_content" rows="3" cols="50">${comments.com_content}</textarea>	
				<button style="width: 90%; padding: 10px" type="submit">수정하기</button> 
			</form>
	</div> 
</div>



	
</body>
</html>