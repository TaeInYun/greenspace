<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
.content{
width: 200px;
white-space: normal;
display: -webkit-box;
-webkit-line-clamp:3;
-webkit-box-orient:vertical;
overflow:hidden;
}

ul, li { margin:0; padding:0; list-style:none; } 

div#root { width:100%; margin:0 auto; }		 
section#content ul li { display:inline-block; margin:10px; }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
 
</head>
<body>

	<div id="header">
		<jsp:include page="../header.jsp"/>
	</div>

<h3>인증 게시판</h3>
<a href="/board/insertCerBoard">글등록</a>
	<div id="root">
		<section id="container">	
		<div id="container_box">	
				<!-- 본문 -->			
					<section id="content">
					<ul>
						 <c:forEach var="c" items="${list }">
						 <li>
								<div class="cer_thumbnail">
									<a href="/board/detailCerBoard?no=${c.no}">
										<img  src="/upload/cer/${c.cer_thumbnail }" width="200" height="200">
									</a>
								</div> 
								<div class="nickname">
									<span>${c.nickname}</span>
								</div>
								<div class="date">
								<span><fmt:formatDate value="${c.cer_date}" pattern="yy.MM.dd"/></span>
									
								</div>
								<div class="content">
										<a href="/board/detailCerBoard?no=${c.no}">
										<span style="text-overflow: ">${c.cer_content}</span></a>
								</div>	
						</li>		 
					  	</c:forEach>	
 					</ul>					 
					</section>	
				</div> 	 
		</section>								
</div>		 
</body>
</html>