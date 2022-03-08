<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EASY TO START</title> 
	<link href="/css/easytostart.css" rel="stylesheet"/> 	 
</head>
<body>
	<div id="root">
		<header id="header">
			<div id="header_box">
				<div id="header1_box">
					<jsp:include page="../header.jsp"/>
				</div>
				
				
			</div>
		</header>		 
		
		<section id="container">		
			<div id="container_box"> 
				<!-- 본문 -->			
					<section id="content">
					<div id="header2_box">
					 <jsp:include page="../shop/shopHeader.jsp"/>
					</div>
					<ul>
						 <c:forEach var="e" items="${easyToStart }">
							 <li>
								<div class="PRO_THUMBNAIL">
									<a href="detail?no=${e.no}">
										<img  src="/upload/ets/${e.ets_thumbnail}" width="200" height="200">
									</a>
								</div> 
								  
								<div class="pro_name">
									<a href="detail?no=${e.no}">${e.ets_title }</a>
								</div>
											 
							 </li>
					  	</c:forEach>
					 </ul>					 
					</section>					
					 
								
			</div><!-- 전체  section box-->
		</section>
</div>
</body>
</html>