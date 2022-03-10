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
 		margin: 10px;
 	}
 	 
</style>
</head>
<body>	
<div class="card align-middle"> 
	<div class="card-title"> 
		<h2 class="card-title text-center"></h2> 
	</div> 
	<div class="card-body">  
			<form action="/board/deleteComments" method="post">
					 <p>정말로 삭제하시겠습니까?<p>	 
					<input type="hidden" name="no" value="${no}">		 
					<input type="hidden" name="member_no" value="${member_no}">	 				
					<button style="width: 90%; padding: 10px"  type="submit">삭제</button> 
			</form> 
	</div> 
</div>




	 
</body>
</html>