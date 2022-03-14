<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/js/jquery-ui/jquery-ui.css">

<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script> 
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<link rel="stylesheet" href="/css/board.css">
<link rel="stylesheet" href="/css/components/search.css">
<link rel="stylesheet" href="/css/style.css">
<script type="text/javascript">
$(function(){
	 $("#insertComments").click(function () {		 
		 let re_no = $("#re_no").val();
		 let member_no = $("#member_no").val();
		 let com_content = $("#com_content").val();
			 
		 let data={
			 com_content:com_content,
			 re_no:re_no,			
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
<div id="root">

	<div>
	
	<!-- <h2>리뷰상세</h2> -->
		
	<div id="board">
	<table id="detail_board_table">
	<colgroup> 
					<col width="80%">
					<col width="20%">
	</colgroup>
	
	<thead>			
				<tr>
					<th><span>${r.re_title }</span></th>
					<td><span>${r.re_date }</span></td>	
				</tr>				
			</thead>
			
	<tr>
				<td colspan="2">
				<span>평점: ${r.re_rate }</span>		
				</td>
	</tr>
	
	<tr>
				<td colspan="2">
				<span>상품번호:${r.pro_no }</span>		
				</td>
	</tr>
	
	<tr>
				<td colspan="2">
				<span>조회수:${r.re_hit }</span>		
				</td>
	</tr>
	
	<tr>
				<td colspan="2">
				<span>좋아요수:${r.re_like }</span>		
				</td>
	</tr>
	
	<tr>
				<td colspan="2">
				<span>회원번호:${r.member_no }</span>		
				</td>
	</tr>
	
	<tr>
				<td colspan="2">
				<span>주문번호:${r.order_no }</span>		
				</td>
	</tr>
	
	<tr>
				<td colspan="2">
						<div id="board_content">
						<p>${r.re_content }</p>
						</div>
					</td>
			</tr>
	
	<tr>
				<td colspan="2">
						<div id="board_content">
						<p><img src="/upload/review/${r.re_thumbnail }" width="100" height="100"></p>
						</div>
					</td>
			</tr>
	
	
	
	
	
	
	
	
	
	</table>
	
	<a href="/shop/updateReview?no=${r.no}"><button >수정하기</button></a>
	<!--  <a href="deleteReview?no=${r.no }">삭제</a>-->
	
</div>
<!-- ----댓글------ -->
	<div>		 
	  	<input id="re_no" type="hidden" value="${r.no}">
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
	</div>
</div>


</body>
</html>