<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.8.js"></script>
<script type="text/javascript" src="/js/order.js"></script>
<script type="text/javascript" src="/js/address.js"></script>
<script type="text/javascript">
	$(function(){
		if( $("#useMaxPoint").is(":checked") ){
			$("#usePoint").val(${point}  )
		};
		
		$("#useMaxPoint").click(function(){
			if($("#useMaxPoint").is(":checked")){
				$("#usePoint").val(${point}  )
			}else{
				$("#usePoint").val( 0  );
			}
		})
		
		$(document).on("focusout", $("#usePoint"), function(){
			
			let maxUseCheck = $()
			let usePoint = $("#usePoint").val();
			let userPoint = ${point};
			let totalPrice = ${orderInfo[3] };
			
			if(usePoint == userPoint){
				$("#useMaxPoint").attr("checked", true);
			}else if(usePoint != userPoint){
				$("#useMaxPoint").attr("checked", false);
			}
			
			if(isNaN(usePoint) || usePoint < 0){
				alert("0 또는 양의 정수(숫자)만 입력해주세요!");
				$("#usePoint").val(0);
				return;
			}
			
			if(usePoint > userPoint){
				alert("보유 적립금을 초과하였습니다.");
				$("#usePoint").val(0);
				return; 
			}
			
			if(usePoint > totalPrice){
				$("#usePoint").val(totalPrice);
			}
			
			let orderprice = ${orderInfo[3] }; 
			orderprice -= usePoint;

			$("#totalPrice").text(orderprice);
			$("#payPrice").text(orderprice);
		})//end focusout
		
		$("#newAddr").click(function(){
			chooseNewAddr();
		});
		
		$("#basicAddr").click(function(){
			chooseBasicAddr();
			
			$("input[name=addr_no]").val(${receiverInfo[0]});
			$("input[name=name]").val("${receiverInfo[1]}");
			$("input[name=phone]").val("${receiverInfo[2]}");
			$("input[name=addr_postal]").val("${receiverInfo[3]}");
			$("input[name=addr_road]").val("${receiverInfo[4]}");
			$("input[name=addr_detail]").val("${receiverInfo[5]}");
			$("input[name=addr_msg]").val("${receiverInfo[6]}");
		});
		
		// "결제"
		$("#pay").click(function(){
			let cnt = ${rownum}
			let arr = document.getElementsByClassName("cart_no");
			let arr_cartNo = new Array();
			
			for( let i = 0; i < arr.length; i++){
				arr_cartNo.push( $(arr[i]).val() );
			} 
			console.log(arr_cartNo)
			requestPay(cnt, arr_cartNo);
		});
	});
</script>
</head>
<body>
	<h2> Order / Payment</h2>
	<hr>
	<div>
		<h3>Product Info <span>상품정보</span></h3>
		<table border="1" width="800px">
			<thead>
				<tr>
					<td>번호</td>
					<td>상품 정보</td>
					<td>수량</td>
					<td>적립금</td>
					<td>상품할인</td>
					<td>주문금액</td>
				</tr>
			</thead>
			<tbody id="listCart">
				<c:forEach var="c" items="${list}">
					<tr>
						<td>
							${c.rownum }
							<input type="hidden" class="cart_no" value="${c.no }">
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
							${c.qty } 개
						</td>
						<td>
							<fmt:parseNumber integerOnly="true" value="${c.price * 0.1}"></fmt:parseNumber>
							 원
						</td>
						<td>
							<span id="price">
								- ${c.price - c.saleprice} 원
							</span>
						</td>
						<td>
							<span >${c.price}</span>
							<span>${c.saleprice} 원</span>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<p> 
			녹지공간은 5만원 이상 구매 시, 대한민국 내 제주도 및 도서 산간 지역 포함, <Strong>전 지역, 전 상품 무료배송 입니다.</Strong>
		</p>
		<p>
			2개 이상의 브랜드(업체) 상품을 주문하신 경우, 각 개별 배송됩니다.
		</p>
	</div>
	<div id="receiver">
		<h5>배송지</h5>
		<div>
			<input type="radio" name="address"  id="basicAddr" checked="checked">
			<label for="basicAddr">기본 배송지</label>
			<button type="button" id="changeAddr">주소록</button>
			<input type="radio" name="address"  id="newAddr">
			<label for="newAddr">신규 배송지</label>
		</div>
		<div id="receiverInfo">
			<input type="hidden" id="receiverNo" class="receiverInfo" name="addr_no" value="${receiverInfo[0]}">
			<input type="text" readonly="readonly" class="receiverInfo" name="name" value="${receiverInfo[1]}" placeholder="수령인">
			<input type="text" readonly="readonly" class="receiverInfo" name="phone" value="${receiverInfo[2]}" placeholder="연락처">
			<input type="text" readonly="readonly" class="receiverInfo" name="addr_postal" value="${receiverInfo[3]}" placeholder="우편번호">
			<input type="text" readonly="readonly" class="receiverInfo" name="addr_road" value="${receiverInfo[4]}"placeholder="주소">
			<input type="text" readonly="readonly"class="receiverInfo"  name="addr_detail" value="${receiverInfo[5]}" placeholder="상세주소">
			<input type="hidden" name="addr_msg" class="receiverInfo" value="${receiverInfo[6]}">
		</div>
	</div>
	<div>
		<div>
			<h3>최종 결제정보</h3>
			<ul>
				<li>상품 금액</li>
				<li>+ ${orderInfo[0] }</li>
			</ul>
			<ul>
				<li>상품 할인금액</li>
				<li>- ${orderInfo[1] }</li>
			</ul>
			<ul>
				<li>배송비</li>
				<li>+ ${orderInfo[2] }</li>
			</ul>
			<ul>
				<li>적립금 사용</li>
				<li>
					<input type="text" id="usePoint">
					<input type="checkbox" name="useMaxPoint" checked="checked" id="useMaxPoint">
					<label for="useMaxPoint">최대사용</label>
					<small>(사용가능 적립금: ${point} 원)</small>
				</li>
			</ul>
		</div>
		<div>
			<ul>
				<li>최종 결제금액</li>
				<li id="totalPrice">${orderInfo[3] - point }</li>
			</ul>
			<ul>
				<li>
					<span id="savePoint">
						<fmt:parseNumber integerOnly="true" value="${orderInfo[3] * 0.1}"></fmt:parseNumber>
					</span>							
					원 포인트 적립예정
				</li>
			</ul>
		</div>
	</div>
	<div>
		<h3>결제 수단</h3>
		<input type="radio" name="payment" id="card" checked="checked">
		<label for="card">신용카드</label>
		<input type="radio" name="payment" id="bankBook">
		<label for="bankBook">무통장 입금</label>
	</div>
	<div>
		<h3>개인 정보 수집</h3>
		<input type="checkbox" id="accept">
		<label for="accept">결제 진행 필수 동의</label>
	</div>
	<button id="pay"><span id="payPrice">${orderInfo[3] - point }</span>원 결제하기</button>
</body>
</html>