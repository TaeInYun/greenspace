<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="https://code.jquery.com/jquery-3.6.0.js" integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk=" crossorigin="anonymous"></script>
    <script type="text/javascript">
	    $(document).ready(function(){	
	    	//만약 하트를 클릭? + 해당 게시판의 하트 좋아요 +1을 해주세요
	    	//클라이언트가 클릭 - 서버로 controller에 있는 좋아요 +1 해주기 
	    	$('.addlike').click(function(){
	    		var likeDiv = $(this)
	    		var no = likeDiv.siblings(".ets-no").val()
	    		
	    		$.ajax({
	      		  method: "GET",
	      		  url: "/easyToStart/like/" + no,
	      		}).done(function( likeCount ) {
	      			likeDiv.children(".like-count").text(likeCount)
	  	   		});
	    	});
	    });
    
	</script>
	
</head>
<body>
    <h3>EasyToStart</h3>
    <hr>
    
	<br><a href="#">전체</a> &nbsp
	<a href="">일상생활</a> &nbsp
	<a href="">욕실</a>&nbsp
	<a href="">주방</a>&nbsp
	<a href="">분리수거</a>&nbsp
	
	<hr>
	
    <br><a href="insertNotice">  글 등록  </a><br>

	<table border="1" width="80%">
	    <tr>
	        <td>썸네일</td>
	        <td>제목</td>
	        <td>좋아요</td>
	    </tr>
    	<c:forEach var="e" items="${easyToStart }">
	        <tr>
	            <td>${e.ets_thumbnail}</td>
	            <td>${e.ets_title }</td>
	            <td style="user-select: none"> 
	            	<input type="hidden" class="ets-no" value="${e.no}">
	            	<c:set var="h" scope="session" value="0"/>
	            	<c:choose >
	            		<c:when test="${h == 0}">
		            		<div class="addlike">
		            			♡ <span class="like-count">${e.ets_like}</span>
		            		</div>
	            		</c:when>
	            		<c:otherwise>
	            			<div class="addlike">
            					♥ <span class="like-count">${e.ets_like}</span>
	            			</div>
	            		</c:otherwise>
	            	</c:choose>
	            	
	           		
	            </td>
	        </tr>
    	</c:forEach>
	</table>

	<c:forEach var="i" begin="1" end="${totalPage }">
	    <a href="easyToStartList?pageNUM=${i }">${i }</a>&nbsp;&nbsp;
	</c:forEach>
	
	
	

	
</body>
</html>
