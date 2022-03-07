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
		$("#one_type_code").val(n);
	})
 });
</script>

</head>
<body>


	<h2>1대1문의 작성</h2>
	<form action="insertOne" method="post"
			enctype="multipart/form-data">		
													  

		1대1제목: <input type="text" name="one_title"> <br>		
		내용: <input type="text" name="one_content"> <br>					
		비밀번호: <input type="password" name="one_pwd"> <br> 		
		<!-- 작성일:	<input type="text" name="one_date" > <br> -->
		<!-- 주문번호:	<input type="text" name="pro_no" value=null > <br> --><!-- 어떻게 연동시킬것인가  -->
		<!-- 회원번호:-->	
		<input type="hidden" name="member_no" value="${m.no }" > <br> <!-- hidden -->
		
			
		<select id="changeTest" >
		  <option value="EXC">교환</option>
		  <option value="REF">환불</option>
		  <option value="CAN">취소</option>
		  <option value="ETC">기타</option>
		</select> <br>  
		상품문의유형:	<input type="text" name="one_type_code" id="one_type_code"> <br>		
		문의상태:	<input type="text" name="qna_status_code" value="WA" > <br>  <!--wa 답변대기 EXC교환  -->
		
		
		<input type="submit" value="등록">
		<input type="reset" value="취소">
	</form>
</body>
</html>