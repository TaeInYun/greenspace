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

</head>
<body>


	<h2>1대1상품문의작성</h2>
	<form action="insertProQna" method="post"
			enctype="multipart/form-data">		
													  
		<!-- 1메인0서브 이건 value사용할듯? 아니면 maininsert insert -->
		1대1상품문의제목: <input type="text" name="pro_qna_title"> <br>		
		내용: <input type="text" name="pro_qna_content"> <br>					
		비밀번호: <input type="password" name="pro_qna_pwd"> <br> 		
		<!-- 작성일:	<input type="text" name="pro_qna_date" > <br> -->
		상품번호:	<input type="text" name="pro_no" value="${pro_no }" > <br>
		<!-- 회원번호:-->	
		<input type="hidden" name="member_no" value="${m.no }" > <br> <!-- hidden -->
		
		<!-- QSZ사이즈 QDE배송관련 QRE재입고 QDT상품상세  -->		
		<select id="changeTest" >
		  <option value="QSZ">사이즈</option>
		  <option value="QDE">배송관련</option>
		  <option value="QRE">재입고</option>
		  <option value="QDT">상품상세</option>
		</select> <br>  
		상품문의유형:	<input type="text" name="pro_qna_type_code" id="pro_qna_type_code"> <br>		
		문의상태:	<input type="text" name="qna_status_code" value="WA" > <br>
		
		
		<input type="submit" value="등록">
		<input type="reset" value="취소">
	</form>
</body>
</html>