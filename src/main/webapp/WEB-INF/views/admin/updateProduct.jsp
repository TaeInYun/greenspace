<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자설정_${p.pro_name }_상품수정</title>
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
		<h2 class="card-title text-center">상품수정</h2> 
	</div> 
	<div class="card-body"> 
			<form action="/admin/updateProduct" method="post" enctype="multipart/form-data">
				<input type="hidden" name="no" value="${p.no }">
				 
				<div class="inputArea">
					<label for="cat_code">카테고리</label>
						<select name="cat_code"  >
							<option value="BA">욕실</option>
							<option value="KI">주방</option>
							<option value="PFO">식품</option>
							<option value="PCO">화장품</option>
							<option value="PPE">애완용품</option>
							<option value="POF">사무용품</option>
							<option value="PDA">일상용품</option>
						</select><br>
				</div>
						
				
				<div class="inputArea">
					<label for="pro_name">상품명</label>
					<input type="text" id="pro_name" name="pro_name" value="${p.pro_name }"/>
				</div>
					
				<div class="inputArea">
					<label for="pro_brand">상품브랜드</label>
					<input type="text" id="pro_brand" name="pro_brand" value="${p.pro_brand }"/>
				</div>	
				
				<div class="inputArea">
					<label for="pro_price">상품가격</label>
					<input type="text" id="pro_price" name="pro_price" value="${p.pro_price }"/>
				</div>	 
				 
			 
			 	<div class="inputArea">
					<label for="pro_saleprice">상품할인가</label>
					<input type="text" id="pro_saleprice" name="pro_saleprice" value="${p.pro_saleprice }"/>
				</div>	 
				
				<div class="inputArea">
					<label for="pro_stock">상품재고</label>
					<input type="text" id="pro_stock" name="pro_stock" value="${p.pro_stock }"/>
				</div>	 
				 
				 
				 <div class="inputArea">
					<label for="pro_content">상품내용</label><br>
					<textarea rows="10" cols="50" name="pro_content" >${p.pro_content }</textarea>
				</div>	
			  		 
						
				<div class="inputArea">
					 <label for="PRO_THUMBNAIL">이미지</label>
						<input type="hidden" id= "PRO_THUMBNAIL" name="PRO_THUMBNAIL" value="${p.PRO_THUMBNAIL }">
				   		<input type="file" name="uploadFile">${p.PRO_THUMBNAIL }<br>
				</div>
				
			 
				 <button   value="수정"   >상품수정하기</button> 
			</form> 
	</div> 
</div>
	
	
	
	
</body>
</html>