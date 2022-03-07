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
						 	<form action="/admin/listSearchQna" method="post"> <!--   pro_qna_type_code=searchColumn(QSZ=사이즈 QDE=배송 QRE=재입고 QDT=상품상세 -->
							<select name="searchColumn">
								<option value="QSZ">사이즈</option>
								<option value="QDE">배송관련</option>
								<option value="QRE">재입고</option>
								<option value="QDT">상품상세</option>
							</select>
						 							 							 	
						 	<input type="text" name="keyword">
						 	<input type="submit" value="검색">
						 	</form>
						 	
						 	<table border="1" width="80%">
							<tr>
								
								<td>글번호</td>
								<td>상품이름</td>
								<td>문의유형</td>
								<td>제목</td>						
								<td>작성자</td>
								<td>작성일</td>
								<td>처리상태</td>
															 
								
							</tr>
							
							<c:forEach var="q" items="${list }">
								<tr>													
									<td>${q.no }</td>														 
									<td>
									<a href="/mypage/detailQna?no=${q.no}">${q.pro_name }</a>	
									</td>
									<td>${q.qna_type }</td>
									<td>${q.title }</td>									
									<td>${q.nickname }</td>
									<td>${q.day }</td>
									<td>${q.status }</td>
								 
									
								</tr>	
							</c:forEach>
						</table>	 
						
					<c:forEach var="i" begin="1" end="${totalPage }">
							<a href="listSearchQna?pageNUM=${i }">${i }</a>&nbsp;&nbsp;
					</c:forEach>

</body>
</html>