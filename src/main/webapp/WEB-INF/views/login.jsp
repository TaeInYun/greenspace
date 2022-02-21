<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
	
		 $("#loginBtn").click(function(){
		
			var id = $("#id").val();
    		var pwd = $("#pwd").val();
	    	/* 아이디 공백일시 */
			 if(id==""){
				 $(".error_id").css("display","block");
				 $(".error_pwd").css("display","none");
				 return false;
			}
	    	
		    /* 비밀번호 공백일시 */
			 if(pwd==""){
				 $(".error_id").css("display","none");
				 $(".error_pwd").css("display","block");
				 return false;
			}
	    	
			 /* 로그인 메서드 서버 요청 */
		        $("#login_form").attr("action", "/login");
		        $("#login_form").submit();   
	});
		
	});
</script>
</head>
<body>
	<h2>로그인</h2>
	<form id="login_form" action="login" method="post">
	<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }">
	<div class="id_wrap">
	<input type="text" name="username" id="id" placeholder="아이디를 입력해주세요"><br>
	</div>
	<div class="pwd_wrap">
	<input type="password" name="password" id="pwd" placeholder="비밀번호를 입력해주세요"><br>
	</div> 
	<div class="error_id" style="display: none" >아이디를 입력해 주세요. </div>
	<div class="error_pwd" style="display: none">비밀번호를 입력해 주세요. </div>
	 <!--로그인에러-->
    <c:if test="${param.error }">
	<div class="error_login" style="display: block" style="font:red">${loginFailMsg}</div>
    </c:if>
	<input id="loginBtn" type="button" value="로그인">
	</form>
</body>
</html>