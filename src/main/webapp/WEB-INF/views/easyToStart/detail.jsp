<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link href="/css/easytostart.css" rel="stylesheet"/> 
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/js/jquery-ui/jquery-ui.css">

<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script> 
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
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
		<textarea class="form-control" id="com_content" rows="3" placeholder="댓글을 입력하세요."></textarea>	   
	 	<button id="insertComments">댓글작성</button>	
	</div>
	<hr>	
	<div>		 
		<c:forEach var="comments" items="${comments}"> 		 
		 <table>
		  		<tbody>
					<tr> 
						<td id="${comments.member_no}">${comments.nickname}</td>
						<td >${comments.com_regdate}</td>
						<td id="com_content">${comments.com_content}</td>						 
						<td><a id="updateComments"  data-toggle="modal" data-target="#updateModal" role="button"  href="/board/updateComments?no=${comments.no}&member_no=${m.no}&com_content=${comments.com_content}">수정</a></td>
						<td><a id="deleteComments"  data-toggle="modal" data-target="#deleteModal" role="button"  href="/board/deleteComments?no=${comments.no}&member_no=${m.no}">삭제</a></td>
					 
					 <tr>	 
				</tbody>
			</table>
		</c:forEach>
		
		
		<div id="deleteModal" class="modal fade" tabindex="-1" role="dialog"> 
			<div class="modal-dialog"> 
				<div class="modal-content"> 
				</div> 
			</div> 
	    </div>	
	    
	    <div id="updateModal" class="modal fade" tabindex="-1" role="dialog"> 
			<div class="modal-dialog"> 
				<div class="modal-content"> 
				</div> 
			</div> 
	    </div>	
		
		
	</div>
	
	
	
</body>
</html>