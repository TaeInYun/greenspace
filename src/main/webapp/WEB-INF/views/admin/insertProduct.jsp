<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자설정_상품등록</title>
<link href="/css/admin.css" rel="stylesheet"/> 
<link rel="stylesheet" href="/css/style.css">
<style type="text/css">
	.inputArea{
		margin: 10px;
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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-1.12.4.min.js" ></script>
<script type="text/javascript" src="https://code.jquery.com/ui/1.12.1/jquery-ui.js" ></script>
<script src = "http://code.jquery.com/jquery-latest.js"></script>
 
<script>
$(function(){
	$("#PRO_THUMBNAIL").change(function(){
		 if(this.files && this.files[0]) {
		  var reader = new FileReader;
		  reader.onload = function(data) {
		   $(".select_img img").attr("src", data.target.result).width(500);        
		  	}
		  reader.readAsDataURL(this.files[0]);
		 }
		});
})


</script>
</head>
<body> 	 
<div id="root">
	<header id="header">
		<div id="header_box">
			<jsp:include page="../header.jsp"/>
		</div>
	</header>		 
		
	<section id="container">		
		<div id="container_box"> 
			<!-- 본문 -->			
				<section id="content">
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
							  
						</div>	 
						<button  value="등록" id="optionButton">상품등록하기</button>
						 
					</form>
				</section>					
				 
				<aside id="aside">
					<jsp:include page="../admin/adminAside.jsp"/>
				</aside>				
			</div><!-- 전체  section box-->
		</section>
</div>












	
</body> 
</html>