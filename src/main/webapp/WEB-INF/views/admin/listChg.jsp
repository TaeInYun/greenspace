<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자설정_챌린지 목록</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"><!-- 모달창 -->
<link href="/css/admin.css" rel="stylesheet"/>
<link rel="stylesheet" href="/css/style.css"> 
<link rel="stylesheet" href="/css/adminChg.css"> 
<link rel="stylesheet" href=""> 
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 

</head>
<body>

<div id="root">
		<header id="header">
			<div id="header_box">
				<jsp:include page="../header.jsp"/>
			</div>
		</header>		 
		
		<section id="container">		
			<div id="container_box"> 
				<!-- 본문 -->			
					<section id="content">
					
			<H2>챌린지 목록</H2>	
				
				
			<table id="chgTable">
				<tr>
					<td width="8%">번호</td>
					<td width="62%">제목</td>
					<td width="8%">나무 수</td>	
					<td width="12%">관리</td>		
				</tr>
				<c:forEach var="c" items="${chglist}">
					<tr>
						<td>${c.no }</td>
						<td>${c.chg_title}</td>	
						<td>${c.chg_tree }</td>	
						<td><input type="button" onclick="location.href='/admin/updateChg?no=${c.no }'" value="수정">
						<input type="button" onclick="location.href='/admin/deleteChg?no=${c.no }'" value="삭제">
						</td>
					</tr>	
						<tr>			 
						<td colspan="4">${c.chg_content }</td>
						</tr>
					
				</c:forEach>
			</table> 	
			
			<div>
			<a href="/admin/insertChg">추가</a>
			</div>
			


	<div>
		<H2>어제 챌린지 목록</H2>
			<table border="1" width="80%">
				<tr>
					<td>어제의 챌린지</td>	
				</tr>
				<c:forEach var="ylist" items="${yesterdayChgList }">
					<tr>
						<td>${ylist.chg_title}</td>	
					</tr>
				</c:forEach>
			</table> 	
		</div>	


		<div>
			<H2>오늘의 챌린지 목록</H2>
			<table border="1" width="80%">
				<tr>
					<td>오늘의 챌린지</td>	
				</tr>
				<c:forEach var="todaylist" items="${todaylist }">
					<tr>
						<td>${todaylist.chg_title}</td>	
					</tr>
				</c:forEach>
			</table> 	
		</div>	

		<div>
			<H2>내일의 챌린지 목록</H2>
			<table border="1" width="80%">
				<tr>
					<td>내일의 챌린지</td>	
				</tr>
				<c:forEach var="tomorrowList" items="${tomorrowList }">
					<tr>
						<td>${tomorrowList.chg_title}</td>	
					</tr>
				</c:forEach>
			</table> 	
		</div>	
		
		</section>
					<aside id="aside">
						<jsp:include page="../admin/adminAside.jsp"/>				 		 
					</aside>
			</div>
		</section>
	</div>

</body>
</html>