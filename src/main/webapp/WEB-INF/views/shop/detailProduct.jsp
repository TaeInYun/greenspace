<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/css/shop.css" rel="stylesheet"/> 	
<style type="text/css">
	 button{
		disabled:disabled;
       }
</style> 
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
		
		 

		<!-- --------------------옵션-------------------- -->	 	 
		
		let a= $("p").hasClass('OCL');
		let d= $("p").hasClass('OSZ');
 
		let no = ${p.no};
		 b = $(".OCL").html();
		 c =$(".OSZ").html();
		
		
	  
		let data= {
				no:no,
				pro_option_name:b
		}; 
		$.ajax({url:"/findOptionDetailName", data:data, success:function(data) {		 	 
			  $.each(data, function (index, value) {			
				  if(a=true){				  
					  $('#pro_option_detail_name').append('<option value="' + value.pro_option_detail_name + '">' + value.pro_option_detail_name + '</option>');
				  } 
			  })
		}});
		
		
		let data2= {
				no:no,
				pro_option_name:c
		}; 
		$.ajax({url:"/findOptionDetailName", data:data2, success:function(data) {		 	 
			  $.each(data, function (index, value) {						
				  if(d=true){
					  $('#pro_option_detail_name2').append('<option value="' + value.pro_option_detail_name + '">' + value.pro_option_detail_name + '</option>');
					  $("#pro_option_detail_name2").prop('disabled',true); //첫번째 옵션 선택 전까지 막아둠
					 } 
			  })
		}});
		
		
		//첫 번째 콤보박스가 움직일시
	 	$("#pro_option_detail_name").change(function(){					
		 	$("#pro_option_detail_name2").removeAttr('disabled');	 
	 	})
		
		//두 번째 콤보박스가 움직일시
		$("#pro_option_detail_name2").change(function(){			
			  option1 = $("#pro_option_detail_name > option:selected").val();
			  option2 = $("#pro_option_detail_name2 > option:selected").val();	
	  
			 let tr = $("<tr></tr>");	
			 $(tr).append( $("<td></td>").html( option1 ).attr( 'class', option1 )  );
			 $(tr).append( $("<td></td>").html( option2 ).attr( 'class', option2)  )  ;
			 $("#optionList").append(tr);
			 $(tr).append( $("<input></input>").val( "구매개수를 입력하시오").attr( 'id', "qty" )	);
			  
			 
			 $("#pro_option_detail_name ").val(null);	
			 $("#pro_option_detail_name2 ").val(null);
			 
		 });
	 	
		
		
	});
</script>
</head>
<body>
	<h2>상품 상세</h2>
	<div id="btns">
		<button id="cart">장바구니 추가</button>
		<a href="" id="wishList">찜하기</a> 
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
							
					 	 	
					 		<hr>	
							상품번호 : ${p.no }<br>	
		 					상품이름 : ${p.pro_name }<br>				
							상품가격 : ${p.pro_price}<br>	
							상품할인가 :${p.pro_saleprice}<br>
							상품설명 : ${p.pro_content }<br>	
							<img  src="/upload/${p.PRO_THUMBNAIL }" width="200" height="200"><br>
 
						 
						 	<c:if test="${cnt<1 }">						 	
						 		<input type="text" value="수량을 입력하시오" id="qty">
						 	</c:if>
						 	
 
							<a href="/shop/listReview_rate?pro_no=${p.no}">리뷰 목록 보기</a>						
		 		            <a href="/shop/insertReview?pro_no=${p.no}"> 리뷰작성하기</a>
 
						 	<c:if test="${cnt>=1 }">
						  			 <div id="combo">	
						  				 		<p class="OCL">색상</p>
						  						<select id="pro_option_detail_name" class="select" >
											     	 <option value="null">------select------</option>
											    </select>
						  				 
											    
											    
											    <p class="OSZ">사이즈</p>
						  						<select id="pro_option_detail_name2" class="select">
											     	  	<option value="null">------select------</option>
											    </select>
									</div>
						  
									 <div id="littleCart" style="border-style: solid;">
		 									<table border="1">
												<thead>
													<tr>
														<td>선택옵션1</td>
														<td>선택옵션2</td>
														<td>구매수량</td>
													</tr>
												</thead>
												<tbody id="optionList"></tbody>
											</table>
									</div>							
						  </c:if>
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