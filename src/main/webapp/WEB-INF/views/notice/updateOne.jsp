<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/writeForm.css">
<meta charset="UTF-8">
<title>녹지공간-문의사항</title>

<style type="text/css">
#changeTest{
	width: 100px;
	padding:5px;
	border-radius: 20px;
}
</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
 
 $(function(){
	 
	 $( $(".nav-btn")[1] ).attr("style", "background: #00913A;");
		$( $(".nav-btn .nav-btn__text")[1] ).attr("style", "color:white");
		
	$("#changeTest") .change(function(){
		let n = $(this).val();
		$("#one_type_code").val(n);
	})
 });
</script>

</head>
<body>
<div id="root">
<div id="container">
	<div>
	<div id="wirte_title">
	<h2>1대1문의 수정</h2>
	</div>	
	
	<div id="writeForm_box">
	<form action="updateOne" method="post"
			enctype="multipart/form-data">
	
	<input type="hidden" name="no" value="${o.no }">
	<input type="hidden" name="member_no" value="${m.no }" > <!-- hidden -->
	
	<!-- 상품문의유형: -->
	<input type="hidden" name="one_type_code" id="one_type_code" value="${o.one_type_code}">
	
	<table id="writeForm_box_table">
	<tr>		
		<th scope="row">제목</th>
		<td>
			<div class="inputArea">
				<input type="text" name="one_title" value="${o.one_title }"> <br>
			</div>	
		</td>	
	</tr>
	
	<tr>
		<th scope="row">문의 유형</th>
			<td>
			<select id="changeTest" >
			 	<option value="EXC">교환</option>
			  	<option value="REF">환불</option>
			  	<option value="CAN">취소</option>
			  	<option value="ETC">기타</option>
			</select> 
		</td>	
	</tr>
	
	
	<tr>		
		<th scope="row">비밀번호</th>
		<td>
			<div class="inputArea">
				 <input type="password" name="one_pwd" > <br> 	
			</div>	
		</td>	
	</tr>
						
	<tr>
		<th scope="row">내용</th>
		<td>
			<div class="inputArea">
			<textarea rows="10" cols="60" name="one_content">${o.one_content }</textarea>		
			</div>	
		</td>	
	</tr>				
	</table>
		  <div id="write_btn">  
			<button type="submit">수정</button>
			<button type="button" onclick="history.go(-1);" >취소</button>
		</div>
	</form>
	</div>
</div>
</div>	
</div>
</body>
</html>