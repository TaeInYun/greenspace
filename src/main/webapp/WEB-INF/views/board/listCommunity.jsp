<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/board.css">
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/components/search.css">
<style type="text/css">



#container_box{
	display: flex; 
	justify-content:center;
}

#content{
	width:1000px;
}

</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta charset="UTF-8">
<script type="text/javascript">
$(function(){
		$( $(".nav-btn")[0] ).attr("style", "background: #00913A;");
	$( $(".nav-btn .nav-btn__text")[0] ).attr("style", "color:white");
})
</script>
<title>녹지공간-자유 게시판</title>
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
				<!-- 본문 -->			
				<section id="content">
				
				<div id="communityHeader">
				<jsp:include page="./communityHeader.jsp"/>
				</div>
				
				<div id="commu_box">
					<div id="search_form">
						<form action="/board/listCommunity" method="post">
						<div class="searchColumn_wrap">
								<select name="searchColumn" id="searchColumn">
									<option value="commu_title">제목</option>
									<option value="commu_content">본문</option>
									<option value="nickname">작성자</option>
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
								<td class="td_num">${i+start}</td>
								<td class="td_title"><a href="/board/detailCommunity?no=${c.no }">${c.commu_title}</a></td>				 
								<td class="td_nickname">${c.nickname }</td>
								<td class="td_date"><fmt:formatDate value="${c.commu_date }" pattern="yy.MM.dd HH:ss"/></td>
								<td class="td_hit">${c.commu_hit }</td>				
							</tr>
						</c:forEach>
						
					</table> 	
								
					<div class="writeBtn">
					<a href="/board/insertCommunity"><button>글쓰기</button></a>
					</div>
					
					<div id="paging">
				    <c:forEach var="i" begin="1" end="${totalPage }">
				        <a href="listCommunity?pageNUM=${i }">${i }</a>&nbsp;&nbsp;
				    </c:forEach>
				    </div>
				    </div>


				</section>
			</div>
	</section>
</div>			
</body>
</html>