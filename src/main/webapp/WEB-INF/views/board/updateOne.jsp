<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
		$("#one_type_code").val(n);
	})
 });
</script>

</head>
<body>

		
<div id="stay">
<section id="content">
	<h2 id="here">1대1문의수정</h2>
	<form action="updateOne" method="post"
			enctype="multipart/form-data">		
													  
		1대1제목: <input type="text" name="one_title" value="${o.one_title }"> <br>		
		내용: <input type="text" name="one_content" value="${o.one_content }"> <br>					
		비밀번호: <input type="password" name="one_pwd" > <br> 		
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
		상품문의유형:	<input type="text" name="one_type_code" id="one_type_code" value="${o.one_type_code }"> <br>		
		문의상태:	<input type="text" name="qna_status_code" value="WA" > <br>  <!--wa 답변대기 EXC교환  -->
		
		
		<input type="submit" value="수정하기">
		<input type="reset" value="취소">
	</form>
	</section>
	</div>
	
</body>
</html>