<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/css/shop.css" rel="stylesheet"/> 	 
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){

  
	$("select[name=pro_option_name]").change(function(){
		let pro_option_name =  $(this).val() 
		alert(pro_option_name)
	}); 
	
	$.ajax({
		url:"detailProduct",
		type:'GET',
		data:{pro_option_name:pro_option_name},
		success:function(data){},
		error:function(){alert("error")}
	})
	 
});
		 
</script>
</head>
<body>
	<h2>상품 상세</h2>
	<div id="btns">
		<button id="cart">장바구니 추가</button>
	</div>
	<hr>
	 <div id="root">
		<header id="header">
			<div id="header_box">
				<jsp:include page="../shop/shopHeader.jsp"/>
			</div>
		</header>	
		 <section id="container">		
				<div id="container_box"> 
				<!-- 본문 -->			
					<section id="content">			
					상품번호 : ${p.no }<br>				
					상품이름 : ${p.pro_name }<br>				
					상품가격 :${p.pro_price}<br>	
					상품할인가 :${p.pro_saleprice}<br>
					상품설명 : ${p.pro_content }<br>	
					조회수 : ${p.pro_hit }<br>	 
				 					
		 		 	 
			
		<c:if test="${cnt>=1}">	
		 <hr>		 
 		 <form action="option" method="post">
 		 
 		  상품옵션 : 					      
				     <div id="option">		 
				        <select id="pro_option_name" name="pro_option_name"  >	
				       			<option value="">선택</option>							      		        	 				 				
								<c:forEach var="name" items="${name}">		
								 	<option value="${name.pro_option_name }">${name.pro_option_name }</option>							 						 
								</c:forEach>
						</select>
					</div>	
						 
						 
						 
			 	     <select id="pro_option_detail_name" name="pro_option_detail_name">
							<option value="">선택</option>
							<c:forEach var="ond" items="${ond}">					
								<option value="${ond.pro_option_detail_name}">${ond.pro_option_detail_name}</option>										 		
							</c:forEach>
						</select>    
	 
				
 		 </form>
		</c:if>		 
				     			  
					
					<form>
						<input class="id" type="hidden">
						<input class="pwd" type="hidden">
					</form>
					
					
									 
					<hr>			 
					 <img  src="/upload/${p.PRO_THUMBNAIL }" width="200" height="200">
					 <a href="">찜하기</a>
					 <a href="">카트</a>
					 <hr>					 
					 <a href="">상품평</a>
					 <a href="">Q&A</a>
					 <a href="">교환환불</a>
					<hr> 
					 
		</section>					
					 
					<aside id="aside">
						<jsp:include page="../shop/shopAside.jsp"/>
					</aside>				
				</div>
			</section>
	</div><!-- 전체  section box-->
</body>
</html>