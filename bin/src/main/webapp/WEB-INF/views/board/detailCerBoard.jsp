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

		 <table id="chgTable" border="1" width="50%">
			<tr>
				<td>완료한 챌린지 목록</td>
			</tr>
			<tr>
				<c:if test="${c.chg_title1 ne null }">
				<td>${c.chg_title1 }</td>
				</c:if>
				<c:if test="${c.chg_title2 ne null }">
				<tr>
				<td>${c.chg_title2 }</td>
				</tr>
				</c:if>
				<c:if test="${c.chg_title3 ne null }">
				<tr>
				<td>${c.chg_title3 }</td>
				</tr>
				</c:if>
			</tr>
			</table>
	 
		<div class="nickname">
		<span>LV ${c.levels} ${c.nickname}</span>
		</div>
		<div class="date">
		<span><fmt:formatDate value="${c.cer_date}" pattern="yy.MM.dd"/></span>
		</div>
		<div class="hit">
		<span>조회수  ${c.cer_hit}</span>
		</div>	
		<div class="like">
		<span>좋아요  ${c.cer_like}</span>
		</div>		
		<span>${c.cer_status}</span>		
		<div class="content">
		<span>${c.cer_content}</span>
		</div>	
		
		 <c:if test="${c.cer_thumbnail ne null }">
		<div class="cer_thumbnail">
		<img  src="/upload/cer/${c.cer_thumbnail }" width="400" height="400">
		</div> 
		</c:if>	
		
		<div class="result-images">
		<!-- 업로드한 파일들을 forEach문을 이용해 <img> 태그에 표시 -->
		<c:forEach var="list" items="${imglist}" >
			<img src="../upload/cer/${list.save_img_name}" width="500px" height="100%">
	        <br><br><br>
	    </c:forEach>         
	</div>
				 
</section>	

<!--<c:if test="${m.nickname == c.nickname}"></c:if>-->
<a href="/board/updateCerBoard?no=${c.no }">글수정</a>
<a href="/board/deleteCerBoard?no=${c.no }">글삭제</a>


</body>
</html>