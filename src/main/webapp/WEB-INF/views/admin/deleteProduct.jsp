<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/style.css">
<style type="text/css">
	form{
		margin: 10px;
	}
	
	.btn btn-lg btn-primary btn-block{
		border-radius: 20px;		 
		width: 200px;
		background-color: #DCEDC8;
		border: 0.5px solid green;
		margin: 5px;
		padding: 5px 
	}
	p{
		text-align: center;
	}
</style>
</head>
<body>

<div class="card align-middle"> 
	<div class="card-title"> 
		<h2 class="card-title text-center"></h2> 
	</div> 
	<div class="card-body"> 
			<form method="post" action="/admin/deleteProduct">			
					<p>정말로 삭제하시겠습니까?<p>	 
					<input type="hidden"  name="no" value="${no }"><BR> 
					<button style="width: 100%; padding: 10px" type="submit">삭제</button> 
			</form> 
	</div> 
</div>
 



  
	
  
 

 
 
</body>
</html>