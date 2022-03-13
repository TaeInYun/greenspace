<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/writeForm.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/js/attrzone.js"></script>
</head>
<body>
<div id="container">	
<div>
	<div id="wirte_title">
	<h2>리뷰 작성</h2>
	</div>
	<div id="writeForm_box">
	<form action="insertReview" method="post"
			enctype="multipart/form-data">		
		<!--  리뷰번호:
		<input type="hidden" name="no"> <br> -->
		<!--상품번호:  --> <input type="hidden" name="pro_no" value="${pro_no} "> 
		<!--작성자:  -->	<input type="hidden" name="member_no" value="${m.no}">
		<table id="writeForm_box_table">
		<tr>		
				<th scope="row">제목</th>
				<td>
					<div class="inputArea">
						<input type="text" name="re_title"><br>
					</div>	
				</td>	
			</tr>
			
		<tr>		
				<th scope="row">평점</th>
				<td>
					<div class="inputArea">
						<input type="text" name="re_rate"><br>
					</div>	
				</td>	
			</tr>
		
		
	     <!--  <input type="text" name="re_content"> <br> -->	
	     
	     <tr>
				<th scope="row">내용</th>
				<td>
					<div class="inputArea">
						<textarea rows="10" cols="80" name="re_content"></textarea>		
					</div>
				</td>
		</tr>
		
		
		
		<tr>
				<th scope="row">사진</th>		
				<td>
					<input type="file" name="uploadFile">
					<div id='att_zone' style="" data-placeholder='파일을 첨부 하려면 파일 선택 버튼을 클릭하세요'></div>
				</td>
			</tr>
		
	
		
		</table>
		<div id="write_btn"> 
		<button type="submit">등록</button>
		<button type="button" onclick="history.go(-1);" >취소</button>		
		<!-- <input type="submit" value="등록">
		<input type="reset" value="취소"> -->
		</div>
	</form>
	</div>
	</div>
</div>
</body>
</html>