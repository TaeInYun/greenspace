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
	<h2>상품문의</h2>
	 <hr>
	 상품이름:${qd.pro_name}<br>
	 문의유형:${qd.qna_type}<br>
	 제목:${qd.title} <br>
	 내용:${qd.content} <br>
	 글쓴이:${qd.nickname} <br>
	 작성일:${qd.day} <br>
	 처리상태:${qd.status} <br>
	
	 
	 <%--  <a href="/mypage/updateAddress?no=${a.no}">수정하기</a>  --%>
</body>
</html>