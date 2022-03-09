<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
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
  
 #com_content{
 	text-align: left; 	 
 	width: 300px;
 }
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script> 
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
 <script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <script type="text/javascript">
 $(function(){
		 $("#insertComments").click(function () {		 
			 let commu_no = $("#commu_no").val();
			 let member_no = $("#member_no").val();
			 let com_content = $("#com_content").val();
				 
			 let data={
				 com_content:com_content,
				 commu_no:commu_no,				
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
	<div id="header">
		<jsp:include page="../header.jsp"/>
	</div>
	
<section id="content">
	<ul>
	 <li>
		<div class="title">
		<span>${c.commu_title}</span>
		</div>		 
		<div class="nickname">
		<span>LV ${m.levels} ${c.nickname}</span>
		</div>
		<div class="date">
		<span><fmt:formatDate value="${c.commu_date}" pattern="yy.MM.dd"/></span>
		</div>
		<div class="hit">
		<span>조회수  ${c.commu_hit}</span>
		</div>		
		<div class="content">
		<span>${c.commu_content}</span>
		</div>	
	<div class="result-images">
		<!-- 업로드한 파일들을 forEach문을 이용해 <img> 태그에 표시 -->
		<c:forEach var="list" items="${imglist}" >
			<img src="../upload/commu/${list.save_img_name}">
	        <br><br><br>
	    </c:forEach>         
	</div>
		</li>
 	</ul>					 
</section>	
<!--<c:if test="${m.nickname == c.nickname}"></c:if>-->
<a href="/board/updateCommunity?no=${c.no }">글수정</a>
<a href="/board/deleteCommunity?no=${c.no }">글삭제</a>

<a href="/board/listCommunity">글목록</a>

<!-- ----댓글------ -->
<hr>
	<div>		 
	  	<input id="commu_no" type="hidden" value="${c.no}">
		<input id="member_no" type="hidden" value="${m.no}">		
		<textarea class="form-control" id="com_content" rows="3" id="commentContent" placeholder="댓글을 입력하세요."></textarea> 
	 	<button id="insertComments">댓글작성</button>	
	</div>
<hr>	
	<div>		 
		<c:forEach var="comments" items="${comments}"> 
		 <table>
				 <tbody>
					<tr> 
						<td>${comments.nickname}</td>
						<td>${comments.com_regdate}</td>
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