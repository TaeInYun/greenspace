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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="/js/qty.js"></script>
<script type="text/javascript" src="/js/product.js"></script>
<script type="text/javascript">
	$(function(){
		let pro_price = ${p.pro_price};
		let pro_saleprice = ${p.pro_saleprice};
		let pro_name = "${p.pro_name}"
		let pro_no = ${p.no}	
		let member_no = 1;
		
	 	  
			  
	//카트관련	
		$("#cart").click(function(){		
			let data = getProductInfo(member_no, pro_price,pro_saleprice, pro_name, pro_no );
 			
			$.ajax({
				url: "isCart",
				data: data,
				success: function(cnt){
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
		
		$("#btns a").click(function(event){
			event.preventDefault();
		});
		
		$("#wishList").click(function(){
			let data = getProductInfo(member_no, pro_price,pro_saleprice, pro_name, pro_no );
		
			$.ajax({
					url: "insertWishList",
					data: data,
					success: function(msg){
						
					}
				});//end ajax
		})
		
		
		//-------------------옵션------------------
		$("#option").change(function(){		
			 let option = $("#option > option:selected").val();
			 let tr = $("<tr></tr>");	
			 $(tr).append( $("<td></td>").html( option)  );
			 $("#option > option:selected").prop('disabled',true);
			 $("#optionList").append(tr);
			 $(tr).append( $("<input></input>").val( "구매개수를 입력하시오")  );
		});
		
		
		
	/* 
		  $(".plus").click(function(){
			   var num = $(".numBox").val();
			   var plusNum = Number(num) + 1;
		   
			   if(plusNum >= ${p.pro_stock}) {
			    	$(".numBox").val(num);
			   } else {
			    	$(".numBox").val(plusNum);          
			   }
		  });
		  
		  $(".minus").click(function(){
			   var num = $(".numBox").val();
			   var minusNum = Number(num) - 1;
		   
			   if(minusNum <= 0) {
			   		$(".numBox").val(num);
			   } else {
			    	$(".numBox").val(minusNum);          
			   }
		  });
		*/  
	});
</script>
</head>
<body>
	<h2>상품 상세</h2>
	<div id="btns">
		<button id="cart">장바구니 추가</button>
		<a href="" id="wishList">찜하기</a>
		<a href="">카트</a>
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
							
					 		<a href="/admin/updateProduct?no=${p.no}"> 상품수정</a>
					 		<a href="/admin/deleteProduct?no=${p.no}"> 상품삭제</a>	
					 		<hr>	
							상품번호 : ${p.no }<br>	
		 					상품이름 : ${p.pro_name }<br>				
							상품가격 :${p.pro_price}<br>	
							상품할인가 :${p.pro_saleprice}<br>
							상품설명 : ${p.pro_content }<br>	
							<img  src="/upload/${p.PRO_THUMBNAIL }" width="200" height="200"><br>
							<a href="/shop/listReview_rate?pro_no=${p.no}">리뷰 목록 보기</a>						
		 		            <a href="/shop/insertReview?pro_no=${p.no}"> 리뷰작성하기</a>
		 		            <a href="/shop/insertProQna?pro_no=${p.no}"> 1대1문의작성하기</a>
		 	
		 		 <c:if test="${cnt>=1}">	
				 <hr>	 
				      상품옵션 : 				 
				        <select id="pro_option_name" name="pro_option_name">
							<option value="">선택</option>					
								<c:forEach var="op" items="${op}">							
								<option value="${op.pro_option_code}">${op.pro_option_name}</option>				
							</c:forEach>
						</select>
						
						<select id="pro_option_detail_name" name="pro_option_detail_name">
							<option value="">선택</option>
							<c:forEach var="op" items="${op}">					
								<option value="${op.pro_add_price}" name="${op.pro_option_detail_code}">${op.pro_option_detail_name}(+${op.pro_add_price})</option>										 		
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

				 <hr>					 
				 <a href="">상품평</a>
				 <a href="">Q&A</a>
				 <a href="">교환환불</a>
					 
					 
		</section>					


						 
						 	<c:if test="${cnt>=1 }">
						  			  <select id="option" name="option">
										<option value="">선택</option>					
											<c:forEach var="op" items="${op}">							
											<option value="${op.pro_option_name}:${op.pro_option_detail_name }+${op.pro_add_price }">${op.pro_option_name}:${op.pro_option_detail_name }+${op.pro_add_price }</option>				
										</c:forEach>
									</select>
						   </c:if>
							 <div id="littleCart" style="border-style: solid;">
								<table>
									<thead>
										<tr>
											<td>선택옵션</td>
											<td>구매수량</td>
											 
										</tr>
									</thead>
									<tbody id="optionList"></tbody>
								</table>
								
								
							 </div>
						 
						 <hr>					 
						 <a href="">상품평</a>
						 <a href="">Q&A</a>
						 <a href="">교환환불</a>
												 
					</section><!-- 본문 -->					
					<aside id="aside">
						<jsp:include page="../shop/shopAside.jsp"/>
					</aside>				
				</div>
			</section>
	</div><!-- 전체  section box-->
</body>
</html>