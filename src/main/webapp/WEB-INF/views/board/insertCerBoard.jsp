<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>    
<!DOCTYPE html>
<html>
<head>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="/css/toggleSwitch.css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h2>챌린지 인증 작성</h2>
	<i class="material-icons" style="font-size: 1rem">&#xe001; 하루에 한번만 작성 가능합니다.</i>

		<div class="inputArea">
		비밀글 설정 
		<label class="switch">
		  <input type="checkbox">
		  <span class="slider round"></span>
		</label>
		</div>

	<div>
	<form action="insertCerBoard" method="post" enctype="multipart/form-data">	
	<input type="hidden" name="member_no" value=${m.no }>				
		<div class="inputArea">
			<p></p>
			<table border="1" width="50%">
			<tr>
			<td>완료한 챌린지 목록</td>
			</tr>
			<c:forEach var="c" items="${endlist}">
			<tr>
				<td>${c.chg_title}</td>	
			</tr>
			</c:forEach>
			</table>
		</div>
		
		<div class="inputArea">
		내용<br>
		<textarea rows="10" cols="60" name="chg_content"></textarea><br>		
		사진첨부: <input type="file" name="uploadFile"> <br>
		</div>
		<input type="submit" value="등록">
		<input type="reset" value="취소">
	</form>
	</div>
</body>
</html>