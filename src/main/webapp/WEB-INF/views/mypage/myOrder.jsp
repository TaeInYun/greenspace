<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<table border="!", width="80%">
		<thead>
			<tr>
				<td>상품 정보</td>
				<td>주문 일자</td>
				<td>주문 번호</td>
				<td>주문 금액(수량)</td>
				<td>주문 상태</td>
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
						${c.day }
					</td>
					<td>
						${c.id }
					</td>
					<td>
						${c.pro_price }원<br>
						(${c.pro_qty }개)
					</td>
					<td>
						${c.status }
						<input type="button" value="후기 작성">
					</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
</body>
</html>