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
<script type="text/javascript">
 
 $(function(){
	$("#changeTest") .change(function(){
		let n = $(this).val();
		$("#pro_qna_type_code").val(n);
	})
 });
</script>
<!-- <link href="/css/shop.css" rel="stylesheet"/>  -->

</head>
<body>
	
	<div id="container">	
<div>
	<div id="wirte_title">
	<h2>상품 문의 작성</h2>
	</div>

	<div id="writeForm_box">

	<form action="insertProQna" method="post"
			enctype="multipart/form-data">		
		<!-- 상품번호: -->	<input type="hidden" name="pro_no" value="${pro_no }" > 
		<!-- 회원번호:-->	
		<input type="hidden" name="member_no" value="${m.no }" >  <!-- hidden -->
		<!-- 상품문의유형: -->	<input type="hidden" name="pro_qna_type_code" id="pro_qna_type_code" value="QSZ"> <br>
		<!-- 문의상태: -->	<input type="hidden" name="qna_status_code" value="WA" > <br>
		
		<table id="writeForm_box_table">											  
		<!-- 1메인0서브 이건 value사용할듯? 아니면 maininsert insert -->
		
		<tr>		
				<th scope="row">1대1상품문의제목</th>
				<td>
					<div class="inputArea">
						 <input type="text" name="pro_qna_title"><br>
					</div>	
				</td>	
			</tr>
		
		 		
		 <!-- <input type="text" name="pro_qna_content"> --> 
		 <tr>		
				<th scope="row">내용</th>
				<td>
					<div class="inputArea">
						<textarea rows="10" cols="80" name="pro_qna_content"></textarea><br>
					</div>	
				</td>	
			</tr>
		 	
		 <tr>		
				<th scope="row">비밀번호</th>
				<td>
					<div class="inputArea">
						<input type="password" name="pro_qna_pwd"><br>
					</div>	
				</td>	
			</tr>
		
		<tr>		
				<th scope="row">상품문의유형</th>
				<td>
					<div class="inputArea">
						<select id="changeTest" >
		  					<option value="QSZ">사이즈</option>
		 					 <option value="QDE">배송관련</option>
		  					<option value="QRE">재입고</option>
							  <option value="QDT">상품상세</option>
						</select> <br> 
					</div>	
				</td>	
			</tr>				
				
		<!-- 작성일:	<input type="text" name="pro_qna_date" > <br> -->
		
		
		<!-- QSZ사이즈 QDE배송관련 QRE재입고 QDT상품상세  -->		
		 
						
		
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