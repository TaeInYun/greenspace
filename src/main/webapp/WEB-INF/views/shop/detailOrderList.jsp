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
	<h2>주문 상세 내역</h2>
	<br>
	<h5>주문번호 : ${id } / 주문일자 : ${day }</h5>
	<table border="1" width="80%">
		<thead>
			<tr>
				<td>주문상품 정보</td>
				<td>판매가</td>
				<td>수량</td>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="c" items="${list }">
				<tr>
					<td>
						<div>
							<a href="/shop/detailProduct?no=${c.pro_no }">
								<img  src="/upload/${c.pro_thumbnail }" width="200" height="200">
							</a>
							<ul>
								<li>
									<a href="/shop/detailProduct?no=${c.pro_no }">
										${c.pro_name }
									</a>
								</li>
								<c:if test="${c.option_name != null }">
									<li>
										(${c.option_name })${c.option_detail}
									</li>
								</c:if>
							</ul>
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
		<h5>주문자 정보</h5>
		<table>
			<tr>
				<td>주문자</td>
				<td>${member.name }</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>${member.phone }</td>
			</tr>
			<tr>
				<td>이메일</td>
				<td>${member.email }</td>
			</tr>
		</table>
	</div>
	<div>
		<h5>배송 정보</h5>
		<table>
			<tr>
				<td>받는 사람</td>
				<td>${addr.addr_receiver }</td>
			</tr>
			<tr>
				<td>전화번호</td>
				<td>${addr.addr_phone}</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>${addr.addr_road}</td>
			</tr>
			<tr>
				<td>상세주소</td>
				<td>${addr.addr_detail }</td>
			</tr>
			<tr>
				<td>요청메세지</td>
				<td>${addr.addr_msg}</td>
			</tr>
		</table>
	</div>
	<div>
		<h5>결제 정보</h5>
		<table>
			<tr>
				<td>
					주문 금액			
				</td>
				<td>
					${ord.ord_price }			
				</td>
			</tr>
			<tr>
				<td>
					배송비		
				</td>
				<td>
					<c:if test="${ord.ord_price >= 50000 } ">
						0
					</c:if>
					<c:if test="${ord.ord_price < 50000 }">
						2500
					</c:if>
				</td>
			</tr>
			<tr>
				<td>
					사용 포인트		
				</td>
				<td>
					${ord.ord_use_point }			
				</td>
			</tr>
			<tr>
				<td>
					총 결제금액			
				</td>
				<td>
					${ord.total}			
				</td>
			</tr>
		</table>
	</div>
</body>
</html>