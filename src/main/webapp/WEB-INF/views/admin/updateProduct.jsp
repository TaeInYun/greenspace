<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<h2>상품 수정</h2>
	<hr>
	<form action="/admin/updateProduct" method="post" enctype="multipart/form-data">
		<input type="hidden" name="no" value="${p.no }">
		
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
			<label for="pro_content">상품내용</label>
			<textarea rows="10" cols="80" name="pro_content" >${p.pro_content }</textarea>
		</div>	
	  		 
				
		<div class="inputArea">
			<label for="PRO_THUMBNAIL">이미지</label>
			<input type="hidden" name="fname" value="${p.PRO_THUMBNAIL}">
		 		 <input type="file" name="uploadFile"><br>
		 		<script>
				$("#PRO_THUMBNAIL").change(function(){
					if(this.files && this.files[0]) {
						var reader = new FileReader;
						reader.onload = function(data) {
							$(".select_img img").attr("src", data.target.result).width(500);								
						}
						reader.readAsDataURL(this.files[0]);
					}
				});
			</script>	
		</div>
		<input type="submit" value="수정">
		<input type="reset" value="취소">
		 
	</form>
</body>
</html>