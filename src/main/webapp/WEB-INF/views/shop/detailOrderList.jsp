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
	<div id="root" class="root-position">
		<jsp:include page="../header.jsp"></jsp:include>
		<div class="cart-header">
			<div class="cart-title">
				<h2>주문 상세 내역</h2>
			</div>
		</div>
		<div class="section mypage">
			<div id="cart_products">
				<h3 class="detailOrderList-title">주문번호 : ${id } / 주문일자 : ${day }</h3>
				<table class="detailOrderList">
					<colgroup>
						<col width="*">
						<col width="20%">
						<col width="15%">
					</colgroup>
					<thead>
						<tr>
							<th>주문상품 정보</th>
							<th>판매가</th>
							<th>수량</th>
						</tr>
					</thead>
					<tbody class="detailOrderList__list">
						<c:forEach var="c" items="${list }">
							<tr>
								<td>
									<div>
										<a href="/shop/detailProduct?no=${c.pro_no }">
											<img  src="/upload/${c.pro_thumbnail }" width="200" height="200">
										</a>
									</div>
									<div>
										<p>
											<a href="/shop/detailProduct?no=${c.pro_no }">${c.pro_name }</a>
										</p>
										<c:if test="${c.option_name != null }">
											<p>(${c.option_name })${c.option_detail}</p>
										</c:if>
									</div>
								</td>
								<td>
									${c.pro_price }
								</td>
								<td>
									${c.pro_qty }개
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div>
					<h5>결제 정보</h5>
					<table>
						<tr>
							<th>
								주문 금액			
							</th>
							<th>
								${ord.ord_price }			
							</th>
						</tr>
						<tr>
							<th>
								배송비		
							</th>
							<th>
								<c:if test="${ord.ord_price >= 50000 } ">
									0
								</c:if>
								<c:if test="${ord.ord_price < 50000 }">
									2500
								</c:if>
							</th>
						</tr>
						<tr>
							<th>
								사용 포인트		
							</th>
							<th>
								${ord.ord_use_point }			
							</th>
						</tr>
						<tr>
							<th>
								총 결제금액			
							</th>
							<th>
								${ord.total}			
							</th>
						</tr>
					</table>
				</div>
			</div>
			<div id="orderList" class="orderList-position">
				<div class="orderList__info">
					<h5>주문자 정보</h5>
					<table>
						<colgroup>
							<col width="18%">
							<col width="*">
						</colgroup>
						<tr>
							<td>주문자</td>
							<td>${member.name }</td>
						</tr>
						<tr>
							<td>전화<br>번호</td>
							<td>${member.phone }</td>
						</tr>
						<tr>
							<td>이메일</td>
							<td>${member.email }</td>
						</tr>
					</table>
				</div>
				<div class="orderList__info orderList__info-delivery">
					<h5>배송 정보</h5>
					<table>
						<colgroup>
							<col width="18%">
							<col width="*">
						</colgroup>
						<tr>
							<td>받는 사람</td>
							<td>${addr.addr_receiver }</td>
						</tr>
						<tr>
							<td>전화 번호</td>
							<td>${addr.addr_phone}</td>
						</tr>
						<tr>
							<td>주소</td>
							<td>${addr.addr_road}</td>
						</tr>
						<tr>
							<td>상세 주소</td>
							<td>${addr.addr_detail }</td>
						</tr>
						<tr>
							<td>요청 메세지</td>
							<td>${addr.addr_msg}</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
</body>
</html>