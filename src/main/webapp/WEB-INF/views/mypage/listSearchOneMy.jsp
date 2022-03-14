<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">


<title>녹지공간-마이페이지 1대1문의내역</title>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"> -->
<script src="https://kit.fontawesome.com/5b334c6c49.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script> -->
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/board.css">
<link rel="stylesheet" href="/css/components/search.css">
<style type="text/css">


#board{
	margin-left: 30px;
}

</style>

<script type="text/javascript">

var selectBoxChange = function(value){
	 console.log("값변경테스트:"+value);
	 $("#changeTest").val(value);
}

$(function() {
	

	$( $(".nav-btn")[1] ).attr("style", "background: #00913A;");
	$( $(".nav-btn .nav-btn__text")[1] ).attr("style", "color:white");
	
	$(".myQna").attr("style","background: #00913A; font-weight:800; color: white; padding: 5px 15px; border-radius: 20px;");
	
	
	 
		  
		 $("#detailOne").find(".modal-content").load("/mypage/detailOne?no=${o.no}"); 
		 
	 
});



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
			<table>
			<thead>
							<tr>
								<td>제목</td>
								<td>작성일</td>
								<td>문의유형</td>	
								<td>처리상태</td>																					 								
							</tr>
			</thead>
			<tbody>				
					<tr >
						<c:if test="${empty list }">
							<td colspan="4" style="height: 400px">
								문의내역이 없습니다.
							</td>
						</c:if>	
					<tr>				
							
							<c:forEach var="o" items="${list }">
								<tr>													
																												 
									<td>
									<a href="/mypage/detailOne?no=${o.no}">${o.one_title }</a>
									</td>
									<td>${o.one_date }</td>
									<td>${o.one_type_name }</td>																								
									<td>${o.qna_type_name }
									<a id="detailOne" data-toggle="modal" data-target="#detailModal" role="button" href="/mypage/detailOne?no=${o.no}"><button>상세보기</button></a>	
									</td>																						
								</tr>	
								
								<div id="detailModal" class="modal fade" tabindex="-1" role="dialog"> 
			  			 				<div class="modal-dialog"> 
			  			 					<div class="modal-content"> 
			  			 					</div> 
			  			 				</div> 
			  			 		    </div>
			  			 		    
							</c:forEach>
							</tbody>
						</table>	
					</div>	
					
												
					<div class="writeBtn">
					<a href="/notice/insertOne"><button>글쓰기</button></a>
					</div>
					
						
						<c:forEach var="i" begin="1" end="${totalPage }">
							<a href="listSearchOneMy?pageNUM=${i }">${i }</a>&nbsp;&nbsp;
						</c:forEach>	
			
			</main>
		</div>
	</div>
</body>
</html>