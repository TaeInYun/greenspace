<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/admin.css" rel="stylesheet"/> 	 
<link rel="stylesheet" href="/css/style.css">
<style type="text/css">
	 .lableZip{	 	 
	 	width: 50%;
	 	text-align:center;
	 	 
	 }
	 .label{	 	 
	 	margin: 10px;
	 	margin-top: 0px;
	 }

</style>

</head>

<jsp:include page="../header.jsp"/>
<body>
	 <h2>배송지상세</h2>
	 <hr>
	 <div class="labelZip" ><!--style="float: right;"  -->
	 <div class="label">우편번호:${a.addr_postal} <br></div>
	 <div class="label">주소:${a.addr_road} <br></div>
	 <div class="label">주소상세:${a.addr_detail} <br></div>
	 <div class="label">배송메세지:${a.addr_msg} <br></div>
	 <div class="label">받는사람:${a.addr_receiver} <br></div>
	<div class="label"> 휴대전화번호:${a.addr_phone} <br></div>
	 <div class="label">주소이름:${a.addr_title} <br></div>
	<div class="label"> 회원번호:${a.member_no} <br></div>
	 </div>
	 
	 <a href="/mypage/updateAddress?no=${a.no}"><button>수정하기</button></a>
</body>
</html>