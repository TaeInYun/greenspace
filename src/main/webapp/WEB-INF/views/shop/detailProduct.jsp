<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/css/shop.css" rel="stylesheet"/> 	 
<title>Insert title here</title>
<<<<<<< HEAD
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		$("#cart").click(function(){
			
			let cart_option = "";
			let cart_option_detail = "";
			let cart_qty = 1;
			let member_no = 1;
			let pro_add_option_no = "";
			
			
			let data = {
					cart_name: '${p.pro_name}',
					cart_price:${p.pro_price},
					cart_saleprice:${p.pro_saleprice},
					pro_no:${p.no},
					cart_option:cart_option,
					cart_option_detail:cart_option_detail,
					cart_qty:cart_qty,
					member_no:member_no,
					pro_add_option_no:pro_add_option_no
			};
			
			$.ajax({
				url: "insertCart",
				data: data,
				success: function(data){
					let span = $("<span></span>").attr("class","animate");
					span.html("장바구니에 추가되었습니다.");
					span.append( $("<a></a>").attr("href","./cart").html("장바구니로 가기") )
					$("#btns").append(span);
				}
			});//end ajax
			
		});
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
					상품이름 : ${p.pro_name }<br>
					상품가격 :${p.pro_price}<br>
					상품할인가 :${p.pro_saleprice}<br>
					상품설명 : ${p.pro_content }<br>	
					조회수 : ${p.pro_hit }<br>	 
					첨부파일명 : ${p.PRO_THUMBNAIL }<br>
					 <img  src="/upload/${p.PRO_THUMBNAIL }" width="200" height="200">
					</section>					
					 
					<aside id="aside">
						<jsp:include page="../shop/shopAside.jsp"/>
					</aside>				
				</div>
			</section>
	</div><!-- 전체  section box-->
</body>
</html>