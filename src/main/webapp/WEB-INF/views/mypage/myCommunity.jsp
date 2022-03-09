<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div id="header">
		<jsp:include page="../header.jsp"/>
	</div>
	
  		<aside id="aside">
			<jsp:include page="../mypage/myAside.jsp"/>
		</aside>	
		
		
	<div id="root">
	<section id="container">
	
		<div id="container_box">	
				<!-- 본문 -->			
				<section id="content">
					
		<div id="submenu">
			<jsp:include page="../mypage/myActiveMenu.jsp"/>
		</div>	
			
		<h3>My 커뮤니티</h3>
		<div>
		<a href="/board/insertCommunity">글등록</a>
		</div>
		
			<table border="1" width="80%">
				<tr>
					<td>번호</td>
					<td>제목</td>
					<td>닉네임</td>
					<td>등록일</td>
					<td>조회수</td>
				</tr>
				<c:forEach var="c" items="${list }">
			    	<c:set var="i" value="${i+1}"/>
					<tr>
						<td>${i+start}</td>
						<td><a href="/board/detailCommunity?no=${c.no }">${c.commu_title}</a></td>				 
						<td>${c.nickname }</td>
						<td><fmt:formatDate value="${c.commu_date }" pattern="yy.MM.dd HH:ss"/></td>
						<td>${c.commu_hit }</td>				
					</tr>
				</c:forEach>
			</table> 	
			
		    <c:forEach var="i" begin="1" end="${totalPage }">
		        <a href="myCommunity?pageNUM=${i }">${i }</a>&nbsp;&nbsp;
		    </c:forEach>
		    
		    <div id="form">
				<form action="/board/listCommunity" method="post">
				<div class="w100" style="padding-right:10px">
						<select name="searchColumn" id="searchColumn">
							<option value="commu_title">제목</option>
							<option value="commu_content">본문</option>
							<option value="nickname">작성자</option>
						</select>
					        <input type="text" class="search-input" name="keyword" id="keyword"/>
					        <button type="submit" name="btnSearch" id="btnSearch">검색</button>
				</div>
				</form>

			</section>
			</div>
			 	   
</section>
</div>
</body>
</html>