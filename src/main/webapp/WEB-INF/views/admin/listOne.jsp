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
	  
	 $("#deleteProduct").find(".modal-content").load("/board/updateOne?no=${o.no}"); 
	 $("#updateProduct").find(".modal-content").load("/board/deleteOne?no=${o.no}"); 
	 
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

<H2>1대1문의</H2>

	<table border="1" width="80%">
		<tr>
			<td>번호</td>
			<td>문의제목</td>
			<td>내용</td>
			<td>작성일</td>
			<td>작성자</td>	
			<td colspan=3>설정</td>					
		</tr>
		<c:forEach var="o" items="${list }">
			<tr>
				<td>
			  <a href="/mypage/detailOne?no=${o.no}">${o.no }</a>
				</td>
				<td>
					${o.one_title} 					
				</td>				 
				<td>${o.one_content }</td>
				<td>${o.one_date }</td>
				<td>${o.member_no }</td>			<!-- o.member_no -->	
				<td> <a id="updateOne" data-toggle="modal" data-target="#updateModal" role="button" href="/board/updateOne?no=${o.no}"><button>수정</button></a></td>
				<td> <a id="deleteOne" data-toggle="modal" data-target="#deleteModal" role="button" href="/board/updateOne?no=${o.no}"><button>삭제</button></a></td>
				<%-- <td>  <a href="/admin/insertProductOption?no=${p.no }">옵션</a> </td> --%>				
			</tr>
		</c:forEach>
	</table> 	
	
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
					<a href="listOne?pageNUM=${i }">${i }</a>&nbsp;&nbsp;
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