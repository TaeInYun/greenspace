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
	
<section id="content">
	<ul>
	 <li>
		<div class="title">
		<span>${c.commu_title}</span>
		</div>		 
		<div class="nickname">
		<span>LV ${m.levels} ${c.nickname}</span>
		</div>
		<div class="date">
		<span><fmt:formatDate value="${c.commu_date}" pattern="yy.MM.dd"/></span>
		</div>
		<div class="hit">
		<span>조회수  ${c.commu_hit}</span>
		</div>		
		<div class="content">
		<span>${c.commu_content}</span>
		</div>	
		</li>
 	</ul>					 
</section>	
<c:if test="${m.nickname == c.nickname}">
<a href="/board/updateCerBoard?no=${c.no }">글수정</a>
<a href="/board/deleteCerBoard?no=${c.no }">글삭제</a>
</c:if>
<a href="/board/listCerBoard">글목록</a>
</body>
</html>