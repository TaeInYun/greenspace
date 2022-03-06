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
	 <h2>배송지상세</h2>
	 <hr>
	 우편번호:${a.addr_postal} <br>
	 주소:${a.addr_road} <br>
	 주소상세:${a.addr_detail} <br>
	 배송메세지:${a.addr_msg} <br>
	 받는사람:${a.addr_receiver} <br>
	 휴대전화번호:${a.addr_phone} <br>
	 주소이름:${a.addr_title} <br>
	 회원번호:${a.member_no} <br>
	 
	 <a href="/mypage/updateAddress?no=${a.no}">수정하기</a>
</body>
</html>