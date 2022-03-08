<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
<script type="text/javascript">
$(function(){
	 $("#store_sub").hide();		  
	 $("#store").click(function() {
	        $('#store_sub').slideToggle('slow', function() {
	         });
	 });
});
</script>
</head>
<body>
	<h3>관리자설정</h3>
	<ul id="admin">
			 
			<li><a href="">주문관리</a></li>
			<li id="store">상품관리</li>
			<div>
					<ul id="store_sub">
						<li style="font-size: 10px"><a href="/admin/insertProduct">상품등록</a><br></li>
						<li style="font-size: 10px"><a href="/admin/listProduct">상품수정</a><br></li>
					</ul>
			</div>
			<li><a href="">회원관리</a></li>
			<li><a href="">포인트관리</a></li>
			<li><a href="">게시판관리</a></li>
			<li><a href="">챌린지관리</a></li>
			 
				
		 
	</ul>
</body>
</html>