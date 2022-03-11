<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Eco Magazine</title> 
	<link rel="stylesheet" href="/css/style.css">
	<link rel="stylesheet" href="/js/jquery-ui/jquery-ui.css">
	<style type="text/css">
       .yes_select{
          display: none;
          visibility: hidden;
       }
       
       #ecoMagazineHeader{
		display: flex; 
		justify-content:center;	
		margin: 30px 0 30px 0;
		}
       
    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script src="https://kit.fontawesome.com/5b334c6c49.js" crossorigin="anonymous"></script>
    <script type="text/javascript">  
	    $(function(){
	    	$( $(".nav-btn")[0] ).attr("style", "background: #00913A;");
	    	$( $(".nav-btn .nav-btn__text")[0] ).attr("style", "color:white");
	    })
	    
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
		<header id="header">
			<div id="header_box">
				<div id="header1_box">
					<jsp:include page="../header.jsp"/>
					<link href="/css/ecoMagazine.css" rel="stylesheet"/> 
				</div>
			</div>
		</header>		 
		
		<div id="ecoMagazineHeader">
			<jsp:include page="./ecoMagazineHeader.jsp"/>
		</div>
		<div class="boardList"> 	
			<ul class ="ECO_UL">
				<c:forEach var="e" items="${ecoMagazine }">
				<li>
				<div class = boardpadding>
					<div class="ECO_THUMBNAIL">
						<a href="detail?no=${e.no}">
							<img src="/upload/board/${e.eco_thumbnail}" width="200" height="200">
						</a>
					</div>  
				</div>
				<div class = boardpadding>
					<div class="ECO_TITLE">
						<a href="detail?no=${e.no}">${e.eco_title }</a>
					</div>	
				</div>
				<div class = boardpadding>
					<div style="user-select: none">
            					<input type="hidden" class="ets-no" value="${e.no}">   
              				 	<div class="addlike">
               						<i class="fa-regular fa-heart no_select"></i>   
                  					<i class="fa-solid fa-heart yes_select"></i>
                  					<span class = "count">${e.eco_like}</span>
	                		</div> 
	               </div>		
				</div>
					 
				</li>
			  	</c:forEach>
			 </ul>					 
	</div>
	
</body>
</html>