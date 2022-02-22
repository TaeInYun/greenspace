<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"  %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.error_orderName, .error_orderNum, .error_msg{
	font-size: 0.7em;
	color: red;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
	$(function(){
		
		
		 $("#loginOrderBtn").click(function(){
			
			var orderName = $("#orderName").val();
	    	var orderNum = $("#orderNum").val();
	    	
	    	var data = {name:orderName,ord_id:orderNum};
	    	console.log(data);
	    	
		    	/* 주문자명 공백일시 */
				 if(orderName==""){
					 $(".error_orderName").css("display","block");
					 $(".error_orderNum").css("display","none");
					 return false;
				}
		    	
			    /* 주문번호 공백일시 */
				 if(orderNum==""){
					 $(".error_orderName").css("display","none");
					 $(".error_orderNum").css("display","block");
					 return false;
				}
			    
				/* 일치하는지 확인 */
					$.ajax({
						type:"POST",
						url:"loginByOrderId",
						data:data,
						success:function(data){
						console.log(data);
						if(data == "fail") {
								$(".error_msg").html("주문자명과 주문번호가 일치하지 않습니다").css("display","block");
								$(".error_orderName").css("display","none");
								$(".error_orderNum").css("display","none");
							}else {
								location.href="/loginByOrderIdOK"
							}
						}
					});

		 });
		
	});
</script>
</head>
<body>
	<h2>로그인</h2>
			<a href="/login" style="color:#b3b3b3">기존 회원</a> 
	     	<a href="loginByOrderId">비회원 주문조회</a>
	<form id="login_order_form" action="loginByOrderId" method="post">
	<!-- <input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }"> -->
	<div class="ordername_wrap">
	<input type="text" name="orderName" id="orderName" placeholder="주문자명"><br>
	</div>
	<div class="ordernum_wrap">
	<input type="text" name="orderNum" id="orderNum" placeholder="주문번호"><br>
	</div> 
	<div class="error_orderName" style="display: none" >주문자명을 입력해주세요. </div>
	<div class="error_orderNum" style="display: none">주문번호를 입력해주세요. </div>
	<span class="error_msg" style="display:none"></span>
	<input id="loginOrderBtn" type="button" value="비회원 주문조회">
		<div>
	     	<p>계정이 없으신가요?</p> 	
	       <a href="/join">회원가입</a>
       </div>
</form>
</body>
</html>