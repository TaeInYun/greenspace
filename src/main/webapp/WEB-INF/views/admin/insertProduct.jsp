<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script> 
<script type="text/javascript">
	$(function(){		 
		 $(document).ready(function(){
			 $('.btnAdd').click(function(){				 
				 $('.addInput').append(
						 '<input type="type" name="test" value=""><input type="type" name="test" value="">\
						 	<button type="button" class="btnRemove">삭제</button><br>'
				);				 
				 $('.btnRemove').on('click',function(){
					 $(this).prev().remove();
					 $(this).prev().remove();					 
					 $(this).next().remove();
					 $(this).remove();
				 })
			 })
		 })		 
	})
</script>
</head>
<body> 	 
	<h2>상품 등록</h2>
	<hr>
	<form action="/admin/insertProduct" method="post"  enctype="multipart/form-data">		
		<div class="inputArea">
			<label for="cat_code">카테고리</label>
				<select name="cat_code">
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
			<input type="text" id="pro_name" name="pro_name" />
		</div>
			
		<div class="inputArea">
			<label for="pro_brand">상품브랜드</label>
			<input type="text" id="pro_brand" name="pro_brand" />
		</div>	
		
		<div class="inputArea">
			<label for="pro_price">상품가격</label>
			<input type="text" id="pro_price" name="pro_price" />
		</div>	 
		 
	 
	 	<div class="inputArea">
			<label for="pro_saleprice">상품할인가</label>
			<input type="text" id="pro_saleprice" name="pro_saleprice" />
		</div>	 
		 
		<div class="inputArea">
			<label for="pro_stock">상품재고</label>
			<input type="text" id="pro_stock" name="pro_stock" />
		</div>	 
		 
		<div class="inputArea">
			<label for="pro_delivery">평균출고날짜</label>
			<input type="text" id="pro_delivery" name="pro_delivery" />
		</div>	  
	 
		<div class="inputArea">
			<label for="pro_content">상품내용</label>
			<textarea rows="10" cols="80" name="pro_content"></textarea>
		</div>	
	  		 
				
		<div class="inputArea">
			<label for="PRO_THUMBNAIL">이미지</label>
			<input type="file" id="PRO_THUMBNAIL" name="uploadFile" />
			<div class="select_img"><img src="" /></div>		
		</div>
		
		<div class="inputArea">
			<label for="pro_option">옵션설정</label>
			 <div class="addInput"></div>    
	        <button type="button" class="btnAdd">추가</button>
		</div>
		
		<hr>
		<input type="submit" value="등록">
		<input type="reset" value="취소">
	</form>
</body> 
</html>