<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/style.css">
<style type="text/css">
body{
	font-size: 15px;
}
div#root { width:1200px; margin:0 auto; }		 
section#content { float:right; width:100%; margin-top: 30px;}
	 
	 #content_1{
	 	display: inline-block;	 	 
	 	width: 100%;
	 	border-style: solid;	 	
	 }
	 img{
	 	display: inline-block;	 	 	 
	 	margin: 20px;
	 	margin-left:10px;
	 	float: left;
	 }
	 .lableZip{ 	 
	 	margin:0px;
	 	width:45%; 	
	 	margin-right: 10px;
	 	 
	 }	 
	 .pro_priceZip { 
		  padding:10px 0;
		  text-align:center;
		  position: relative;	 
		  display:inline; 
	  }
	  
	.pro_price { padding:10px 0; text-decoration:line-through;color: gray;position: relative;display:inline;}
	.pro_saleprice { padding:10px 0; position: relative;display:inline; }
	 
	 .context_header{
	 	margin: 10px;
	 }
	 .context_text{
	  	margin: 10px;
	  	margin-top: 40px;
	  	margin-bottom: 40px;
	 }
	 
	table {
    	width: 100%;
    	border-top: 1px solid #444444;
    	border-collapse: collapse;
  }
  th, td {
	    border-bottom: 1px solid #444444;
	    padding: 10px;
  }
  input{
  	width: 100px;
  }
  #minus,#plus {  	  
  	   border:none;  
  	   background:none;
  }
  button{
  	border-radius: 20px;
  }
 
</style> 
<script src="https://kit.fontawesome.com/5b334c6c49.js" crossorigin="anonymous"></script>
<title>Insert title here</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="/js/qty.js"></script>
<script type="text/javascript" src="/js/product.js"></script>
<script type="text/javascript">
	$(function(){
		let pro_price = ${p.pro_price};
		let pro_saleprice = ${p.pro_saleprice};
		let pro_name = "${p.pro_name}"
		let pro_no = ${p.no}	
		let cart_option = "${option.pro_option_name}";
		
	//카트관련	
		$("#cart").click(function(){
			let isOption = $("#optionList tr").length;
			
			if(isOption == 0 && ${cnt>=1 }){
				alert("상품의 옵션을 선택해주세요");
				return;
			}
			
			insertCart(isOption, cart_option,pro_price,pro_saleprice, pro_name, pro_no );
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
			let isOption = $("#optionList tr").length;
			
			if(isOption == 0 && ${cnt>=1 }){
				alert("상품의 옵션을 선택해주세요");
				return;
			}
			insertWish(isOption,cart_option,pro_no );
		})
		
	 	$("#pro_option_detail_name").change(function(){	
	 		
	 		let tr = $("<tr></tr>");
	 		let select = $("#pro_option_detail_name > option:selected").text();
	 		let end = select.indexOf('(');
	 		let option = $.trim(select.substr(0,end));
	 		let addPrice = $("#pro_option_detail_name > option:selected").val();	 		
	 		
			let addSub = $("<td></td>").attr("id", "addSub");
			let minus = $("<button></button>").html("-").attr("id", "minus");
			let qty = $("<input></input>").attr("id", "qty").val("1").attr("readonly", "readonly");
			let plus = $("<button></button>").html("+").attr("id", "plus");
			$(addSub).append(minus, qty, plus);
	 		
			let list = $("#optionList").html();
			$("#optionList tr").filter(function(i){
				  let arr_td = $(this).find("td");
				  selectedOption = $(arr_td[0]).text();
				  
				  if(option == selectedOption){
					  alert("이미 선택한 상품입니다.");
					  select='선택';
					  return;
				  }
			  });
			
	 		if(select != '선택'){
	 			$(tr).append( $("<td></td>").html( option ).attr( 'class', option )  );
				$(tr).append( $("<td></td>").html( addPrice ).attr( 'class', addPrice )  );
		 		$(tr).append(addSub);
		 		$("#optionList").append(tr);
	 		}	
	 		
			  
	 		
	 		$("select").find("option:first").attr("selected", "selected");
	 	 });
	 	
	});
		
	 $function(){
		  
		 /* $("#deleteProduct").find(".modal-content").load("/admin/deleteProduct?no=${p.no }");  */
		 $("#rateReview").find(".modal-content").load("/shop/listReview_rate?pro_no=${p.no}"); //상품 리뷰(평점순)
		 $("#insertReview").find(".modal-content").load("/shop/insertReview?pro_no=${p.no}");  //리뷰작성하기
		 $("#insertProQna").find(".modal-content").load("/shop/insertProQna?pro_no=${p.no}");  //1대1문의 작성하기
		 
		
		 
	 }	
</script>
</head>
<body>
   <div id="root">
      <header id="header">
         <div id="header_box">
            <jsp:include page="../header.jsp"/>
         </div>
      </header>   
                  
            <!-- 본문 -->         
               <section id="content">                  
                <div id="content_1"> 
                	<img src="/upload/${p.PRO_THUMBNAIL }" width="500" height="500"><br>   
                    <div class="lableZip" style="float: right;"> 
                     
                       <div class="context_header" >							 
							<strong><span> ${p.pro_name }</span></strong>
					   </div>          
                   	   <div class="context_header" id="priceZip">
							 	<strong><label for="pro_price">가격</label></strong>			
									  <div class="pro_price">
									    <span> ${p.pro_price } </span>
									  </div>   		
								  
									   <div class="pro_saleprice">
									    <span> ${p.pro_saleprice } </span>
									  </div>  
						</div>
						
						<div class="context_header" >			
						 	<strong><label for="review_count">리뷰</label></strong>				 
							 <span> ${review.count}개(${review.avg }점)</span> 
						</div>   
						
						<HR>
                     	<div class="context_text" style="margin: 10px" >							 
							 <span style="font-size: 13px;">${p.pro_content }</span>
						</div>	 	 
						 
						<div class="context_text" style="margin: 10px" >
							<strong><label for="pro_delivery">평균출고일자</label></strong>
							 <span>${p.pro_delivery }일</span>
						</div>
						<div class="context_text" style="margin: 10px" >
							<strong><label for="pro_brand">브랜드</label></strong>
							 <span>${p.pro_brand }</span>
						</div>
						<hr>
						<c:if test="${cnt<1 }">                      
							<div id="addSub" class="context_text">
								<button type="button" id="minus" >-</button>
								<input type="number" readonly="readonly" value="1" id="qty">
								<button type="button" id="plus">+</button>
							</div>	
	                      </c:if>
						 <c:if test="${cnt>=1 }">
                              <div id="combo" class="context_text">
                              		<span id="pro_option_name">
	                              		${option.pro_option_name}  
                              		</span>
                                    <select id="pro_option_detail_name" name="pro_option_detail_name">
                                       <option value="">선택</option>               
                                       <c:forEach var="op" items="${op}">                     
                                          <option value="${op.pro_add_price}">
                                          	${op.pro_option_detail_name}(${op.pro_add_price} )
                                          </option>
                                       </c:forEach>
                                    </select>
                               </div>
                    
                            <div id="littleCart" class="context_text">
                                  <table >
                                    <thead>
                                       <tr>
                                          <td>옵션</td>
                                          <td>추가금액</td>
                                          <td>수량</td>
                                       </tr>
                                    </thead>
                                    <tbody id="optionList"></tbody>
                                 </table>
                           </div>          
                    </c:if>
                    
                     <div id="btns" class="context_text">
                     		<a href="#" id="cart"><i class="fa-solid fa-cart-shopping fa-2x"></i></a> &nbsp;
					      	<a href="#" id="wishList"><i class="fa-solid fa-heart fa-2x"></i></a> &nbsp;
					      	<script src="https://kit.fontawesome.com/5b334c6c49.js" crossorigin="anonymous"></script>
							<button>바로결제</button>
							<p id="addMsg"></p>					     
					 </div>
				 </div>	<!-- lableZip -->
				</div> 	<!-- content_1 -->
                      <hr>
 						<div id="other" style="clear: both; margin: 10PX;">
							<%-- <a href="/shop/listReview_rate?pro_no=${p.no}">리뷰 목록 보기</a>	 --%>					
		 		            <%-- <a href="/shop/insertReview?pro_no=${p.no}"> 리뷰작성하기</a> --%>
		 		            <%-- <a href="/shop/insertProQna?pro_no=${p.no}"> 1대1문의작성하기</a> --%>
		 		            
		 		            <a id="rateReview" data-toggle="modal" data-target="#rateModal" role="button" href="/shop/listReview_rate?pro_no=${p.no}"><button>상품리뷰확인</button></a>
		 		            <a id="insertReview" data-toggle="modal" data-target="#reviewModal" role="button" href="/shop/insertReview?pro_no=${p.no}"><button>리뷰작성</button></a>
		 		            <a id="insertProQna" data-toggle="modal" data-target="#proQnaModal" role="button" href="/shop/insertProQna?pro_no=${p.no}"><button>1대1문의작성</button></a>
		 		            		 		            
		 		            
						</div>
 				
 				<div id="rrpModal">
                 	<!-- 모달창 -->
  			 			<div id="rateModal" class="modal fade" tabindex="-1" role="dialog"> 
  			 				<div class="modal-dialog"> 
  			 					<div class="modal-content"> 
  			 					</div> 
  			 				</div> 
  			 		    </div>
  			 		    
  			 		    <div id="reviewModal" class="modal fade" tabindex="-1" role="dialog"> 
  			 				<div class="modal-dialog"> 
  			 					<div class="modal-content"> 
  			 					</div> 
  			 				</div> 
  			 		    </div>
  			 		    
  			 		    <div id="proQnaModal" class="modal fade" tabindex="-1" role="dialog"> 
  			 				<div class="modal-dialog"> 
  			 					<div class="modal-content"> 
  			 					</div> 
  			 				</div> 
  			 		    </div>
  			 		    
                 </div>
                 
               </section><!-- 본문 -->               
                                   
            </div><!-- root -->
         
   
</body>
</html>