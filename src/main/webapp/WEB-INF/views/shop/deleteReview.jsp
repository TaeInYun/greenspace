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
			<h2 class="card-title text-center">리뷰삭제</h2> 
	</div> 
	<div class="card-body">  
		<form action="/shop/deleteReview" method="post" enctype="multipart/form-data">
					<p>정말로 삭제하시겠습니까?<p>	 
					<input type="text"  name="no" value="${no}"><BR> 
					<button style="width: 100%; padding: 10px" type="submit">삭제</button> 
		</form> 
 
	</div> 
</div>


	 
	
</body>
</html>