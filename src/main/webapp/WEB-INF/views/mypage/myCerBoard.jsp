<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="/css/board.css">
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/components/search.css">
<link rel="stylesheet" href="/css/mychallenge.css">
<link rel="stylesheet" href="/css/cerboard.css">
<style type="text/css">




</style>
<script src="https://kit.fontawesome.com/5b334c6c49.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function() {
	
	$( $(".nav-btn")[0] ).attr("style", "background: #00913A;");
	$( $(".nav-btn .nav-btn__text")[0] ).attr("style", "color:white");
	

});
</script>
<meta charset="UTF-8">
<title>녹지공간 - My인증게시판</title>
 
</head>
<body>
<div id="root">
		<jsp:include page="../header.jsp"></jsp:include>
		<div class="section mypage">
			<jsp:include page="../mypage/myAside.jsp"></jsp:include>
			<main class="mypage-main">
				<jsp:include page="./myActiveHeader.jsp"></jsp:include>
				<div class="search">
					<div class="search__btns">
						<a href="/mypage/myChallenge"><button type="button">My 챌린지</button></a>
						<a href="/mypage/myCerBoard"><button type="button">My 인증</button></a>
					</div>
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
		
		
		<div id="content_box">
		
					<ul>
						 <c:forEach var="c" items="${list }">
						 <li>
						 
								<div class="thumbnail">
								
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
								<div class="cer_content">
										<a href="/board/detailCerBoard?no=${c.no}">
										<span>${c.cer_content}</span></a>
								</div>	
							</li>		 
					  	</c:forEach>	
 					</ul>
		
				</div>
					
					
								 
			 		<div class="writeBtn">
					<a href="/board/insertCommunity"><button>글쓰기</button></a>
					</div>
			 
					
						
					<div id="paging">
					<ul>
					<c:forEach var="i" begin="1" end="${totalPage }">
				        <a href="myCerBoard?pageNUM=${i }">${i }</a>&nbsp;&nbsp;
				    </c:forEach>
					</ul>
				</div>
			</main>
		</div>
	</div>
</body>
</html>