<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/style.css">
<style type="text/css">
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
<c:if test="${not empty m }">
<a href="/mypage/myCerBoard">내글 모아보기</a>
</c:if>
	<div id="root">
		<section id="container">	
		<div id="container_box">	
				<!-- 본문 -->			
					<section id="content">
					<ul>
						 <c:forEach var="c" items="${list }">
						 <c:if test="${c.cer_status eq '공개' }">
						 <li>
								<div class="cer_thumbnail">
									<a href="/board/detailCerBoard?no=${c.no}">
									<c:choose>
								<c:when test="${c.cer_thumbnail ne null }">
										<img  src="/upload/cer/${c.cer_thumbnail }" width="200" height="200">
								</c:when>
								<c:when test="${c.cer_thumbnail eq null }">
										<img  src="/upload/nothumbnail.png" width="200" height="200">
								</c:when>
								</c:choose>	
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
						</c:if>	 
					  	</c:forEach>	
 					</ul>					 
					</section>	
				</div> 
				    <c:forEach var="i" begin="1" end="${totalPage }">
			        <a href="listCerBoard?pageNUM=${i }">${i }</a>&nbsp;&nbsp;
			 	   </c:forEach>
					 
		</section>								
</div>		 
</body>
</html>