<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"> 
  
<title>녹지공간-마이페이지 상품문의</title>
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
 <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>  -->
<link rel="stylesheet" href="/css/style.css">
<link rel="stylesheet" href="/css/board.css">
<link rel="stylesheet" href="/css/components/search.css">
<style type="text/css">

#board{
	margin-left: 30px;
}

</style>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">

var selectBoxChange = function(value){
	 console.log("값변경테스트:"+value);
	 $("#changeTest").val(value);
}


$(function() {
	
	$("#link_qnaList").attr("style","color:white; background: #00913A;")
	$( $(".nav-btn")[0] ).attr("style", "background: #00913A;");
		$( $(".nav-btn .nav-btn__text")[0] ).attr("style", "color:white");
	
		$(".myQna").attr("style","background: #00913A; font-weight:800; color: white; padding: 5px 15px; border-radius: 20px;");
	
		 $("#detailQna").find(".model-content").load("/mypage/detailQna?no=${q2.no}"); //qna 디테일
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
				<form action="/mypage/listQna" method="post">
						<div class="searchColumn_wrap">						
						 	<select name="searchColumn" id="searchColumn">							 							 		
								<option value="QSZ">사이즈</option>
								<option value="QDE">배송관련</option>
								<option value="QRE">재입고</option>
								<option value="QDT">상품상세</option>
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
								
								<!-- <td>사진</td> -->
								<td>상품이름</td>
								<td>내용</td>
								<td>문의유형</td>
								<td>작성일</td>
								<td>처리상태</td>
														 
								
							</tr>
					</thead>
					<tbody>	
						<tr >
						<c:if test="${empty q }">
							<td colspan="5" style="height: 400px">
								문의내역이 없습니다.
							</td>
						</c:if>	
						<tr>
						
							<c:forEach var="q2" items="${q }">
								<tr>													
									<%-- <td><img  src="/upload/qna/${q2.img_name }" width="100" height="100">${q2.img_name }</td> --%>
																					 
									<td>
									${q2.pro_name }								 
			  			 					  			 		    	
									</td>
									
									<td>${q2.title }</td>
									<td>${q2.qna_type }</td>
									<td>${q2.day }</td>
									<td>${q2.status }
									<a id="detailQna" data-toggle="modal" data-target="#detailModal" role="button" href="/mypage/detailQna?no=${q2.no}"><button>상세보기</button></a>
									<div id="detailModal" class="modal fade" tabindex="-1" role="dialog"> 
			  			 					<div class="modal-dialog"> 
			  			 						<div class="modal-content"> 
			  			 						</div> 
			  			 					</div> 
			  			 		   		</div>
									</td>				  			 		     
							</tr>			
					</c:forEach>
					</tbody>
				</table>	
			</div>
		
		<div id="paging">
		<ul>
			<c:forEach var="i" begin="1" end="${totalPage }">
							<a href="listQna?pageNUM=${i }">${i }</a>&nbsp;&nbsp;
			</c:forEach> 
		</ul>
		</div>
			
			</main>
		</div>
	</div>
</body>						
</html>