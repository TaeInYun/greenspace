<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		$("input[type=checkbox]").prop("checked",true);
		
		$(document).on("click", "#listCart input[type=checkbox]", function() {
			$("input[name=allCheck]").prop("checked", false)
		});
		
		function sumPrice() {
			
			let tr = $("input[name=checkList]").parent();
			
			let total = 0;
			
			$.each($("input[name=checkList]:checked"), function() {
				let td = $(this).parent();
				let no = $(td).find("input[name=no]").val();
				let qty = $(td).find("input[name=qty]").val();
			});			
			
			//console.log(total);
		}
		
		
		
		
		
		
		
		
		sumPrice();
	})//end function
</script>
</head>
<body>
	<h2>장바구니</h2>
	<span>${cnt }</span>
	<hr>
	<div>
		<button>품절모두삭제</button>
		<button>선택삭제</button>
	</div>
	<div>
		<form action="insertOrder" >
			<table border="1" width="80%">
				<thead>
					<tr>
						<td>전체 ${cnt } 개</td>
						<td><input type="checkbox" name="allCheck"></td>
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
							<td>
								<input type="checkbox" name="checkList"">
								<input type="hidden" name="no" value="${c.no }">
								<input type="hidden" name="qty" value="${c.qty }">
							</td>
							<td>
								<div>
									<img src="${c.img }">
								</div>
								<div>
									<p>${c.pro_name }</p>
									<p>옵션: ${c.pro_option }/${c.option_detail}</p>
								</div>
							</td>
							<td>
								<span id="price">${c.price }</span>
								<span id="saleprice">${c.saleprice }</span>
							</td>
							<td>
								<button>-</button>
								<input type="number" value="${c.qty }">
								<button>+</button>
							</td>
							<td>
								<button>삭제</button>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</form>
	</div>
	<div id="order">
		<div id="address">
			<h5>배송지</h5>
			받는 사람 : ${addr.addr_receiver }
			주소 : ${addr.addr_road } ${addr.addr_detail }
			전화번호 : ${addr.addr_phone }
			<button>배송지변경</button>
		</div>
		<hr>
		<div id="orderPrice">
		</div>
		<hr>
	</div>
</body>
</html>