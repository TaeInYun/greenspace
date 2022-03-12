<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"><!-- 모달창 -->
<link href="/css/admin.css" rel="stylesheet"/>
<link rel="stylesheet" href="/css/style.css"> 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
 $function(){
	  
	 $("#updateQna").find(".modal-content").load("/shop/updateProQna?no=${q.no}"); 
	 $("#deleteQna").find(".modal-content").load("/shop/deleteProQna?no=${q.no}"); 
	 
 }
</script>
</head>
<body>							

<div id="root">

<header id="header">
			<div id="header_box">
				<jsp:include page="../header.jsp"/>
			</div>
		</header>

<section id="container">		
	<div id="container_box"> 
	
	<section id="content">
					 	
						 	<form action="/admin/listSearchQna" method="post"> <!--   pro_qna_type_code=searchColumn(QSZ=사이즈 QDE=배송 QRE=재입고 QDT=상품상세 -->
							<select name="searchColumn">
								<option value="QSZ">사이즈</option>
								<option value="QDE">배송관련</option>
								<option value="QRE">재입고</option>
								<option value="QDT">상품상세</option>
							</select>
						 							 							 	
						 	<input type="text" name="keyword">
						 	<input type="submit" value="검색">
						 	</form>
						 	
						 	<table border="1" width="80%">
							<tr>
								
								<td>글번호</td>
								<td>상품이름</td>
								<td>문의유형</td>
								<td>제목</td>						
								<td>작성자</td>
								<td>작성일</td>
								<td>처리상태</td>
								<td colspan=3>설정</td>							 
								
							</tr>
							
							<c:forEach var="q" items="${list }">
								<tr>													
									<td>${q.no }</td>														 
									<td>
									<a href="/mypage/detailQna?no=${q.no}">${q.pro_name }</a>	
									</td>
									<td>${q.qna_type }</td>
									<td>${q.title }</td>									
									<td>${q.nickname }</td>
									<td>${q.day }</td>
									<td>${q.status }</td>
								 	<td> <a id="updateQna" data-toggle="modal" data-target="#updateModal" role="button" href="/shop/updateProQna?no=${q.no}">수정</a></td>
									<td> <a id="deleteQna" data-toggle="modal" data-target="#deleteModal" role="button" href="/shop/deleteProQna?no=${q.no}">삭제</a></td>
									<%-- <td>  <a href="/admin/insertProductOption?no=${p.no }">옵션</a> </td> --%>
								</tr>	
							</c:forEach>
						</table>	
						 
						 <!-- 모달창 -->
  			 			<div id="updateModal" class="modal fade" tabindex="-1" role="dialog"> 
  			 				<div class="modal-dialog"> 
  			 					<div class="modal-content"> 
  			 					</div> 
  			 				</div> 
  			 		    </div>
  			 			
  			 			
  			 			
  			 			<div id="deleteModal" class="modal fade" tabindex="-1" role="dialog"> 
  			 				<div class="modal-dialog"> 
  			 					<div class="modal-content"> 
  			 					</div> 
  			 				</div> 
  			 		    </div>
						 
						<c:forEach var="i" begin="1" end="${totalPage }">
							<a href="listSearchQna?pageNUM=${i }">${i }</a>&nbsp;&nbsp;
						</c:forEach>
						</section>
					
					<aside id="aside">
						<jsp:include page="../admin/adminAside.jsp"/>				 		 
					</aside>
				</div>
			</section>
	</div>				

</body>
</html>