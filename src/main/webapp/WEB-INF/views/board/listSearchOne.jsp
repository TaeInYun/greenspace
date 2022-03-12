<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>												 	
						 	<form action="/board/listSearchOne" method="post"> 
							<select name="searchColumn">
								<option value="EXC">교환</option>   <!-- EXC교환 REF환불 CAN취소 ETC기타 -->
								<option value="REF">환불</option>
								<option value="CAN">취소</option>
								<option value="ETC">기타</option>
							</select>
						 							 							 	
						 	<input type="text" name="keyword">
						 	<input type="submit" value="검색">
						 	</form>
						 	
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

</body>
</html>