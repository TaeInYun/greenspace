<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/writeForm.css">
    <meta charset="UTF-8">
    <title>녹지공간-공지사항</title>
</head>
<body>
<div id="root">
<div id="container">
	<div>
	<div id="wirte_title">
	<h2>공지사항 작성</h2>
	</div>	
	
    <div id="writeForm_box">
    <form action="insertNotice" method="post" enctype="multipart/form-data">
    
    <table id="writeForm_box_table">
			<tr>		
				<th scope="row">제목</th>
				<td>
					<div class="inputArea">
						<input type="text" name="notice_title"><br>
					</div>	
				</td>	
			</tr>

			<tr>
				<th scope="row">내용</th>
				<td>
					<div class="inputArea">
						<textarea rows="10" cols="60" name="notice_content"></textarea>		
					</div>
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
</div>

</body>
</html>
