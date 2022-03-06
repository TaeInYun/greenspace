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
 <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <script type="text/javascript">
 </script>
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
	<div class="result-images">
		<!-- 업로드한 파일들을 forEach문을 이용해 <img> 태그에 표시 -->
		<c:forEach var="list" items="${imglist}" >
			<img src="../upload/commu/${list.save_img_name}">
	        <br><br><br>
	    </c:forEach>         
	</div>
		</li>
 	</ul>					 
</section>	
<!--<c:if test="${m.nickname == c.nickname}"></c:if>-->
<a href="/board/updateCommunity?no=${c.no }">글수정</a>
<a href="/board/deleteCommunity?no=${c.no }">글삭제</a>

<a href="/board/listCommunity">글목록</a>
</body>
</html>