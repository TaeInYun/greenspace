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
	<form action="/mypage/listQna" method="post">
						 	<select name="qnaColumn">
						 		<option value="">전체</option>
						 		<option value=1>상품상세</option>
						 		<option value=2>배송관련</option>
						 		<option value=3>재입고</option>
						 		
						 	</select>
						 	<input type="submit" value="검색">
						 	</form>
						 	
						 	
					<table border="1" width="80%">
							<tr>
								
								<td>사진</td>
								<td>상품이름</td>
								<td>내용</td>
								<td>문의유형</td>
								<td>작성일</td>
								<td>처리상태</td>
															 
								
							</tr>
							
							<c:forEach var="q2" items="${q }">
								<tr>													
									
								</tr>	
							</c:forEach>
						</table>	 	
	
</body>
</html>