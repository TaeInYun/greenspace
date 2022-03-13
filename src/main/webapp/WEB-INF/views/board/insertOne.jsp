<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>녹지공간-문의사항</title>
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/writeForm.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style type="text/css">
#changeTest{
	width: 100px;
	padding:5px;
	border-radius: 20px;
}
</style>
<script type="text/javascript">
 
 $(function(){
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
		<h2>1대1문의 작성</h2>
	</div>	
	
	
    <div id="writeForm_box">
	<form action="insertOne" method="post" enctype="multipart/form-data">		
	<!-- 작성일:	<input type="text" name="one_date" > <br> -->
		<!-- 주문번호:	<input type="text" name="pro_no" value=null > <br> --><!-- 어떻게 연동시킬것인가  -->
		<!-- 회원번호:-->	
		<input type="hidden" name="member_no" value="${m.no }" > <!-- hidden -->
		<input type="hidden" name="one_type_code" id="one_type_code"> 
 		<input type="hidden" name="qna_status_code" value="WA" ><!--wa 답변대기 EXC교환  -->
		
    													  
	    <table id="writeForm_box_table">
			<tr>		
				<th scope="row">제목</th>
				<td>
					<div class="inputArea">
						<input type="text" name="one_title"> <br>
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
				<input type="password" name="one_pwd"> <br> 		
				</div>
				</td>
			</tr>
			
			<tr>
			<th scope="row">내용</th>
				<td>
				<div class="inputArea">
				<textarea rows="10" cols="60" name="one_content"></textarea>					
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