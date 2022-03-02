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
			
			
			if(isNaN(usePoint)){
				alert("숫자만 입력해주세요!");
				$("#usePoint").val(0);
				return;
			}
			
			if(usePoint > userPoint){
				alert("보유 적립금을 초과하였습니다.");
				$("#usePoint").val(0);
				return; 
			}
			
			if(usePoint > totalPrice){
				alert("사용 적립금이 최종 결제금액을 초과하였습니다.");
				$("#usePoint").val(totalPrice);
			}
			
			let orderprice = ${orderInfo[3] };
			orderprice -= usePoint;

			$("#totalPrice").text(orderprice)
		})
		
		
	});
</script>
</head>
<body>
	<h2> Order / Payment</h2>
	<hr>
	<div>
		<h3>Product Info <span>상품정보</span></h3>
		<table border="1" width="80%">
			<thead>
				<tr>
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
	<div>
		<h3>배송 정보</h3>
		<div>
			<ul>
				<li>
					배송지 선택
				</li>
				<li>
					<div>
						<input type="radio" name="address"  id="basicAddr" checked="checked">
						<label for="basicAddr">기본 배송지</label>
						<input type="radio" name="address"  id="newAddr">
						<label for="newAddr">신규 배송지</label>
						<button type="button" id="changeAddr">배송지 변경</button>
					</div>
				</li>
			</ul>
			<ul>
				<li>
					수령인
				</li>
				<li>
					${receiverInfo[0]}
				</li>
			</ul>
			<ul>
				<li>
					휴대전화
				</li>
				<li>
					${receiverInfo[2]}
				</li>
			</ul>
			<ul>
				<li>
					배송지 주소
				</li>
				<li>
					(지번주소 필요)${receiverInfo[1]}
				</li>
			</ul>
			<ul>
				<li>
					배송 요청사항
				</li>
				<li>
					"구현 해야한다."
				</li>
			</ul>
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
				<li id="totalPrice">${orderInfo[3] }</li>
			</ul>
			<ul>
				<li>							
					<fmt:parseNumber integerOnly="true" value="${orderInfo[3] * 0.1}"></fmt:parseNumber>원
					포인트 적립예정
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
	<button>${orderInfo[3] }원 결제하기</button>
</body>
</html>