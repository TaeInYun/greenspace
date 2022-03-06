<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="/css/shop.css" rel="stylesheet"/> 	 
<link href="/css/shop.css" rel="stylesheet"/> 	
<style type="text/css">
	 
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
						<div id="addSub">
							<button type="button" id="minus" >-</button>
							<input type="number" readonly="readonly" value="1" id="qty">
							<button type="button" id="plus">+</button>
						</div>	
                      </c:if>
                      
 

							<a href="/shop/listReview_rate?pro_no=${p.no}">리뷰 목록 보기</a>						
		 		            <a href="/shop/insertReview?pro_no=${p.no}"> 리뷰작성하기</a>
		 		            <a href="/shop/insertProQna?pro_no=${p.no}"> 1대1문의작성하기</a>

 
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
                    
                            <div id="littleCart" style="border-style: solid;">
                                  <table border="1">
                                    <thead>
                                       <tr>
                                          <td>선택옵션</td>
                                          <td>추가금액</td>
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