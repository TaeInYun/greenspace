<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib  prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>녹지공간 - 위시리스트</title>
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
		
		$("#cart").click(function(){
			let proInfo = $(this).siblings();
			
			let pro_no = $(proInfo[0]).val();
			let cart_name = $(proInfo[1]).val();
			let pro_price = $(proInfo[2]).val();
			let pro_saleprice = $(proInfo[3]).val();
			let cart_option = $(proInfo[4]).val();
			let cart_option_detail = $(proInfo[5]).val();
			let pro_add_price = $(proInfo[6]).val();
			let no = $(proInfo[7]).val();
			
			let totPrice = Number(pro_price) + Number(pro_add_price);
			let totSalePrice = Number(pro_saleprice) + Number(pro_add_price);
			
			console.log("totPrice" + totPrice);
			console.log("cart_name" + cart_name);
			console.log("totSalePrice" + totSalePrice);
			console.log("cart_option_detail" + cart_option_detail);
			
			let data = {
				pro_no : pro_no,
				cart_name : cart_name,
				cart_price: totPrice,
				cart_saleprice : totSalePrice,
				cart_option : cart_option,
				cart_option_detail : cart_option_detail,
				cart_qty: 1
			}

			$.ajax({
				url:"/shop/isCart",
				data:data,
				success: function(cnt){
					if(cnt == 0){ //장바구니에 없는 상품
						$.ajax({
							url: "/shop/insertCart",
							data: data,
							success: function(msg){
								alert(msg);
								let noArr = [no];
								deleteWishList(noArr);
							}
						});//end insertCart ajax
					}else{
						alert("이미 장바구니에 있는 상품입니다.");
					} 					
				}
			});//end isCart
		});
	});
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
								<div class="wishProduct-detail-proInfo ">
									<div class="wishProduct-detail__link">
										<span class="wishProduct-detail__like">
											<i class="fa-solid fa-heart-pulse fa-lg" style="color:#ff4f4f"></i>
											${c.cnt }
										</span>
										<div class="wishProduct__proInfo">
											<p class="wishProduct-detail__proName">[ ${c.pro_brand } ]</p>
											<p class="wishProduct-detail__proName">
												<a href="/shop/detailProduct?no=${c.pro_no }" >
													${c.pro_name }
												</a>
												<c:if test="${c.pro_option != null}">
													<p>(${c.pro_option }) ${c.option_detail }</p>
												</c:if>
											</p>
										</div>
									</div>
								</div>
								<p class="wishProduct-priceInfo">	
									<span class="priceInfo-price">${c.price + c.pro_add_price }</span>
									<span class="priceInfo-saleprice">${c.saleprice + c.pro_add_price }</span>
									<span class="priceInfo-saleRate">(${Math.round((1 - c.saleprice / c.price) * 100 *100) /100 } %)</span>
								</p>
							</div>
							<div>
								<input type="hidden" name="pro_no" value="${c.pro_no }">
								<input type="hidden" name="pro_name" value="${c.pro_name }">
								<input type="hidden" name="pro_price" value="${c.price }">
								<input type="hidden" name="pro_saleprice" value="${c.saleprice }">
								<input type="hidden" name="cart_option" value="${c.pro_option }">
								<input type="hidden" name="cart_option_detail" value="${c.option_detail }">
								<input type="hidden" name="pro_add_price" value="${c.pro_add_price }">
								<input type="hidden" name="wishlist_no" value="${c.no }">
								<input type="button" id="cart" value="장바구니 담기">
								<button type="button" id="isDelete" value="${c.no }">삭제</button>
							</div>
						</div>
					</c:forEach>
				</div>
			</main>
		</div>
	</div>
</body>