<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
		 
<!DOCTYPE html>
<html>
<head>

<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/board.css">
<link rel="stylesheet" href="/css/components/search.css">

<meta charset="UTF-8">
<title>녹지공간-공지사항</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
		$(function(){
			$( $(".nav-btn")[0] ).attr("style", "background: #00913A;");
			$( $(".nav-btn .nav-btn__text")[0] ).attr("style", "color:white");
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
				<!-- 본문 -->			
				<section id="content">
	
			<div id="noticeHeader">
					<jsp:include page="./noticeHeader.jsp"/>
			</div>
			
							<div id="commu_box">
					<div id="search_form">
						<form action="listBoard" method="post">
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
				
				<table id="detail_board_table">
					<colgroup> 
					<col width="80%">
					<col width="20%">
					</colgroup>
				<thead>
					<tr>
						<th><span>${n.notice_title }</span></th>
						<td><span><fmt:formatDate value="${n.notice_date}" pattern="yy.MM.dd"/></span></td>	
					</tr>				
			</thead>
			
			<tr>
				<td colspan="2">
					<div id="board_content">
					<p>${n.notice_content }</p>
					</div>
				</td>
			</tr>
		</table>		
							
		<div id="board_btn">		
			<c:if test="${m.nickname == c.nickname}">
			<a href="updateBoard?no=${n.no }"><button>글수정</button></a>
			<a href="deleteBoard?no=${n.no }"><button>글삭제</button></a>
			</c:if>
			<a href="/notice/listNotice"><button>글목록</button></a>	
		</div>

				</section>
			</div>
	</section>
</div>		

</body>
</html>