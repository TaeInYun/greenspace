<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>녹지몰 - 나의 주문내역</title>
<link rel="stylesheet" href="/css/style.css">
<script src="https://kit.fontawesome.com/5b334c6c49.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/js/product.js"></script>
<script type="text/javascript" src="/js/checkbox.js"></script>
<script type="text/javascript">
	$(function() {
		$("#link_likeProduct").attr("style","color:white; background:#00913A;")
		$("#link_likeProduct i").attr("style","color:white;")
		$( $(".nav-btn")[2] ).attr("style", "background: #00913A;");
		$( $(".nav-btn .nav-btn__text")[2] ).attr("style", "color:white");
		
		$(".myShopping").attr("style","background: #00913A; font-weight:800; color: white; padding: 5px 15px; border-radius: 20px;");
		
		
		//***** 체크박스에 대한 변수 선언
		let checkbox = "input[name=checkList]";
		let allCheck = "#checkedAll";
		
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
			let select = $("input[name=checkList]:checked");
			let noArr = new Array();
			
			$.each(select, function() {
				let no = $($(this).siblings()[0]).val();
				noArr.push(no);
			});
			deleteWishList(noArr);
		});
		
		$("#isDelete").click(function(){
			let wishListNo = $(this).val();
			let noArr = [wishListNo];
			deleteWishList(noArr);
		});
	})
	
	

</script>
</head>
<body>
	<div id="root">
		<jsp:include page="../header.jsp"></jsp:include>
		<div class="section mypage">
			<jsp:include page="../mypage/myAside.jsp"></jsp:include>
			<main class="mypage-main">
				<jsp:include page="./myShoppingHeader.jsp"></jsp:include>
				<div>
					<ul class="btns_select">
						<li>
							<input type="checkbox" id="checkedAll" checked="checked">
							<label for="checkedAll">전체 선택</label>
						</li>
						<li >
							<a id="soldOut" href="#">품절 삭제</a>
						</li>
						<li >
							<a id="delSelected" href="#">선택 삭제</a>
						</li>
					</ul>
				</div>
				<hr>
				<div class="wishProducts">
					<c:forEach var="c" items="${list }">
						<div class="wishProduct">
							<div class="wishProduct-check">
								<input type="checkbox" name="checkList" id="chk_${c.no }">
								<input type="hidden" name="wishlist_no" value="${c.no }">
								<input type="hidden" name="pro_add_option_no" value="${c.pro_add_option_no }">
								<input type="hidden" name="pro_no" value="${c.pro_no }">
								<label for="chk_${c.no }"><img src="/upload/${c.pro_thumbnail }"></label>
							</div>
							<div class="wishProduct-detail">
								<a href="/shop/detailProduct?no=${c.pro_no }" class="wishProduct-detail__link">
									<span class="wishProduct-detail__like">
										<i class="fa-solid fa-heart-pulse fa-lg" style="color:#ff4f4f"></i>
										${c.cnt }
									</span>
									<h4 class="wishProduct-detail__proName">[ ${c.pro_brand } ]</h4>
									<h4 class="wishProduct-detail__proName">${c.pro_name }</h4>
								</a>
									<c:if test="${c.pro_option != null}">
										<h5>(${c.pro_option }) ${c.option_detail }</h5>
									</c:if>
									<p class="wishProduct-priceInfo">	
										<span class="priceInfo-price">${c.price + c.pro_add_price }</span>
										<span class="priceInfo-saleprice">${c.saleprice + c.pro_add_price }</span>
										<span class="priceInfo-saleRate">(${Math.round((1 - c.saleprice / c.price) * 100 *100) /100 } %)</span>
									</p>
							</div>
							<div>
								<input type="button" value="장바구니 담기">
								<button type="button" id="isDelete" value="${c.no }">삭제</button>
							</div>
						</div>
					</c:forEach>
				</div>
			</main>
		</div>
	</div>
</body>