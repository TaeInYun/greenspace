<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>

<jsp:include page="../header.jsp"/>
<body>
	 <h2>배송지상세</h2>
	 <hr>
	 <div>우편번호:${a.addr_postal} <br></div>
	 <div>주소:${a.addr_road} <br></div>
	 <div>주소상세:${a.addr_detail} <br></div>
	 <div>배송메세지:${a.addr_msg} <br></div>
	 <div>받는사람:${a.addr_receiver} <br></div>
	<div> 휴대전화번호:${a.addr_phone} <br></div>
	 <div>주소이름:${a.addr_title} <br></div>
	<div> 회원번호:${a.member_no} <br></div>
	 
	 <a href="/mypage/updateAddress?no=${a.no}">수정하기</a>
</body>
</html>