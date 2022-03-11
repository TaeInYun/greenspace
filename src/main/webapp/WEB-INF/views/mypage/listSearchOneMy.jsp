<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">

var selectBoxChange = function(value){
	 console.log("값변경테스트:"+value);
	 $("#changeTest").val(value);
}

 $function(){
	  
	 $("#detailOne").find(".modal-content").load("/mypage/detailOne?no=${o.no}"); 
	 
} 

</script>
<link href="/css/admin.css" rel="stylesheet"/>
<link rel="stylesheet" href="/css/style.css">
</head>
<body>
	<div id="root">
		<jsp:include page="../header.jsp"></jsp:include>
				
		<div class="section mypage">
		<jsp:include page="../mypage/myAside.jsp"></jsp:include>
		
		<main class="mypage-main">
				<jsp:include page="./myQnaHeader.jsp"></jsp:include>
	

	<section id="content">
	<form action="/mypage/listSearchOneMy" method="post">						
						 	<select name="searchColumn">							 							 		
								<option value="EXC">교환</option>   <!-- EXC교환 REF환불 CAN취소 ETC기타 -->
								<option value="REF">환불</option>
								<option value="CAN">취소</option>
								<option value="ETC">기타</option>
							</select>
						 	<input type="submit" value="검색">
						 	</form>
						 	
						 	
					<table border="1" width="80%">
							<tr>
								
								<td>1대1문의 제목</td>
								<td>주문번호</td>
								<td>작성일</td>
								<td>문의유형</td>	
								<td>처리상태</td>																					 								
							</tr>
							
							<c:forEach var="o" items="${list }">
								<tr>													
																												 
									<td>
									<a id="detailOne" data-toggle="modal" data-target="#detailModal" role="button" href="/mypage/detailOne?no=${o.no}">${o.one_title }</a>	
									</td>
									<td>${o.ord_no }</td>
									<td>${o.one_date }</td>
									<td>${o.one_type_name }</td>																								
									<td>${o.qna_status_code }</td>																							
								</tr>	
								
								<div id="detailModal" class="modal fade" tabindex="-1" role="dialog"> 
			  			 				<div class="modal-dialog"> 
			  			 					<div class="modal-content"> 
			  			 					</div> 
			  			 				</div> 
			  			 		    </div>
			  			 		    
							</c:forEach>
						</table>	
						</section>
						</main>
						</div>
						</div>
						 	
	
</body>
</html>