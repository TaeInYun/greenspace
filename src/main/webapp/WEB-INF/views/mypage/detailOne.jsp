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
	<h2>1대1문의 상세</h2>
	 <hr>
	  문의유형:${od.one_type_name} <br>  <!-- 새로운 dao를 컨트롤러에 불러와야할듯? -->
	  문의유형코드:${od.one_type_code}<br>
	 1대1문의 제목:${od.one_title}<br>
	 주문번호:${od.ord_no}<br>
	 내용:${od.one_content} <br>
	 작성일:${od.one_date} <br>	
	 처리상태:${od.qna_type_name} <br>	  <!-- 새로운 dao를 컨트롤러에 불러와야할듯? -->
	 처리상태코드:${od.qna_status_code} <br> 
	
	 
	   <a href="/board/updateOne?no=${od.no}"><button>수정하기</button></a>  
	   <a href="/board/deleteOne?no=${od.no}"><button>삭제하기</button></a>  
</body>
</html>