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
		<h2 class="card-title text-center">옵션삭제</h2> 
	</div> 
	<div class="card-body"> 
	 
 
			<form action="/admin/deleteProductOption" method="post">
					<p>정말로 삭제하시겠습니까?<p>	 
					<input type="hidden" name="no" value="${po.no}">		 				
					<button class="btn btn-lg btn-primary btn-block" type="submit">삭제</button> 
			</form> 
	</div> 
</div>
</body>
</html>