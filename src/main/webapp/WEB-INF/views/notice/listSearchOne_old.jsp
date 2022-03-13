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
		#noticeHeader{
				display: flex; 
				justify-content:center;	
				margin: 30px 0 30px 0;
		}
		#container_box{
			display: flex; 
			justify-content:center;
		}
		#content{
			width: 1000px;
		}
	</style>
	
	
</head>
<body>					

<div id="root">
<div>
			<jsp:include page="../header.jsp"></jsp:include>
		</div>
		
		<div id="noticeHeader">
				<jsp:include page="./noticeHeader.jsp"/>
		</div>		
		<section id="container">	
			<div id="container_box"> 
				<section id="content">		
		 <div id="commu_box">
			<div id="search_form">			 	
						 	<form action="/notice/listSearchOne" method="post"> 
						 	<div class="searchColumn_wrap">
								<select name="searchColumn">
									<option value="EXC">교환</option>   <!-- EXC교환 REF환불 CAN취소 ETC기타 -->
									<option value="REF">환불</option>
									<option value="CAN">취소</option>
									<option value="ETC">기타</option>
								</select>
						 	</div>			
						 	
						 	<div class="search_keyword_form">			 							 	
						 		<input type="text" name="keyword">
						 		<input type="submit" value="검색">
						 		
						 	</div>
						 	</form>
						</div> 	
					</div>
						 	<table border="1" width="80%">
							<tr>
								
								<td>글제목</td>
								<td>내용</td>
								<td>작성일</td>
								
															 
								
							</tr>
							
							<c:forEach var="o" items="${list }">
								<tr>																																		 
									<td>
									<a href="/mypage/detailOne?no=${o.no}">${o.one_title }</a>	
									</td>
									<td>${o.one_content }</td>
									<td>${o.one_date }</td>									
								
								 
									
								</tr>	
							</c:forEach>
						</table>	 
						
					<c:forEach var="i" begin="1" end="${totalPage }">
							<a href="listSearchOne?pageNUM=${i }">${i }</a>&nbsp;&nbsp;
					</c:forEach>
					
					
					<div class="writeBtn">
    				<button>
    					<a href="#">글 등록</a>
    				</button>
    			</div>
			</section>
		</div>
	</section>
</div>

</body>
</html>