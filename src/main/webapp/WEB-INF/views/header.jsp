<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#header_wrap{padding: 10px; height: 50px; }
ul, li { margin:10px; padding:0; list-style:none; display: inline-block;} 
#logo{  display: inline-block; float: left; margin: 10px;  font-size: 35px; font-weight: bold; } 
#memu{ display: inline-block; float: right; margin-right: 20px 60px 20px}
a:link { color:black;text-decoration: none; }
a:visited {
  color : black;
  text-decoration: none;
}
#menu{
	float: right;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

 <div id="header_wrap">

		<div id="logo">
			<span style="font-size: 25px"><a href="../mainpage/nonmember">녹지공간</a></span>
		</div>	
		
		 
		
		<c:if test="${empty m }"> 
		<div id="memu">
		<ul>
			<li><a href="/login">로그인</a></li>
			<li><a href="/join">회원가입</a></li>
			<li><a href="/shop/cart">장바구니</a><li>
		</ul>	
		</div>
		</c:if>
	
		<c:if test="${not empty m}">
		<div id="memu">
			<strong>${m.levels }LV</strong>
			<strong>${m.nickname }</strong>
		<ul>	
			<li><a href="/logout">로그아웃</a></li>
			<li><a href="/mypage/memberInfo">마이페이지</a></li>
			<li><a href="/shop/cart">장바구니</a><li>
		</ul>	
		</div>	
		</c:if>	
		
</div>		
 
</body>
</html>