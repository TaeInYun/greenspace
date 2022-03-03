<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

var selectBoxChange = function(value){
	 console.log("값변경테스트:"+value);
	 $("#changeTest").val(value);
}
</script>
</head>
<body>
<form action="/mainpage/listSearchQna" method="post">
							<input type="hidden" id="changeInput"/>
						 	<select id="changeTest" onchange="selectBoxChange(this.value)">  <!--선택 ? 1상품상세 2배송관련3재입고관련-->
						 		<!-- <option value="">전체</option> -->
						 		<option value=1>상품상세</option>
						 		<option value=2>배송관련</option>
						 		<option value=3>재입고</option>
						 		
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
									<a href="/mypage/detailQna?pro_name=${q2.pro_name}">${q2.pro_name }</a>	
									</td>
									<td>${q.qna_type }</td>
									<td>${q.title }</td>
									<td>${q.content }</td>
									<td>${q.nickname }</td>
									<td>${q.day }</td>
									<td>${q.status }</td>
								 
									
								</tr>	
							</c:forEach>
						</table>	 

</body>
</html>