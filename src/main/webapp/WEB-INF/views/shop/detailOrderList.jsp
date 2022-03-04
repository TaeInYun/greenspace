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
	</div>
</body>
</html>