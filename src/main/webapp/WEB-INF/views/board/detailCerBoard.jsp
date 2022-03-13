<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/board.css">
<link rel="stylesheet" href="/css/components/search.css">
<style type="text/css">

</style>
<meta charset="UTF-8">
<title>녹지공간-인증 게시판</title> 
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
 $(function(){
		$( $(".nav-btn")[1] ).attr("style", "background: #00913A;");
		$( $(".nav-btn .nav-btn__text")[1] ).attr("style", "color:white");
	 
	 
		 $("#insertComments").click(function () {		 
			 let cer_no = $("#cer_no").val();			 
			 let member_no = $("#member_no").val();
			 let com_content = $("#com_content").val();
				 
			 let data={
				 com_content:com_content,
				 cer_no:cer_no,
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
				<!-- 본문 -->			
				<section id="content">
				
				<div id="communityHeader">
				<jsp:include page="./communityHeader.jsp"/>
				</div>
				
				<div id="commu_box">
				
					<div id="search_form">
						<form action="/board/listCommunity" method="post">
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

	 	<table id="detail_board_table">
		 <tr>
			<td>
				<span>LV ${c.levels} ${c.nickname}</span>
			</td>
		</tr>	
		
		<tr>
			<td>
				
				<span>좋아요${c.cer_like}</span>
				<span> | </span>
				<span>조회수 ${c.cer_hit}</span>
				<span> | </span>				
				<span>${c.cer_status}</span>	
				<span> | </span>	
				<span><fmt:formatDate value="${c.cer_date}" pattern="yy.MM.dd"/></span>
						
			</td>
		</tr>

		<tr>
		<td>
		<div id="chgTable_box">
			<table id="chgTable">

				
				<thead>
				<tr>
					<td >완료한 챌린지 목록</td>
				</tr>
				</thead>	
				
				<tbody>
				<tr>
					<c:if test="${c.chg_title1 ne null }">
					<td>${c.chg_title1 }</td>
					</c:if>
					<c:if test="${c.chg_title2 ne null }">
					<tr>
					<td>${c.chg_title2 }</td>
					</tr>
					</c:if>
					<c:if test="${c.chg_title3 ne null }">
					<tr>
					<td>${c.chg_title3 }</td>
					</tr>
					</c:if>
				</tr>	
				</tbody>	
			</table>
		</div>
		
			<div id="board_content">
			<p>${c.cer_content}</p>
			
		
		 <c:if test="${c.cer_thumbnail ne null }">
		<div class="cer_thumbnail">
		<img  src="/upload/cer/${c.cer_thumbnail }" width="400" height="400">
		</div> 
		</c:if>	
		
		<div class="result-images">
		<!-- 업로드한 파일들을 forEach문을 이용해 <img> 태그에 표시 -->
		<c:forEach var="list" items="${imglist}" >
			<img src="../upload/cer/${list.save_img_name}" width="500px" height="100%">
	        <br><br><br>
	    </c:forEach>         
	</div>
	</div>
	</td>	
	</tr>
</table>


	<div id="board_btn">
		<!--<c:if test="${m.nickname == c.nickname}"></c:if>-->
		<a href="/board/updateCerBoard?no=${c.no }"><button>글수정</button></a>
		<a href="/board/deleteCerBoard?no=${c.no }"><button>글삭제</button></a>
		<a href="/board/listCerBoard"><button>글목록</button></a>		
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
					</tr>	 
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