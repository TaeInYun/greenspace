<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/style.css">
<style type="text/css">
 	.card-body{
	width: 100%;
	position: relative;
	margin: 20px 0;
}
 	
 	p{
 		text-align: center;
 	}
 	
 	textarea{
 	width:800px;
	height:100px;
	padding: 10px;
	box-sizing: border-box;
	display: inline-block;
	position: relative;	
 	}
 	
 	
 	button{
	height:100px;
	width:160px;
	position: absolute;
	right:10px;
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
				<button type="submit">수정하기</button> 
			</form>
	</div> 
</div>



	
</body>
</html>