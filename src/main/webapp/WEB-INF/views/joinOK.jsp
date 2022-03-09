<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="/css/joinLogin.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<style type="text/css">

#footer{
	border-top: 1px #dddddd solid;
}

#container{
width: 900px;
margin-top:150px;
margin-bottom:150px;
text-align: center;
}

#content{
	width:100%;
	padding: 50px 0 50px 0;
}

#loginBtn,#homeBtn{
	width: 180px;
}
#homeBtn{
	background: #fff;
}
</style>
<title>Insert title here</title>
</head>
<body>

<div id=warp>

<header id="header">
	<div id="header_box">
		<jsp:include page="header.jsp"/>
	</div>
</header>
	<div id="container">
			<div id="content">
			<i class="fa-solid fa-circle-check fa">?</i>
			<h1>회원가입이 완료되었습니다!</h1>
			<p>로그인하시면 더욱 다양한 서비스와 혜택을 제공 받으실 수 있습니다.</p>
			</div>
	<a href = "/mainpage/nonmember"><button id="homeBtn">홈으로</button></a>
	<a href = "/login"><button id="loginBtn">로그인</button></a>		
	</div>
<div id="footer">
<div id="footer_wrap">
	<div id="footer_text">
	<span>이용약관&nbsp; | &nbsp;개인정보 처리방침&nbsp; | &nbsp;운영정책 &nbsp;|&nbsp; 고객센터&nbsp; |&nbsp; 공지사항</span><br>
	<span>Copyright GreenSpace Corp. All Rights Reserved.</span>
	</div>
</div>
</div>	
	
</div>


</body>
</html>