<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">

</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
<script type="text/javascript">
$(function(){
	 $("#store_sub").hide();		  
	 $("#store").click(function() {
	        $('#store_sub').slideToggle('slow', function() {
	         });
	 });
});

$(function(){
	 $("#board_sub").hide();		  
	 $("#board").click(function() {
	        $('#board_sub').slideToggle('slow', function() {
	         });
	 });
});

$(function(){
	 $("#member_sub").hide();		  
	 $("#member").click(function() {
	        $('#member_sub').slideToggle('slow', function() {
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
			<li id="member">회원관리</li>
			<div>
					<ul id="member_sub">
						<li style="font-size: 10px"><a href="#">회원관리</a><br></li>
						<li style="font-size: 10px"><a href="/admin/listReview">리뷰관리</a><br></li>
					</ul>
			</div>
			
			<li><a href="">포인트관리</a></li>
			<li id="board">게시판관리</li>
			<div>
				<ul id="board_sub">
						<li style="font-size: 10px"><a href="/admin/listSearchQna">상품문의</a><br></li>
						<li style="font-size: 10px"><a href="/admin/listOne">1대1문의</a><br></li>
						<li style="font-size: 10px"><a href="#">공지사항</a><br></li>
						<li style="font-size: 10px"><a href="#">커뮤니티</a><br></li>
						
					</ul>
			</div>
			
			<li><a href="/admin/listChg">챌린지관리</a></li>
			 
				
		 
	</ul>
</body>
</html>