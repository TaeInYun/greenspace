<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#header_wrap{padding: 10px; height: 50px; border-bottom: 1px solid #cccccc;}
ul, li { margin:10px; padding:0; list-style:none; display: inline-block;} 
#logo{ margin: 0 auto; display: inline-block;} 
#memu{ display: inline-block; float: right; margin-right: 20px 60px 20px}

</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div id="header_wrap">

	<div id="logo">
			<h2>녹지공간</h2> 
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
			<li><a href="/memberInfo">마이페이지</a></li>
			<li><a href="/shop/cart">장바구니</a><li>
		</ul>	
		</div>	
		</c:if>	
</div>		

 
</body>
</html>