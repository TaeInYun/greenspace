<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/writeForm.css">
<style type="text/css">
.content{
width: 200px;
white-space: normal;
display: -webkit-box;
-webkit-line-clamp:3;
-webkit-box-orient:vertical;
overflow:hidden;
}

ul, li { margin:0; padding:0; list-style:none; } 

div#root { width:100%; margin:0 auto; }		 
section#content ul li { display:inline-block; margin:10px; }

table {
    	width: 100%;
    	border-top: 1px solid #444444;
    	border-collapse: collapse;
  }
  th, td {
	    border-bottom: 1px solid #444444;
	    padding: 10px;
	    
  }
  
  #here{
   font-size:50px;
  }
  
  #stay{
   position: absolute;
  /*  left:10%; */
   font-size:30px;
   background-color: white;
  }
  
 #com_content{
 	text-align: left; 	 
 	width: 300px;
 }
</style>
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

<div id="root">
<div id="container">
<div>		
	<div id="wirte_title">
	<h2 id="here">1대1상품문의수정</h2>
	</div>
	
	<div id="writeForm_box">
	<form action="updateProQna" method="post"
			enctype="multipart/form-data">		
													  
		<input type="hidden" name="no" value="${q.no}">  <br> <!-- hidden -->
		<!-- 상품문의유형: -->	<input type="hidden" name="pro_qna_type_code" id="pro_qna_type_code" value="QSZ"> <br>		
		<!-- 문의상태: -->	<input type="hidden" name="qna_status_code" value="WA" > <br>
		<input type="hidden" name="member_no" value="${m.no }"> <br> <!-- hidden -->
		<table id="writeForm_box_table">
		
		<tr>		
		<th scope="row">1대1상품문의제목</th>
		<td>
			<div class="inputArea">
				<input type="text" name="pro_qna_title" value="${q.title }"> <br>
			</div>	
		</td>	
	</tr>
	
	
	
	<tr>		
		<th scope="row">비밀번호</th>
		<td>
			<div class="inputArea">
				<input type="password" name="pro_qna_pwd" > <br>
			</div>	
		</td>	
	</tr>
							
	<tr>		
		<th scope="row">상품번호</th>
		<td>
			<div class="inputArea">
				<input type="hidden" name="pro_no" value="${q.pro_no }"> <br>
			</div>	
		</td>	
	</tr>		
	
	<tr>		
		<th scope="row">상품문의유형</th>
		<td>
			<!-- QSZ사이즈 QDE배송관련 QRE재입고 QDT상품상세  -->		
			<select id="changeTest" >
		  		<option value="QSZ">사이즈</option>
		  		<option value="QDE">배송관련</option>
		  		<option value="QRE">재입고</option>
		  		<option value="QDT">상품상세</option>
			</select>	
		</td>	
	</tr>
			
		<!-- 작성일:	<input type="text" name="pro_qna_date" > <br> -->
		
		<!-- 회원번호:-->	
	<tr>		
		<th scope="row">내용</th>
		<td>
			<div class="inputArea">
				<textarea rows="10" cols="60" name="pro_qna_content">${q.content }</textarea>				
			</div>	
		</td>	
	</tr>
		
		 		
		
		</table>
		
		<div id="write_btn">  
			<button type="submit">수정</button>
			<button type="button" onclick="history.go(-1);" >취소</button>
			<!-- <input type="submit" value="수정하기">
			<input type="reset" value="취소"> -->
		</div>
		
		
	</form>
			</div>
		</div>
	</div>
</div>
</body>
</html>