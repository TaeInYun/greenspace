<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script> 
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
$(function(){
	 $("#insertComments").click(function () {		 
		 let pro_qna_no = $("#pro_qna_no").val();
		 let member_no = $("#member_no").val();
		 let com_content = $("#com_content").val();
			 
		 let data={
			 com_content:com_content,
			 pro_qna_no:pro_qna_no,			
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
	<h2>상품문의</h2>
	 <hr>
	 상품이름:${qd.pro_name}<br>
	 문의유형:${qd.qna_type}<br>
	 제목:${qd.title} <br>
	 내용:${qd.content} <br>
	 글쓴이:${qd.nickname} <br>
	 작성일:${qd.day} <br>
	 처리상태:${qd.status} <br>
	 상품번호:${qd.pro_no }<br>
	
	 
	   <a href="/shop/updateProQna?no=${qd.no}"><button>수정하기</button></a>  
	   <a href="/shop/deleteProQna?no=${qd.no}"><button>삭제하기</button></a>  

<!-- ----댓글------ -->
	<div>		 
	  	<input id="pro_qna_no" type="hidden" value="${qd.no}">
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