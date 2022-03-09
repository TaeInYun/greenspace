<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>EASY TO START</title> 
	<link rel="stylesheet" href="/css/style.css">
	<link rel="stylesheet" href="/js/jquery-ui/jquery-ui.css">
	 
	<style type="text/css">
       .yes_select{
          display: none;
          visibility: hidden;
       }
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/5b334c6c49.js" crossorigin="anonymous"></script>
    <script type="text/javascript">    
		$(document).ready(function(){
			//addlike을 눌렀을때
        	$('.addlike').click(function(){
           		var likeDiv = $(this)
           		var no = likeDiv.siblings(".ets-no").val()
           		
           		$.ajax({
               		method: "GET",
               		url: "/easyToStart/like/" + no,
             	}).done(function( likeCount ) {
                	likeDiv.children(".count").text(likeCount)
                	$(likeDiv).find(".no_select").css({
                  		 display: "none",
                 		 visibility: "hidden"
                	});
                
                	$(likeDiv).find(".yes_select").css({
                   		display: "inline",
                  		visibility: "visible"
                	});

             	});
        	});
     	});
   </script> 	 
</head>

<body>
	<div id="root">
		<header id="header">
			<div id="header_box">
				<div id="header1_box">
					<jsp:include page="../header.jsp"/>
					<link href="/css/easytostart.css" rel="stylesheet"/>
				</div>
			</div>
		</header>		 
		
		<div class = "boradHeader">
			<div class ="etsTitle">
					<h3>Easy To Start</h3>
			</div>
			<div class = "etsCategory">
				<a href="" class = "ets">전체</a>
		   		<a href="" class = "ets">일상생활</a>
		   		<a href="" class = "ets">욕실</a>
		   		<a href="" class = "ets">주방</a>
		   		<a href="" class = "ets">분리수거</a>
			</div>
		</div>
			

		
		<section id="container">		
			<div id="container_box"> 		
				<section id="content">
					<ul>
						<c:forEach var="e" items="${easyToStart }">
							<li>
								<div class="ETS_THUMBNAIL">
									<a href="detail?no=${e.no}">
										<img src="/upload/board/${e.ets_thumbnail}" width="200" height="200">
									</a>
								</div> 
								  
								<div class="ETS_TITLE">
									<a href="detail?no=${e.no}">${e.ets_title }</a>
								</div>
								
								<div style="user-select: none">
               						<input type="hidden" class="ets-no" value="${e.no}">   
                 				 	<div class="addlike">
                  						<i class="fa-regular fa-heart no_select"></i>   
                     					<i class="fa-solid fa-heart yes_select"></i>
                     					<span class = "count">${e.ets_like}</span>
				                	</div> 
				               </div>		 
							</li>
					  	</c:forEach>
					 </ul>					 
				</section>										
			</div>
		</section>
	</div>
</body>
</html>