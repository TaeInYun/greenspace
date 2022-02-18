<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/shop.css" rel="stylesheet"/> 	 
</head>
<body>
	 <div id="root">
		<header id="header">
			<div id="header_box">
				<jsp:include page="../shop/shopHeader.jsp"/>
			</div>
		</header>	
	 
		 <section id="container">		
				<div id="container_box"> 
				<!-- 본문 -->			
					<section id="content">			
					상품이름 : ${p.pro_name }<br>
					상품가격 :${p.pro_name}<br>
					상품할인가 :${p.pro_saleprice}<br>
					상품설명 : ${p.pro_content }<br>	
					조회수 : ${p.pro_hit }<br>	 
					첨부파일명 : ${p.PRO_THUMBNAIL }<br>
					 <img  src="/upload/${p.PRO_THUMBNAIL }" width="200" height="200">
					</section>					
					 
					<aside id="aside">
						<jsp:include page="../shop/shopAside.jsp"/>
					</aside>				
				</div>
			</section>
	</div><!-- 전체  section box-->
</body>
</html>