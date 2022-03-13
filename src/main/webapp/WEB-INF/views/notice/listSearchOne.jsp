<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <link rel="stylesheet" href="/css/style.css">
 <link rel="stylesheet" href="/css/board.css">
 <link rel="stylesheet" href="/css/components/search.css">
 <style type="text/css">

</style>
	
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
		$(function(){
			$( $(".nav-btn")[1] ).attr("style", "background: #00913A;");
			$( $(".nav-btn .nav-btn__text")[1] ).attr("style", "color:white");
		})
</script>	
	
</head>
<body>					

<div id="root">
	<header id="header">
			<div id="header_box">
				<jsp:include page="../header.jsp"  flush="false" />
			</div>
		</header>
		
		<section id="container">	
			<div id="container_box"> 
				<section id="content">
				
				<div id="noticeHeader">
					<jsp:include page="./noticeHeader.jsp"/>
				</div>
					
		 <div id="commu_box">
			<div id="search_form">			 	
					<form action="/notice/listSearchOne" method="post"> 
						 	<div class="searchColumn_wrap">
								<select name="searchColumn" id="searchColumn">
									<option value="EXC">교환</option>   <!-- EXC교환 REF환불 CAN취소 ETC기타 -->
									<option value="REF">환불</option>
									<option value="CAN">취소</option>
									<option value="ETC">기타</option>
								</select>
						 	</div>	
								<div class="search_keyword_form">
									 <input class="keyword" type="text" name="keyword"  placeholder="검색어 입력">
									  <img id="icon" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
								</div>
						 
					</form>
						</div> 	
					</div>
					
				<div id="board">	
						 	<table>
							<tr>
								<td>글번호</td>
								<td>글제목</td>
								<td>작성일</td>
							</tr>
							
							<c:forEach var="o" items="${list }">
								<tr>	
									<td>${o.no }</td>																																 
									<td>
									<a href="/notice/detailOne?no=${o.no}">${o.one_title }</a>	
									</td>
								
									<td>${o.one_date }</td>									
								
								</tr>	
							</c:forEach>
						</table>
						
					<div class="writeBtn">
    					<a href="insertOne"><button>글쓰기</button></a>
    				</div>	 
					
					<div id="paging">	
					<c:forEach var="i" begin="1" end="${totalPage }">
							<a href="listSearchOne?pageNUM=${i }">${i }</a>&nbsp;&nbsp;
					</c:forEach>
					</div>
				</div>
				
			</section>
		</div>
	</section>
</div>

</body>
</html>