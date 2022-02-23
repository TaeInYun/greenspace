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
	
	
		<!-- --------------------옵션-------------------- -->	 	 
				let no = ${p.no};
				let data= {no:no}; 
			        $.ajax({url:"/findOptionName", data:data, success:function(data) {
			            $.each(data, function (index, value) {		
			           			 $('#pro_option_name').append('<option value="' + value.pro_option_name + '">' + value.pro_option_name + '</option>');
			           			  if("#pro_option_name2"!=null){
			           				 $('#pro_option_name2').append('<option value="' + value.pro_option_name + '">' + value.pro_option_name + '</option>');
			           			 }	
			             	})
			            }});
		    
			   
			$(document).on("change","#pro_option_name ",function(){				
				$("#pro_option_detail_name").empty();			
				pro_option_name = $(this).val(); 
			 	$("#select").text(pro_option_name);
				no = ${p.no};
				  
					let data = {
							pro_option_name:pro_option_name,				
						 	no:no
					};
						
					$.ajax({url:"/findOptionDetailName",data:data,success:function(data){
						 $('#pro_option_detail_name').append('<option value="' + null + '">' + null + '</option>'); 
							$.each(data, function(index, value){	 
								  $('#pro_option_detail_name').append('<option value="' + value.pro_option_detail_name + '">' + value.pro_option_detail_name + '</option>');
								  if("#pro_option_detail_name2"!=null){
									 $('#pro_option_detail_name2').append('<option value="' + value.pro_option_detail_name + '">' + value.pro_option_detail_name + '</option>');
			           			 }
							});
						}});
			})
			
				
			
			
			$(document).on("change","#pro_option_name2 ",function(){
				if($("#pro_option_name").val()==$("#pro_option_name2").val()){
					 	alert("이미 선택된 옵션입니다.");
						$("#pro_option_name2").val("--------");
				}else{
					$("#pro_option_detail_name2").empty();
					pro_option_name= $(this).val();
					let select1_1 = $("#select1-1").text(pro_option_name);
					no = ${p.no}; 
					  
						let data = {				 
								pro_option_name:pro_option_name,				
							 	no:no
						};
							
						$.ajax({url:"/findOptionDetailName",data:data,success:function(data){
							$('#pro_option_detail_name2').append('<option value="' + null + '">' + null + '</option>'); 
								$.each(data, function(index, value){	 
									  $('#pro_option_detail_name2').append('<option value="' + value.pro_option_detail_name + '">' + value.pro_option_detail_name + '</option>');
				           		});
							}});
					}//else
			}) 
			
			
			
			$(document).on("change","#pro_option_detail_name",function(){		
				pro_option_detail_name = $(this).val();		  	 
					$("#select2").text(pro_option_detail_name);
			 })
			 
			 
			 
			 
			
			$(document).on("change","#pro_option_detail_name2 ",function(){
				pro_option_detail_name2 = $(this).val();
				$("#select2-1").text(pro_option_detail_name2);
				$(".span").val
			})
				
		 
			  
			  
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
		
	/*	
		<!-- --------------------수량-------------------- -->	 	 		
		
		$(".plus").click(function(){
			   var num = $(".numBox").val();
			   var plusNum = Number(num) + 1;
			   
				   if(plusNum >= ${p.pro_stock}) {
				    	$(".numBox").val(num);
				   }else {
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
	
	
	

		<!-- --------------------미니카트 -------------------- -->	 	
		
		$(document).on("click", "#addOption", function() {
			
			let clone =$("#littelCart").clone();
			$("#littelCart_clone").append(clone);
			 
			
			let spanList = $("#selectOption").find(".span");
			$(spanList).text("");
			
			
			let selectList = $("#combo_1").find(".select");
			$(selectList).val("-- Select --");
			 
			let selectList2 = $("#combo_2").find(".select");
			if(selectList2!= null){
				$(selectList2).val("-- Select --");
			}
			
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
					상품번호 : ${p.no }<br>				
					상품이름 : ${p.pro_name }<br>				
					상품가격 :${p.pro_price}<br>	
					상품할인가 :${p.pro_saleprice}<br>
					상품설명 : ${p.pro_content }<br>	
					조회수 : ${p.pro_hit }<br>	 	
										
						
		 	<!-- --------------------옵션------------------- -->	 
		 		 <c:if test="${cnt>=1}">		 
		 		 <button id="addOption">다른 옵션 추가하기</button>		  
				 <hr>	  <!-- 옵션이 한 개라면--> 
				 	<div id="combo_1">
				 		<select id="pro_option_name" class="select">
					        <option value="">-- Select --</option>
					    </select>
					
						<select id="pro_option_detail_name" class="select">
					        <option value="">-- Select --</option>
					    </select><br>
					</div>	
							 <!-- 옵션이 두 개라면--> 
						 
								<c:if test="${cnt>=2}">
										<div id="combo_2">	
											    <select id="pro_option_name2" class="select">
											        <option value="">-- Select --</option>
											    </select>
											
												<select id="pro_option_detail_name2" class="select">
											        <option value="">-- Select --</option>
											    </select><br>
										</div>
				 				</c:if>
			     </c:if>
			  
			   
			   <!-- --------------------미니카트------------------- -->	 
										
					<div id="littelCart">					
							
							<div id="selectOption">
								<c:if test="${cnt>=1}">
									<div>
									 	<span id="select" class="span"> </span>
									 	<span id="select2"  class="span"></span><br>
								 	</div>
								 </c:if>	
								 
								 <c:if test="${cnt>=2}">
								 	<div>
									 	<span id="select1-1"  class="span"></span>
									 	<span id="select2-1" class="span"></span><br>
								 	</div>
								 </c:if>
							</div>	<!-- 콤보박스 -->
							
							수량<input type="text" value="1">
					</div><!-- 카트 -->		
				 	 
				 	 <hr>			
										
				<div id="littelCart_clone"></div>					
										
		 		<a href="/shop/insertReview?pro_no=${r.pro_no}"> 리뷰작성하기</a>
		 		<a href="/admin/updateProduct?no=${p.no}"> 상품수정</a>
		 		<a href="/admin/deleteProduct?no=${p.no}"> 상품삭제</a>
		 	
		 	   	
				<hr>		 
				 <img  src="/upload/${p.PRO_THUMBNAIL }" width="200" height="200">
				 <a href="">찜하기</a>
				 <a href="">카트</a>
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