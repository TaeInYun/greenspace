<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/css/style.css">
<title>Insert title here</title>
</head>
<body>
<div id="root">
	<jsp:include page="../header.jsp"></jsp:include>
	<div class="orderResult">
		<h2 class="orderResult-title">고객님의 상품주문 요청건을 완료하였습니다.</h2>
		<div class="orderResult_list">
			<div class="list-orderInfo">
				<p>주문번호</p>
				<span>${orderInfo.ord_id }</span>
				<p>승인번호</p>
				<span>${orderInfo.apply_num }</span>
				<p>결제 금액</p>
				<span style="font-weight:bold;">${orderInfo.ord_price }</span>
				<div class="orderInfo-list">
					<h3>주문 내역 </h3>
					<p>배송지</p>
					<div class="orderInfo-list__delivery">
						<p>(${orderInfo.addr_postal}) </p>
						<span>${orderInfo.addr_road }/${orderInfo.addr_detail }</span>
					</div>
					<p class="orderInfo-list__product-name">상품명</p>
					<c:forEach var="p" items="${proInfo }">
						<div class="orderInfo-list__product">
							<span>${p.cart_name }</span>
							<c:if test="${p.cart_option != null}">
							<span>(${p.cart_option }) ${p.cart_option_detail }</span>
							</c:if>
							<span> ${p.cart_saleprice }</span>
						</div> 
						</c:forEach>
					<div class="orderInfo-list__address">
						<p>전화번호 :</p>
						<span>${orderInfo.addr_phone }</span>
					</div>
				</div>
			</div>
			<div >
				
			</div>
		</div>
	</div>
</div>
</body>
</html>