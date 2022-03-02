<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/js/qty.js"></script>
<script type="text/javascript" src="/js/product.js"></script>
<script type="text/javascript" src="/js/checkbox.js"></script>
<script type="text/javascript">
	$(function(){
		//***** 체크박스에 대한 변수 선언
		let checkbox = "input[name=checkList]";
		let allCheck = "#checkedAll";
		
		//***** 체크박스 클릭시 실행되는 이벤트함수
		$(document).on("click","#checkedAll",function() {
			checkedAll();
			
			showOrderPriceInfo();
		});
		
		$(document).on("click", "#listCart "+ checkbox, function() {
			$(allCheck).prop("checked", false)
			showOrderPriceInfo();
		}); 
		
		
		//*****  수량 버튼 기능
		$(document).on("click", "#minus", function() {
			
			let qty = $(this).siblings();
			let cart_qty = Number( $( qty ).val() ) - 1;
			
			let td = $( $(this).parent() ).siblings()[1];
			let no =$( $(td).find( "input[name=pro_no]" ) ).val();
			
			updateQty(cart_qty,no);
			
		}); // end minus
		
		$(document).on("click", "#plus", function() {
			let qty = $(this).siblings()[1];
			let cart_qty = Number( $( qty ).val() )+1;
			
			let td = $( $(this).parent() ).siblings()[1];
			let no =$( $(td).find( "input[name=pro_no]" ) ).val();
			
			updateQty(cart_qty,no);
		}); // end plus
		

		//장바구니 상품 삭제		
		$(document).on("click", "#delete", function() {
			let noArr = new Array();
			noArr.push( $(this).val() );
			deleteCart(noArr);
		});
		
		
		//***** 선택 상품 삭제
		$("#delSelected").click(function(){
			let select = $("input[name=checkList]:checked");
			let noArr = new Array();
			
			$.each(select, function() {
				let no = $($(this).siblings()[2]).val();
				noArr.push(no);
			});
			
			deleteCart(noArr);
		});
		
		//***** 선택 상품 주문하기
		$("#order").click(function(){
			
			let select = $("input[name=checkList]:checked");
			let noArr = new Array();
			
			$.each(select, function() {
				let no = $($(this).siblings()[2]).val();
				noArr.push(no);
			});
			
			let receiverInfo = new Array();
			receiverInfo.push( $("#name").text() );
			receiverInfo.push( $("#address").text() );
			receiverInfo.push( $("#phone").text() );
			receiverInfo.push( $("#msg").val() );
			let orderInfo = new Array();
			let arr = document.getElementsByClassName("orderInfo");
			
			for( let i = 0; i < arr.length; i++){
				orderInfo.push( $(arr[i]).text() );
			}
			
 			$.ajax({
				url: "order_form",
				type: "post",
				data: {
					proInfo:noArr,
					receiverInfo:receiverInfo,
					orderInfo:orderInfo
				},
				success: function(){
					location.href="/shop/order_form"
				}
			});
		});
		
		
		//***** 서버동작시 실행
		checkedAll();
	})//end function
</script>
</head>
<body>
	<h2>장바구니</h2>
	<span>${cnt }</span>
	<hr>
	<div>
		<button id="soldOut">품절모두삭제</button>
		<button id="delSelected">선택삭제</button>
	</div>
	<div>
		<form action="insertOrder" >
			<table border="1" width="80%">
				<thead>
					<tr>
						<td>전체 ${cnt } 개</td>
						<td><input type="checkbox" id="checkedAll" checked="checked"></td>
						<td>상품명(옵션)</td>
						<td>가격</td>
						<td>수량</td>
						<td>주문관리</td>
					</tr>
				</thead>
				<tbody id="listCart">
					<c:forEach var="c" items="${list}">
						<tr>
							<td>
								${c.rownum }
							</td>
							<td id="values">
								<input type="checkbox" name="checkList"">
								<input type="hidden" name="price" value="${c.price }">
								<input type="hidden" name="saleprice" value="${c.saleprice }">
								<input type="hidden" name="pro_no" value="${c.no }">
								<input type="hidden" name="discount" value="${c.price - c.saleprice}">
							</td>
							<td>
								<div>
									<img src="/upload/${c.img }">
								</div>
								<div>
									<p>${c.pro_name }</p>
									<c:if test="${c.pro_option != null}">
										<p>옵션: ${c.pro_option }/${c.option_detail}</p>
									</c:if>
								</div>
							</td>
							<td>
								<span id="price">${c.price }</span>
								<span id="saleprice">${c.saleprice }</span>
							</td>
							<td id="addSub">
								<c:if test="${c.qty == 1 }">
									<button type="button" disabled="disabled" id="minus">-</button>
								</c:if>
								<c:if test="${c.qty != 1 }">
									<button type="button" id="minus">-</button>
								</c:if>
									<input type="number" readonly="readonly" value="${c.qty }">
								<button type="button" id="plus">+</button>
							</td>
							<td>
								 <button type="button"  id="delete" value="${c.no }">삭제하기</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
	</div>
	<div id="order">
		<div id="receiver">
			<h5>배송지</h5>
			<p> 받는 사람 : <span id="name">${info.name }</span> </p>
			<p>주소 : <span id="address">(${info.addr_postal})${info.addr_road } ${info.addr_detail }</span></p>
			<p>전화번호 : <span id="phone">${info.phone }</span></p>
			<input type="hidden" id="msg" value="${info.addr_msg }">
			<button>배송지변경</button>
		</div>
		<hr>
		<div id="orderInfo">
			<p>상품금액 : <span id="tot_price" class="orderInfo">${info.pro_price }</span> 원</p>
			<p>상품할인금액 : <span id="tot_discount" class="orderInfo">${info.pro_discount }</span> 원</p>
			<p>배송비 : <span id="delivery_price" class="orderInfo">${info.delivery_price}</span> 원 </p>
			<p>결제예정금액 : <span id="tot_saleprice" class="orderInfo">${info.pro_saleprice}</span> 원 </p>
		</div>
		<div>
			<button>주문하기</button>
		</div>
	</div>
</body>
</html>