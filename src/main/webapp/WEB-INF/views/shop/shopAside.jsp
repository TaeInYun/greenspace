<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
 	.a{
 		display: block;
 		}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
<script type="text/javascript">
 
 $(function(){
	 $("#cat_ul").hide();	 
	 $("#filter").hide();	 
	 
	 $('h3').click(function() {
	        $('#cat_ul').slideToggle('slow', function() {
	         });
	 });
	 
	

	  
 })
 
</script>
</head>
<body>
	<h3>카테고리</h3>
	 <div id="cat_ul">
		<div class="a">
			 <a href="/shop/listProduct_home?cat_code=PBA">욕실</a> 
		</div>	
		<div class="a">
			<a href="/shop/listProduct_home?cat_code=PKI">주방</a>
		</div>
		<div class="a">
			<a href="/shop/listProduct_home?cat_code=PFO">식품</a>
		</div>
		<div class="a">
			<a href="/shop/listProduct_home?cat_code=PCO">화장품</a>
		</div>	
		<div class="a">
			<a href="/shop/listProduct_home?cat_code=PPE">애완용품</a>
		</div>
		<div class="a">
			  <a href="/shop/listProduct_home?cat_code=POF">사무용품</a>
		</div>	
		<div class="a">		 
			 <a href="/shop/listProduct_home?cat_code=PDA"  >일상용품</a>	
		</div>
	</div>	 		 
		 
	
	 
	 
</body>
</html>