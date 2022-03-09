<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>Insert title here</title>
	<link href="/css/easytostart.css" rel="stylesheet"/> 
	<link rel="stylesheet" href="/css/style.css">
	<link rel="stylesheet" href="/js/jquery-ui/jquery-ui.css">
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	 <script type="text/javascript">
	 $(function(){
			 $("#insertComments").click(function () {		 
				 let ets_no = $("#ets_no").val();
				 let member_no = $("#member_no").val();
				 let com_content = $("#com_content").val();
					 
				 let data={
					 com_content:com_content,
					 ets_no:ets_no,			
					 member_no:member_no				 
				 }		 
				 
				 $.ajax({
		         	url : "/insertComments",
		             type : "POST",
		             data :data,
		             success : function(result){
		            	 $("#com_content").val("")
		             },
		             error : function(){
		             	console.log("ajax 통신 실패");
		             }
		         });
			})
			 
	 })
	 </script>
	
</head>
<body>

	<header id="header">
		<div id="header_box">
			<div id="header1_box">
				<jsp:include page="../header.jsp"/>
			</div>
		</div>
	</header>
		
	<h2>게시물 상세</h2>
	<hr>
	글번호 : ${n.no }<br>
	글제목 : ${n.ets_title}<br>
	글내용 : <br>
	
	<textarea rows="10" cols="80" readonly="readonly">${n.ets_content}</textarea><br>
		조회수 : ${n.ets_hit }<br>
	<a href="updateBoard?no=${n.no }">수정</a>
	<a href="deleteBoard?no=${n.no }">삭제</a>
	
	
	
<!-- ----댓글------ -->
	<div>		 
	  	<input id="ets_no" type="hidden" value="${n.no}">
		<input id="member_no" type="hidden" value="${m.no}">		
		<input id="com_content" type="text" placeholder="댓글을 입력해 주세요">		   
	 	<button id="insertComments">댓글작성</button>	
	</div>
	<hr>	
	<div>		 
		<c:forEach var="comments" items="${comments}"> 
		 <table>
				 <tbody>
					<tr> 
						<td>${comments.nickname}</td>
						<td id="com_content">${comments.com_content}</td>
					<tr>	 
				</tbody>
			</table>
	  	</c:forEach>
	</div>
	
	
	
</body>
</html>