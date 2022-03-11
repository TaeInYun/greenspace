<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
 
 $(function(){
	$("#changeTest") .change(function(){
		let n = $(this).val();
		$("#pro_qna_type_code").val(n);
	})
 });
</script>
<!-- <link href="/css/shop.css" rel="stylesheet"/>  -->
<link href="/css/admin.css" rel="stylesheet"/>
<link rel="stylesheet" href="/css/style.css">
</head>
<body>
	
	


	

	<form action="insertProQna" method="post"
			enctype="multipart/form-data">		
													  
		<!-- 1메인0서브 이건 value사용할듯? 아니면 maininsert insert -->
		1대1상품문의제목: <input type="text" name="pro_qna_title"> <br>		
		 <!-- <input type="text" name="pro_qna_content"> --> 	
		내용:<textarea rows="10" cols="80" name="pro_qna_content"></textarea><br>				
		비밀번호: <input type="password" name="pro_qna_pwd"> <br> 		
		<!-- 작성일:	<input type="text" name="pro_qna_date" > <br> -->
		<!-- 상품번호: -->	<input type="hidden" name="pro_no" value="${pro_no }" > 
		<!-- 회원번호:-->	
		<input type="hidden" name="member_no" value="${m.no }" >  <!-- hidden -->
		
		<!-- QSZ사이즈 QDE배송관련 QRE재입고 QDT상품상세  -->		
		<select id="changeTest" >
		  <option value="QSZ">사이즈</option>
		  <option value="QDE">배송관련</option>
		  <option value="QRE">재입고</option>
		  <option value="QDT">상품상세</option>
		</select> <br>  
		<!-- 상품문의유형: -->	<input type="hidden" name="pro_qna_type_code" id="pro_qna_type_code"> <br>		
		<!-- 문의상태: -->	<input type="hidden" name="qna_status_code" value="WA" > <br>
		
		
		<input type="submit" value="등록">
		<input type="reset" value="취소">
	</form>
	
	
</body>
</html>