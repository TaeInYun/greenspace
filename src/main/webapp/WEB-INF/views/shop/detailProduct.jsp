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
<script type="text/javascript" src="/js/cart.js"></script>
<script type="text/javascript">
	$(function(){
	 	  
			  
	//카트관련	
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
							<a href="/shop/insertReview?pro_no=${r.pro_no}"> 리뷰작성하기</a>
					 		<a href="/admin/updateProduct?no=${p.no}"> 상품수정</a>
					 		<a href="/admin/deleteProduct?no=${p.no}"> 상품삭제</a>	
					 		<hr>	
							상품번호 : ${p.no }<br>	
		 					상품이름 : ${p.pro_name }<br>				
							상품가격 :${p.pro_price}<br>	
							상품할인가 :${p.pro_saleprice}<br>
							상품설명 : ${p.pro_content }<br>	
							<img  src="/upload/${p.PRO_THUMBNAIL }" width="200" height="200"><br>
						 
						 	<c:if test="${cnt>=1 }">
						  			  <select id="option" name="option">
										<option value="">선택</option>					
											<c:forEach var="op" items="${op}">							
											<option value="${op.pro_option_name}:${op.pro_option_detail_name }+${op.pro_add_price }">${op.pro_option_name}:${op.pro_option_detail_name }+${op.pro_add_price }</option>				
										</c:forEach>
									</select>
						   </c:if>
							 <div id="littleCart" style="border-style: solid;">
							 <!-- 	 
							 	 <p id="cartStock">
										 <span>구입 수량</span>
										 <button type="button" class="plus">+</button>
										 <input type="number" class="numBox" min="1" max="${p.pro_stock}" value="1" readonly="readonly"/>
										 <button type="button" class="minus">-</button>
								</p>
							 -->
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