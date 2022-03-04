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
	<form action="/mypage/listQna" method="post">
						<input type="hidden" id="changeInput"/>
						 	<select id="changeTest" onchange="selectBoxChange(this.value)">
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
<<<<<<< HEAD
=======
									<td>${q2.img_name }</td>
									<td><img  src="/upload/qna/${q2.img_name }" width="100" height="100"></td>													 
									<td>
									<a href="/mypage/detailQna?pro_name=${q2.pro_name}">${q2.pro_name }</a>	
									</td>
									<td>${q2.title }</td>
									<td>${q2.qna_type }</td>
									<td>${q2.day }</td>
									<td>${q2.status }</td>
								 
>>>>>>> branch 'master' of https://github.com/TaeInYun/greenspace.git
									
								</tr>	
							</c:forEach>
						</table>	 	
	
</body>
</html>