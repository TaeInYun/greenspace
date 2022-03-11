<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>	
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<link href="/css/admin.css" rel="stylesheet"/>
	<link rel="stylesheet" href="/css/style.css"> 
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
	<script type="text/javascript">
 $function(){
	  
	 /* $("#deleteProduct").find(".modal-content").load("/admin/deleteProduct?no=${p.no }");  */
	 $("#updateAddress").find(".modal-content").load("/mypage/updateAddress?no=${a.no}"); 
	 
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
<H2>주소목록</H2>

	<table border="1" width="80%">
		<tr>
			<td>주소번호</td>
			<td>주소이름</td>
			<td>우편번호</td>
			<td>주소</td>
			<td>주소상세</td>			
			<td>받는사람</td>	
			<td colspan=3>상세보기</td>		
			
		</tr>
		<c:forEach var="a" items="${aa }">
			<tr>
				<td>
			     ${a.no }
				</td>
				<td>
					${a.addr_title} 					
				</td>				 
				<td>${a.addr_postal }</td>
				<td>${a.addr_road }</td>
				<td>${a.addr_detail }</td>			
				<td>${a.addr_receiver }</td>	
				<td><a href="/mypage/detailAddress?no=${a.no}"><button>상세보기</button></a></td>	
				<%-- <td> <a id="updateProduct" data-toggle="modal" data-target="#updateModal" role="button" href="/admin/updateProduct?no=${p.no }">수정</a></td> --%>
				<td><a id="updateAddress" data-toggle="modal" data-target="#updateModal" role="button" href="/mypage/updateAddress?no=${a.no}"><button>수정하기</button></a></td>
				<td><a href="/mypage/deleteAddress?no=${a.no}"><button>삭제하기</button></a></td>	
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
  			 		    
  			 		    <c:forEach var="i" begin="1" end="${totalPage }">
							<a href="listAddress?pageNUM=${i }">${i }</a>&nbsp;&nbsp;
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