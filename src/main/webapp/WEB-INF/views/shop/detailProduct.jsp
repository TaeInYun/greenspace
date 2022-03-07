<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 
 	
<style type="text/css">
body{
	font-size: 15px;
}
div#root { width:900px; margin:0 auto; }		 
section#content { float:right; width:900px; margin-top: 30px;}
	 .label{
	 	margin:5px 10PX; 10PX; 5px;
	 	 
	 }
	 #content_1{
	 	display: inline-block;	 	 
	 	width: 100%;
	 	
	 }
	 img{
	 	display: inline-block;	 	 
	 	 
	 	margin: 20px;
	 	margin-left:10px;
	 	float: left;
	 }
	 .lableZip{	 	 
	 	 
	 	margin:0px;
	 	width:450px; 	
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
	 #combo{
		margin: 5px;
		margin-bottom: 20px;
		margin-top: 20px;		 
	 }
	 #littleCart{
		margin: 5px;		 
		margin-bottom: 20px;
		margin-top: 20px;		 
	 }
	 #btns{
	 	margin: 5px;
	 	margin-bottom: 20px;
		margin-top: 20px;		 
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
                <div id="content_1"> 
                	<img src="/upload/${p.PRO_THUMBNAIL }" width="370" height="400"><br>   
                    <div class="lableZip" style="float: right;">  
                       <div class="label" >							 
							<strong><span> ${p.pro_name }</span></strong>
						</div>          
                   	  	
                   	   <div class="label"  id="priceZip">
							 	<label for="pro_price" id="pro_price"></label>
							<div class="pro_priceZip">   
									  <div class="pro_price">
									    <span> ${p.pro_price } </span>
									  </div>   		
								  
									   <div class="pro_saleprice">
									    <span> ${p.pro_saleprice } </span>
									  </div>   		
							</div>			
						</div>	
						 <HR>
                     	<div class="label" style="margin: 10px" >							 
							 <span style="font-size: 13px;">${p.pro_content }</span>
						</div>	 	 
						 
						<div class="label" style="margin: 10px" >
							<strong><label for="pro_delivery">평균출고일자</label></strong>
							 <span>${p.pro_delivery }일</span>
						</div>
						<div class="label" style="margin: 10px" >
							<strong><label for="pro_brand">브랜드</label></strong>
							 <span>${p.pro_brand }</span>
						</div>
						 <c:if test="${cnt>=1 }">
                              <div id="combo">
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
                    
                            <div id="littleCart">
                                  <table border="1">
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
                    
                     <div id="btns">
				      <button id="cart">장바구니 추가</button>
				      <a href="" id="wishList">찜하기</a> 
				     </div>
				</div> 	
					
                        
 				</div>
                   
                      <c:if test="${cnt<1 }">                      
						<div id="addSub">
							<button type="button" id="minus" >-</button>
							<input type="number" readonly="readonly" value="1" id="qty">
							<button type="button" id="plus">+</button>
						</div>	
                      </c:if>
                      <hr>
 						<div id="other" style="clear: both; margin: 10PX;">
							<a href="/shop/listReview_rate?pro_no=${p.no}">리뷰 목록 보기</a>						
		 		            <a href="/shop/insertReview?pro_no=${p.no}"> 리뷰작성하기</a>
		 		            <a href="/shop/insertProQna?pro_no=${p.no}"> 1대1문의작성하기</a>
						</div>
 
                 
               </section><!-- 본문 -->               
                                   
            </div>
         </section>
   </div><!-- 전체  section box-->
   
</body>
</html>