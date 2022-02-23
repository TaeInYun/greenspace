<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script> 
<script type="text/javascript">
	var message = '${msg}'; 
	var returnUrl = '${url}'; 
	alert(mag); 
	document.location.href = url; 
</script>
</head>
<body>
	<h2>챌린지 추가</h2>
	<form action="insertChg" method="post">
		
		<div class="inputArea">
			<label for="chg_title">제목</label>
			<input type="text" name="chg_title" />
		</div>	
		
		<div class="inputArea">
			<label for="chg_content">챌린지 내용</label>
			<textarea rows="10" cols="80" name="chg_content"></textarea>
		</div>
		
		<div class="inputArea">
			<label for="chg_tree">나무수</label>
			<input type="number" name="chg_tree" />
		</div>
		
		<input type="submit" value="추가">
	</form>
</body>
</html>