<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>녹지공간-마이페이지 1대1문의</title>
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/board.css">
<link rel="stylesheet" href="/css/components/search.css">
<style type="text/css">
#board{
	margin-left: 30px;
}

#detail_board_table{
	margin-top: 0px;
}
</style>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script type="text/javascript">
$(function(){
	 $( $(".nav-btn")[1] ).attr("style", "background: #00913A;");
	$( $(".nav-btn .nav-btn__text")[1] ).attr("style", "color:white");
	
})
</script>
</head>
<body>
<div id="root">
		<jsp:include page="../header.jsp"></jsp:include>
				
		<div class="section mypage">
		<jsp:include page="../mypage/myAside.jsp"></jsp:include>
		
			<main class="mypage-main">
				<jsp:include page="./myQnaHeader.jsp"></jsp:include>
	
	
		<div id="commu_box">
					<div id="search_form">
						<form action="/mypage/listSearchOneMy" method="post">
							<div class="searchColumn_wrap">
								<select name="searchColumn" id="searchColumn">
									<option value="EXC">교환</option>   <!-- EXC교환 REF환불 CAN취소 ETC기타 -->
									<option value="REF">환불</option>
									<option value="CAN">취소</option>
									<option value="ETC">기타</option>
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
					<th><span>${od.one_title}</span></th>
					<td><span>${od.one_date}</span></td>	
				</tr>				
			</thead>	
		
			<tr>
				<td colspan="2">
				<span>문의유형 : ${od.one_type_name}</span>		
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
			<span>	처리상태 :${od.qna_type_name}</span>
				</td>
			</tr>
			
			<tr>
				<td colspan="2">
						<div id="board_content">
						<p>${od.one_content}</p>
						</div>
					</td>
			</tr>		
	 </table>
 	</div>
 
	<div id="board_btn">
	   <a href="/notice/updateOne?no=${od.no}"><button>글수정</button></a>  
	   <a href="/notice/deleteOne?no=${od.no}"><button>글삭제</button></a>  
	   <a href="/mypage/listSearchOneMy"><button>글목록</button></a>	
	  </div>	
		   
	   
<!-- ----댓글------ -->
	<div id="comment_list">	 
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
	</div>
				
			</main>
		</div>
	</div>
</body>

</html>