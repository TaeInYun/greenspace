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
		
		///** 장바구니리스트
		
		let checkbox = "input[name=checkList]";
		let allCheck = "#checkedAll";
		
		// 전체체크에 관한 기능 추가
		
		function checkedAll() {
			if( $("#checkedAll").is(":checked") ){
				$("input[name=checkList]").prop("checked", true);
			}else{
				$("input[name=checkList]").prop("checked", false);
			}
		}// 전체체크 함수
		
		$(document).on("click","#checkedAll",function() {
			checkedAll();
		});
		
		$(document).on("click", "#listCart "+ checkbox, function() {
			$(allCheck).prop("checked", false)
		}); 
		
		// 수량 버튼 기능 추가
		$(document).on("click", "#minus", function() {
			let qty = $(this).siblings();
			let value = Number( $( qty ).val() );
						
 			if(value == 1){
				$(qty).val(1);
			}else{
				$(qty).val(value-1);
			} 
		}); // end minus
		
		$(document).on("click", "#plus", function() {
			let qty = $(this).siblings()[1];
			let value = Number( $( qty ).val() );
			
			$(qty).val(value+1);
		}); // end plus
		
		function deleteCart(){
			
		}
		
		
		$(document).on("click", "#delete", function() {
			re = confirm("해당상품을 삭제하시겠습니까?");
			if(re == true){
				let no = $(this).val();
				
				$.ajax({
					url: "deleteCart",
					data: {no:no},
					success: function() {
						alert("해당 상품을 장바구니에서 삭제하였습니다.");
						location.href="cart";
					}
				});
				
			}//end if
		});

/* 		function deleteCart() {
			re = confirm("해당상품을 삭제하시겠습니까?");
			if(re == true){
				let no = $(this).val();
				
				$.ajax({
					url: "deleteCart",
					data: {no:no},
					success: function() {
						alert("해당 상품을 장바구니에서 삭제하였습니다.");
						location.href="cart";
					}
				});
				
			}
		} */
		
		// ** 주문서
		function sumPrice() {
			
			let total = 0;
			let price = 0;
			let saleprice = 0;
			
			let tr = $("input[name=checkList]").parent();
			
			$.each($("input[name=checkList]:checked"), function() {
				let td = $(this).parent();
				let no = $(td).find("input[name=no]").val();
				let qty = $(td).find("input[name=qty]").val();
			});			
			
			//console.log(total);
		}// end sumPrice()
		
		//서버동작시 실행
		checkedAll();
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
							<td>
								<input type="checkbox" name="checkList"">
								<input type="hidden" name="price" value="${c.price }">
								<input type="hidden" name="saleprice" value="${c.saleprice }">
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
								<button type="button" id="minus">-</button>
								<input type="number" value="${c.qty }">
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