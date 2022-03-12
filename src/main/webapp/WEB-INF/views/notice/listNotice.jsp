<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/css/style.css">
	<link rel="stylesheet" href="/css/board.css">
	<link rel="stylesheet" href="/css/components/search.css">
    <title>녹지공간-공지사항</title>
    <style type="text/css">
	</style>
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
    

		<div id="board">
			<table border="1" width="80%">
				<tr>
		            <td>글 번호</td>
		            <td>글 제목</td>
		            <td>작성일</td>
	        	</tr>
        	<c:forEach var="notice" items="${list}">
	    	<c:set var="i" value="${i+1}"/>
	            <tr>
	                <td>
	                	${i+start}
	                </td> 
	                <td>
	                	<a href="detail?no=${notice.no}">${notice.notice_title}</a>
	                </td>
	                <td>
	                    <fmt:formatDate value="${notice.notice_date}" pattern="yyyy.MM.dd"/>
	                </td>
	            </tr>            
	      	</c:forEach>
    		</table>	
		
					<div class="writeBtn">
					<a href="insertNotice"><button>글쓰기</button></a>
					</div>
		
		
		<div id="paging">
			<c:forEach var="i" begin="1" end="${totalPage }">
        		<a href="listNotice?pageNUM=${i }">${i }</a>&nbsp;&nbsp;
    		</c:forEach>
		</div>
		</div>
    			
				</section>
			</div>	
		</section>	


</div>
	

</body>
</html>