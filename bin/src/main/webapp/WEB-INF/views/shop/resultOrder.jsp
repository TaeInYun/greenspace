<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h2>고객님의 상품주문 요청건을 완료하였습니다.</h2>
	<div>
		<h5>주문번호 : <span>${orderInfo.ord_id }</span> </h5>
		<h5>승인번호 : <span>${orderInfo.apply_num }</span> </h5>
		<h5>결제 금액 : <span>${orderInfo.ord_price }</span> 원</h5>
	</div>
	<div>
		주문내역 :
		<div>
			<ul>
				<li>배송지 :</li>
				<li>
					(${orderInfo.addr_postal}) ${orderInfo.addr_road }/${orderInfo.addr_detail }
				</li>
			</ul>
			<ul>
				<li>상품명 :</li>
				<c:forEach var="p" items="${proInfo }">
					<li>${p.cart_name } ${p.cart_saleprice }</li>
					<c:if test="${p.cart_option != null}">
						<li>${p.cart_option } ${p.cart_option_detail }</li>
					</c:if>
				</c:forEach>
			</ul>
			<ul>
				<li>전화번호 :</li>
				<li>${orderInfo.addr_phone }</li>
			</ul>
		</div>
	</div>
</body>
</html>