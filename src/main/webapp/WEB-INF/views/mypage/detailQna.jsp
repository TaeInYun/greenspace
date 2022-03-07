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
	 상품번호:${qd.pro_no }<br>
	
	 
	   <a href="/shop/updateProQna?no=${qd.no}"><button>수정하기</button></a>  
	   <a href="/shop/deleteProQna?no=${qd.no}"><button>삭제하기</button></a>  
</body>
</html>