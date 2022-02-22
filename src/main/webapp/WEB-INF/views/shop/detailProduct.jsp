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
<script type="text/javascript" src="/js/qty.js"></script>
<script type="text/javascript" src="/js/cart.js"></script>
<script type="text/javascript">
	$(function(){
		
		$("#cart").click(function(){		
			
			let cart_option = $("#pro_option_name > option:selected").val();
			let cart_option_detail = $("#pro_option_detail_name > option:selected").attr("name");
			let cart_qty = $("#qty").val();
			let member_no = 1;
			
			let option_price = $("#pro_option_detail_name > option:selected").val();
			let pro_price = ${p.pro_price};
			let pro_saleprice = ${p.pro_saleprice};
			
			//상품옵션이 아예없을경우
			if(cart_option == null){
				cart_option = "";
				cart_option_detail="";
			}
			
			// 상품가격 + 옵션가격
			if(option_price != null && option_price!=""){
				pro_price += Number(option_price)
				pro_saleprice += Number(option_price)
			}
			
			let data = {
					cart_name: '${p.pro_name}',
					cart_price:pro_price,
					cart_saleprice:pro_saleprice,
					pro_no:${p.no},
					cart_option:cart_option,
					cart_option_detail:cart_option_detail,
					cart_qty:cart_qty,
					member_no:member_no,
			};
			
			$.ajax({
				url: "isCart",
				data: data,
				success: function(cnt){
					console.log(cnt);
					if(cnt == 0){ //장바구니에 없는 상품
						$.ajax({
							url: "insertCart",
							data: data,
							success: function(msg){
								insertCartMSG(msg);
							}
						});//end ajax
					}else{
						insertCartMSG("이미 장바구니에 있는 상품입니다.");
					}
				}
			});

		});// end cart insert
		
		//수량 버튼
		$(document).on("click", "#minus", function() {
			minus(this);
		}); // end minus
		
		$(document).on("click", "#plus", function() {
			plus(this);
		}); // end plus
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
										
		 		<a href="/shop/insertReview?pro_no=${r.pro_no}"> 리뷰작성하기</a>
		 		 <c:if test="${cnt>=1}">	
				 <hr>	 
				      상품옵션 : 				 
				        <select id="pro_option_name" name="pro_option_name">
							<option value="">선택</option>					
								<c:forEach var="op" items="${op}">							
								<option value="${op.pro_option_name}">${op.pro_option_name}</option>				
							</c:forEach>
						</select>
						
						<select id="pro_option_detail_name" name="pro_option_detail_name">
							<option value="">선택</option>
							<c:forEach var="op" items="${op}">					
								<option value="${op.pro_add_price}" name="${op.pro_option_detail_name}">${op.pro_option_detail_name}+${op.pro_add_price}</option>										 		
							</c:forEach>
						</select>    
						
				</c:if>	
				<div id="addSub">
				<button type="button" id="minus" >-</button>
				<input type="number" value="1" id="qty">
					<button type="button" id="plus">+</button>
				</div>				  
				<hr>			 
				 <img  src="/upload/${p.PRO_THUMBNAIL }" width="200" height="200">
				 <a href="">찜하기</a>
				 <a href="">카트</a>
				 <hr>					 
				 <a href="">상품평</a>
				 <a href="">Q&A</a>
				 <a href="">교환환불</a>
					 
					 
		</section>					
					 
					<aside id="aside">
						<jsp:include page="../shop/shopAside.jsp"/>
					</aside>				
				</div>
			</section>
	</div><!-- 전체  section box-->
</body>
</html>