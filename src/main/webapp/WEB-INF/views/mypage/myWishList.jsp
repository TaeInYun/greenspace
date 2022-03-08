<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/js/product.js"></script>
<script type="text/javascript" src="/js/checkbox.js"></script>
<script type="text/javascript">
	$(function() {
		//***** 체크박스에 대한 변수 선언
		let checkbox = "input[name=checkList]";
		let allCheck = "#checkedAll";
		
		$("a").click(function(event){
			event.preventDefault();
		});
		
		//***** 체크박스 클릭시 실행되는 이벤트함수
		$(document).on("click","#checkedAll",function() {
			checkedAll();
		});
		
		$(document).on("click", "input[name=checkList]"+ checkbox, function() {
			$(allCheck).prop("checked", false)
		}); 
		
		checkedAll();
		
		//***** 선택 상품 삭제
		$("#delSelected").click(function(){
			deleteWishList();
		});
	})
	
	

</script>
</head>
<body>
	<ul>
		<li>
			<input type="checkbox" id="checkedAll" checked="checked">
			<label for="checkedAll">전체선택</label>
		</li>
		<li >
			<a id="soldOut" href="#">품절모두삭제</a>
		</li>
		<li >
			<a id="delSelected" href="#">선택삭제</a>
		</li>
	</ul>
	<hr>
	<div>
		<c:forEach var="c" items="${list }">
			<div>
				<div>
					<input type="checkbox" name="checkList">
					<input type="hidden" value="${c.no }">
					<img src="/upload/${c.pro_thumbnail }">	
				</div>
				<div>
					<h4>${c.pro_brand }</h4>
					<h4>${c.pro_name }</h4>
					<c:if test="${c.pro_option != null}">
						<h5>옵션: (${c.pro_option }) ${c.option_detail }</h5>
					</c:if>
					<p>
						<span>${c.price + c.pro_add_price }</span>
						<span>${c.saleprice + c.pro_add_price }</span>
						<span>(${(1 - c.saleprice / c.price) * 100 } %)</span>
					</p>
				</div>
			</div>
		</c:forEach>
	</div>
	
</body>