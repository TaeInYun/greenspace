<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="/css/joinLogin.css">
<script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
<script src="https://kit.fontawesome.com/5b334c6c49.js" crossorigin="anonymous"></script> 
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
	padding: 50px 0 30px 0;
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
			<i class="fa-solid fa-circle-check fa-3x">?</i>
			<h1>ȸ�������� �Ϸ�Ǿ����ϴ�!</h1>
			<p>�α����Ͻø� ���� �پ��� ���񽺿� ������ ���� ������ �� �ֽ��ϴ�.</p>
			</div>
	<a href = "/mainpage/nonmember"><button id="homeBtn">Ȩ����</button></a>
	<a href = "/login"><button id="loginBtn">�α���</button></a>		
	</div>
<div id="footer">
<div id="footer_wrap">
	<div id="footer_text">
	<span>�̿���&nbsp; | &nbsp;�������� ó����ħ&nbsp; | &nbsp;���å &nbsp;|&nbsp; ������&nbsp; |&nbsp; ��������</span><br>
	<span>Copyright GreenSpace Corp. All Rights Reserved.</span>
	</div>
</div>
</div>	
	
</div>


</body>
</html>