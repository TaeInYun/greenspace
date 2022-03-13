<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c"  uri="http://java.sun.com/jsp/jstl/core"%>
    
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/writeForm.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/js/attrzone.js"></script>
<script type="text/javascript">
$(function(){
})
</script>
<meta charset="UTF-8">
<title>녹지공간-자유 게시판</title>
</head>
<body>
<div id="container">
	<div>
	<div id="wirte_title">
	<h2>자유게시판 작성</h2>
	</div>	
	
		<div id="writeForm_box">
			<form action="insertCommunity" method="post" enctype="multipart/form-data">	
			<input type="hidden" name="member_no" value="${m.no }" >
			<table id="writeForm_box_table">
			<tr>		
				<th scope="row">제목</th>
				<td>
					<div class="inputArea">
						<input type="text" name="commu_title"><br>
					</div>	
				</td>	
			</tr>

			<tr>
				<th scope="row">내용</th>
				<td>
					<div class="inputArea">
						<textarea rows="10" cols="60" name="commu_content"></textarea>		
					</div>
				</td>
			</tr>
				
			<tr>
				<th scope="row">사진</th>		
				<td>
					<input type='file' id='btnAtt' name="files" multiple='multiple'/>
					<div id='att_zone' style="" data-placeholder='파일을 첨부 하려면 파일 선택 버튼을 클릭하세요'></div>
				</td>
			</tr>	
			</table>
			
			<div id="write_btn">  
			<button type="submit">등록</button>
			<button type="button" onclick="history.go(-1);" >취소</button>	
			</div>
			</form>
		</div>
	</div>	
</div>
</body>
</html>