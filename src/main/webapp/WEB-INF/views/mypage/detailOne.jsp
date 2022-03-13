<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script> 
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/style.css">
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
   font-size:35px;
   background-color:white;
  }
  
 #com_content{
 	text-align: left; 	 
 	width: 300px;
 }
</style>
<script type="text/javascript">
$(function(){
	 $("#insertComments").click(function () {		 
		 let one_no = $("#one_no").val();
		 let member_no = $("#member_no").val();
		 let com_content = $("#com_content").val();
			 
		 let data={
			 com_content:com_content,
			 one_no:one_no,			
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
<div id="stay">		
<section id="content">			
	<h1 id="here">1대1문의 상세</h1>
	 
	  문의유형:${od.one_type_name} <br>  <!-- 새로운 dao를 컨트롤러에 불러와야할듯? -->
	 <%-- 문의유형코드:${od.one_type_code}<br> --%> <!--안보여줘도 될듯  -->
	  1대1문의 제목:${od.one_title}<br>
	  주문번호:${od.ord_no}<br>
	  내용:${od.one_content} <br>
	  작성일:${od.one_date} <br>	
	  처리상태:${od.qna_type_name} <br>	  <!-- 새로운 dao를 컨트롤러에 불러와야할듯? -->
	  <%-- 처리상태코드:${od.qna_status_code} <br> --%> <!--안보여줘도 될듯  -->
	
 
	   <a href="/board/updateOne?no=${od.no}"><button>수정하기</button></a>  
	   <a href="/board/deleteOne?no=${od.no}"><button>삭제하기</button></a>  
		   
	   
<!-- ----댓글------ -->
	<div>		 
	  	<input id="one_no" type="hidden" value="${od.no}">
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
	</section>
</div>
</body>
</html>