<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/style.css">
<style type="text/css">
	.inputArea{
		margin: 10px;
	}
	input{
		margin: 5px;
	}
	button{
		border-radius: 20px;		 
		width: 300px;
		background-color: #DCEDC8;
		border: 0.5px solid green;
		margin: 10px;
		padding: 5px  
	}
	button:hover {
  		color: #2ecc71;
	}
</style>
</head>
<body>
<div class="card align-middle"> 
	<div class="card-title"> 
			<h2 class="card-title text-center">리뷰수정</h2> 
	</div> 
	<div class="card-body">  
		<form action="/shop/updateReview" method="post" enctype="multipart/form-data">
				<input type="hidden" name="no" value="${r.no }">
				<div class="inputArea">
					<label for="re_title">제목</label>
					<input type="text" id="re_title" name="re_title" value="${r.re_title} "/>
				</div>
				<div class="inputArea">
					<label for="re_title">평점</label>
					<input type="text" id="re_rate" name="re_rate" value="${r.re_rate} "/>
				</div>
				<div class="inputArea">
					<label for="re_content">내용</label>
					<input type="text" id="re_content" name="re_content" value="${r.re_content} "/>
				</div>
				
				<div class="inputArea">
					 <label for="uploadFile">이미지</label>
						<input type="hidden" id= "uploadFile" name="uploadFile" value="${r.re_thumbnail}">
				   		<input type="file" name="uploadFile">${r.re_thumbnail }<br>
				   		<img src="/upload/review/${r.re_thumbnail }" width="30" height="30"> 		   
				</div>
				
				
	 			<input type="hidden" name="pro_no" value="${r.pro_no }">
	 			<input type="hidden" name="member_no" value="${m.no}">
	 
		 		 <button   value="수정" >수정하기</button> 
	  
	</form>
	</div> 
</div>


	 
	
</body>
</html>