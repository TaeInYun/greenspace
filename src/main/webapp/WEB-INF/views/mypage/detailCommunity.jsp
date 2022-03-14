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
<title>녹지공간-게시물활동</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 <script type="text/javascript">
 $(function(){
	 
		$( $(".nav-btn")[1] ).attr("style", "background: #00913A;");
		$( $(".nav-btn .nav-btn__text")[1] ).attr("style", "color:white");
		$(".myActive").attr("style","background: #00913A; font-weight:800; color: white; padding: 5px 15px; border-radius: 20px;");
 		
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
				<colgroup> 
				<col width="80%">
				<col width="20%">
				</colgroup>
				<thead>
					<tr>
						<th><span>${c.commu_title}</span></th>
						<td><span><fmt:formatDate value="${c.commu_date}" pattern="yy.MM.dd"/></span></td>	
					</tr>
				</thead>
					
					<tr>
					<td colspan="2"><span>${c.levels}LV  ${c.nickname}</span></td>					
					</tr>
					
					<tr>
						<td colspan="2">
						<div id="board_content">
						<p>${c.commu_content}</p>
					
						<!-- 업로드한 파일들을 forEach문을 이용해 <img> 태그에 표시 -->
						<c:forEach var="list" items="${imglist}" >
							<img src="../upload/commu/${list.save_img_name}">
					    
					    </c:forEach> 
					    </div> 
					    </td>
					 </tr>   
			 </table>
			 </div>
				 

		<div id="board_btn">		
			<c:if test="${m.nickname == c.nickname}">
			<a href="/board/updateCommunity?no=${c.no }"><button>글수정</button></a>
			<a href="/board/deleteCommunity?no=${c.no }"><button>글삭제</button></a>
			</c:if>
			<a href="/mypage/myCommunity"><button>글목록</button></a>
			
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
					
			</main>
		</div>
	</div>
</body>

</html>