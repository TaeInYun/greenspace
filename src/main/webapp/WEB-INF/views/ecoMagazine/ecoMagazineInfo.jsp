<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>녹지공간 쇼핑몰</title> 
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
					<ul>
						 <c:forEach var="p" items="${list }">
							 <li>
								<div class="PRO_THUMBNAIL">
									<a href="/shop/detailProduct?no=${p.no}">
										<img  src="/upload/${p.PRO_THUMBNAIL }" width="200" height="200">
									</a>
								</div> 
								  
								<div class="pro_name">
									<a href="/shop/detailProduct?no=${p.no}">${p.pro_name}</a>
								</div>
								
								<div class="pro_priceZip">   
									  <div class="pro_price">
									    <span> ${p.pro_price } </span>
									  </div>   		
								  
									   <div class="pro_saleprice">
									    <span> ${p.pro_saleprice } </span>
									  </div>   		
								 </div>				 
							 </li>
					  	</c:forEach>
					 </ul>					 
					</section>					
					 
					<aside id="aside">
						<jsp:include page="../shop/shopAside.jsp"/>
					</aside>				
			</div><!-- 전체  section box-->
		</section>
</div>
</body>
</html>