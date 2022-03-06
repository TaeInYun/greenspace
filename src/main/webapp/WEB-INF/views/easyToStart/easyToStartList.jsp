<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
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
	            <td> 
	            	<div onclick="updateLike()">
	            		♡♥ ${e.ets_like}
	            	</div>
	           		
	            </td>
	        </tr>
    	</c:forEach>
	</table>

	<c:forEach var="i" begin="1" end="${totalPage }">
	    <a href="easyToStartList?pageNUM=${i }">${i }</a>&nbsp;&nbsp;
	</c:forEach>
	
	
	
	<script type="text/javascript">
		function updateLike() {
			alert('클릭이벤트 발생');
		}
		
	</script>
	
</body>
</html>
