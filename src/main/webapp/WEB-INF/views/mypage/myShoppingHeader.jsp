<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<ul>
		<li>
			<a href="/mypage/myOrder" class="nav-btn">
				<i class="fa-solid fa-hashtag" id="link_orderList" style="color:#d9d9d9"></i>
				<span class="nav-btn__text">주문내역</span>
			</a>
		</li>
		<li>
			<a href="#" class="nav-btn">
				<i class="fa-solid fa-hashtag" style="color:#d9d9d9"></i>
				<span class="nav-btn__text" id="orderReview">구매후기</span>
			</a>
		</li>
		<li>
			<a href="/mypage/myWishList" id="link_likeProduct" class="nav-btn">
				<i class="fa-solid fa-hashtag" style="color:#d9d9d9"></i>
				<span class="nav-btn__text" id="likeProduct">찜 상품</span>
			</a>
		</li>
	</ul>
</body>
</html>