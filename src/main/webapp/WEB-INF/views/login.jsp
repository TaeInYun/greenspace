<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<link rel="stylesheet" href="/css/joinLogin.css">
<style type="text/css">
#input_group{
	margin-top: 8px;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/js/login.js"></script>
<script type="text/javascript">
$(function(){
   
	$('.tab-link').click(function () {
        var tab_id = $(this).attr('data-tab');
 
        $('.tab-link').removeClass('current');
        $('.tab-content').removeClass('current');
 
        $(this).addClass('current');
        $("#" + tab_id).addClass('current');
	})
	
});
</script>
</head>
<body>
<div id="warp">

	<div id="header-logo">
	<a href="/mainpage/nonmember"><img id="logo" src="/upload/logo.png"></a>
	</div>


<div id="container">
	<div id="content">
		<h2 style="text-align: center">로그인</h2>
		
		<!-- 탭메뉴 -->
		<div id="tab-menu">
			<a class="tab-link current" data-tab="login_member">기존 회원</a> 
		    <a class="tab-link" data-tab="login_nonmember">비회원 주문조회</a> 
		</div>
		
		<!-- 회원 로그인 -->
		<div id="login_member" class="tab-content current">
		<form id="login_form" action="login" method="post">
			<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
				
			<div class="input_group">
				<input type="text" class="input" name="username" id="id" placeholder="아이디를 입력해주세요"><br>
			</div>	
			<div id="input_group">
				<input type="password" class="input" name="password" id="pwd" placeholder="비밀번호를 입력해주세요"><br>
			</div> 
				
			<div class="error_id" style="display: none" >아이디를 입력해 주세요. </div>
			<div class="error_pwd" style="display: none">비밀번호를 입력해 주세요. </div>
				
			<!--로그인에러-->
			<c:if test="${param.error }">
				<div class="error_login" style="display: block" style="font:red">${loginFailMsg}</div>
			</c:if>
			<input id="loginBtn" type="button" value="로그인">
			</form>
		
		<!-- 아이디/비번찾기 -->
		<div class="find_link_wrap">
		 	<ul class="find_Link">
				 <li><a href="/findId">아이디 찾기</a></li> 
				 <li><a href="/findPwd">비밀번호 찾기</a></li>
			 </ul>
		</div>	 	
	</div>
		
		<!-- 비회원 로그인 -->
		<div id="login_nonmember" class="tab-content">
				<form id="login_order_form" action="loginByOrderId" method="post">
				<!-- <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"> -->
				
				<div id="input_group">
				<input type="text" class="input" name="orderName" id="orderName" placeholder="주문자명"><br>
				</div>
				
				<div id="input_group">
				<input type="text" class="input" name="orderNum" id="orderNum" placeholder="주문번호"><br>
				</div> 
				<div class="error_orderName" style="display: none" >주문자명을 입력해주세요. </div>
				<div class="error_orderNum" style="display: none">주문번호를 입력해주세요. </div>
				<span class="error_msg" style="display:none"></span>
				<input id="loginOrderBtn" type="button" value="비회원 주문조회">
					<div class="nonmember_text">
					<span>주문번호는 상품 주문 시 입력하신 문자로 발송되었습니다.<br>
						확인이 어려울 시 고객센터로 문의하세요.</span>
					</div>	
				</form>
			</div>
			
		 <!-- 회원가입 -->
		<div class="join_link">
			<span>계정이 없으신가요?</span>
			<a href="/join"><button id="join">회원가입</button></a>
		</div>
	
		</div>
	</div>		
</div>

			



</body>
</html>