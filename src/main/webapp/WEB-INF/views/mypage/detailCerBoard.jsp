<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/board.css">
<link rel="stylesheet" href="/css/components/search.css">
<link rel="stylesheet" href="/css/comment.css">
<style type="text/css">

#board{
	margin-left: 30px;
}

#detail_board_table{
	margin-top: 0px;
}

</style>
<meta charset="UTF-8">
<title>녹지공간-인증 게시판</title> 
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
 $(function(){
		$( $(".nav-btn")[0] ).attr("style", "background: #00913A;");
		$( $(".nav-btn .nav-btn__text")[0] ).attr("style", "color:white");
		$(".myActive").attr("style","background: #00913A; font-weight:800; color: white; padding: 5px 15px; border-radius: 20px;");

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
<div id="root">
		<jsp:include page="../header.jsp"></jsp:include>
		<div class="section mypage">
			<jsp:include page="../mypage/myAside.jsp"></jsp:include>
			<main class="mypage-main">
				<jsp:include page="./myActiveHeader.jsp"></jsp:include>
			
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

		<div id="board">
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
</div>

	<div id="board_btn">
		<c:if test="${m.nickname == c.nickname}">
		<a href="/board/updateCerBoard?no=${c.no }"><button>글수정</button></a>
		<a href="/board/deleteCerBoard?no=${c.no }"><button>글삭제</button></a>
		</c:if>
		<a href="/mypage/myCerBoard"><button>글목록</button></a>		
	</div>
	
		<!-- ----댓글------ -->

					<div id="comment_list">
						<c:forEach var="comments" items="${comments}"> 
						<div class="comment_form">
							<div id="${comments.member_no}" class="comments_nickname">
								${comments.nickname}
								<div class="comment_regdate">
									${comments.com_regdate}
								</div>  
							</div>
							
								
							<div class="comments_content">
								 ${comments.com_content}
							</div>
							<div class="comment_btn">
							<c:if test="${m.no == comments.member_no}">
								<a id="updateComments"  data-toggle="modal" data-target="#updateModal" role="button"  href="/board/updateComments?no=${comments.no}&member_no=${m.no}&com_content=${comments.com_content}"><button>수정</button></a>
								<a id="deleteComments"  data-toggle="modal" data-target="#deleteModal" role="button"  href="/board/deleteComments?no=${comments.no}&member_no=${m.no}">		<button>삭제</button></a>
							</c:if>
							</div>
						</div>
							
						</c:forEach>
						
					</div><!-- 댓글끝 -->
			
			</main>
		</div>
	</div>
</body>
</html>