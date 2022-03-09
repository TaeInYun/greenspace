<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/imginsert.css">
<link rel="stylesheet" href="/css/toggleSwitch.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/js/imginsert.js"></script>
<script type="text/javascript">
$(function(){

})
</script>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>자유게시판 작성</h2>

	<div>
	<form action="insertCommunity" method="post" enctype="multipart/form-data">	
	<input type="hidden" name="member_no" value="${m.no }">
		<div class="inputArea">
			제목<br>
			<input type="text" name="commu_title"><br>		
		</div>		
		<div class="inputArea">
			내용<br>
			<textarea rows="10" cols="60" name="commu_content"></textarea><br>		
		</div>
	<input type='file' id='btnAtt' name="files" multiple='multiple'/>
	<div id='att_zone' 
	      data-placeholder='파일을 첨부 하려면 파일 선택 버튼을 클릭하세요'></div>
		<input type="submit" value="등록">
		<button type="button" onclick="history.go(-1);" >취소</button>
	</form>
	</div>
</body>
</html>