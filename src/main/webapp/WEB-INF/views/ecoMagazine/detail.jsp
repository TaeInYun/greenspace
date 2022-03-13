<%@ page language="java" contentType="text/html; charset=UTF-8"
		 pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/board.css">
<link rel="stylesheet" href="/css/components/search.css">


<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script> 
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> 
<script type="text/javascript">

	 $(function(){
			 $("#insertComments").click(function () {		 
				 let ets_no = $("#eco_no").val();
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
	<div id="root">
		<header id="header">
			<div id="header_box">
				<jsp:include page="../header.jsp"  flush="false" />
			</div>
		</header>
		
		<section id="container">		
			<div id="container_box"> 		
				<section id="content">
					<div id="ecoMagazineHeader">
						<jsp:include page="./ecoMagazineHeader.jsp"/>
					</div>
					<div id="commu_box">
						<div id="search_form">
							<form action="listBoard" method="post">
								<div class="searchColumn_wrap">
									<select name="searchColumn" id="searchColumn">
										<option value="commu_title">제목</option>
										<option value="commu_content">본문</option>
										<option value="nickname">작성자</option>
									</select>
								</div>		
								<div class="search_keyword_form">
									 <input class="keyword" type="text" name="keyword"  placeholder="검색어 입력">
									  <img id="icon" src="https://s3.ap-northeast-2.amazonaws.com/cdn.wecode.co.kr/icon/search.png">
								</div>
							</form>
						</div>
					</div>
					
					<!--  -->
					<table id="detail_board_table">
						<colgroup> 
							<col width="80%">
							<col width="20%">
						</colgroup>
						<thead>
							<tr>
								<th><span>${e.eco_title}</span></th>
								<th><span>${e.eco_hit }</span></th>
							</tr>				
						</thead>
							<tr>
								<td colspan="2">
									<div id="board_content">
										<p>${e.eco_content }</p>
									</div>
								</td>
							</tr>
					</table>
					<div id="board_btn">		
						<c:if test="${m.nickname == c.nickname}">
							<a href="updateBoard?no=${n.no }"><button>글수정</button></a>
							<a href="deleteBoard?no=${n.no }"><button>글삭제</button></a>
						</c:if>
						<a href="/notice/listNotice"><button>글목록</button></a>	
					</div>
					
					<!-- ----댓글------ -->
					
					<div id="comment_box">
	  					<input id="cer_no" type="hidden" value="${c.no}">
						<input id="member_no" type="hidden" value="${m.no}">		
						<textarea class="form-control" id="com_content" rows="3" id="commentContent" placeholder="댓글을 입력하세요."></textarea> 
	 					<button id="insertComments">댓글작성</button>	
					</div>

					<div id="comment_list">			 
						<c:forEach var="comments" items="${comments}"> 
						 <table>
						 	<tbody>
								<tr> 
									<td id="${comments.member_no}">${comments.nickname}</td>
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
		</section>	
	</div>

	
	
</body>
</html>