<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/header.css">

<style type="text/css">

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <div id="header_wrap">

		<div id="logo">
		<c:choose>
		<c:when test="${empty m }"> 
			<a href="/mainpage/nonmember"><img class="brand_logo" src="/upload/logo.png" ></a>
		</c:when>
		<c:when test="${not empty m }"> 
			<a href="/mainpage/member"><img class="brand_logo" src="/upload/logo.png" ></a>
		</c:when>
		</c:choose>
		</div>	
		
		<c:if test="${empty m }"> 
		<div id="header_menu_box">
		<ul>
			<li><a href="/login">로그인</a></li>
			<li><a href="/join">회원가입</a></li>
			<li><a href="/shop/cart">장바구니</a></li>
		</ul>	
		</div>
		</c:if>
	
		<c:if test="${not empty m}">
		<div id="member_memu_box">	
		<ul>
		<li>
		<div id="member_info">
			<strong>${m.levels }LV</strong>
			<strong>${m.nickname }</strong>
		</div>
		</li>
			<li><a href="/logout">로그아웃</a></li>
			<c:choose>
				<c:when test="${m.mem_type eq 0}">
				<li><a href="/mypage/memberInfo">마이페이지</a></li>
				</c:when>
				<c:when test="${m.mem_type eq 1}">
				<li><a href="/admin/listProduct">관리페이지</a></li>
				</c:when>
			</c:choose>	
			<li><a href="/shop/cart">장바구니</a></li>
		</ul>	
		</div>	
		</c:if>	
		
</div>		

	<div id="menu_bar">
	<div id="menu_box">
			<ul>
				<li><a href="../ecoMagazine/ecoMagazineInfo">Eco Magazine</a></li>
				<li><a href="../easyToStart/easyToStartList">Easy To Start</a></li>
				<li><a href="../shop/listProduct_home">Shop</a></li>
				<li><a href="../board/listCommunity">Community</a></li>
				<li><a href="../notice/listNotice">Notice</a></li>
			</ul>
	</div>		
</div>
 

</body>
</html>