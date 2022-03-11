<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
		
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">  
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script> 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
    <link href="/css/admin.css" rel="stylesheet"/>
	<link rel="stylesheet" href="/css/style.css">
	<script type="text/javascript">
 $function(){
	  
	 /* $("#deleteProduct").find(".modal-content").load("/admin/deleteProduct?no=${p.no }");  */
	 $("#updateAddress").find(".modal-content").load("/mypage/updateAddress?no=${a.no}"); 
	 
 }
 </script>
</head>
<body>
<div id="root">
		<jsp:include page="../header.jsp"></jsp:include>
				
		<div class="section">
		<jsp:include page="../mypage/myAside.jsp"></jsp:include>
		
		
	<section id="content">
	<h1>메인배송지</h1>
	<a href="/mypage/insertAddress"><button >배송지추가하기</button></a>
	<hr>
		
			배송지이름:${a.addr_title }<br>
			우편번호:${a.addr_postal}<br>
			받는사람이름:${a.addr_receiver }<br>
			배송지:${a.addr_road }<br>
			배송지상세:${a.addr_detail }<br>
			배송지휴대폰번호:${a.addr_phone }<br>		
		
		<%-- <a href="/mypage/updateAddress?no=${a.no}"><button> 수정하기</button> </a> --%>
		<a id="updateAddress" data-toggle="modal" data-target="#updateModal" role="button" href="/mypage/updateAddress?no=${a.no}"><button>수정하기</button></a>
			

	<hr>
	
	<h2>서브배송지</h2>
	<table border="1" width="80%">
		<tr>
			<td>배송지이름</td>
			<td>우편번호</td>
			<td>받는사람이름</td>
			<td>배송지</td>
			<td>배송지상세</td>
			<td>배송지휴대폰번호</td>
			<td colspan=3>관리하기</td>
			
			
		</tr>
		<c:forEach var="a2" items="${list }">	<!-- taglib -->	
		
			<tr>
				<td>
				<%-- <a href="/mypage/updateAddress?no=${a2.no}"> --%>${a2.addr_title }<!-- </a> -->
				</td>
				<td>
					${a2.addr_postal}	
				</td>				 
				<td>${a2.addr_receiver }</td>
				<td>${a2.addr_road }</td>
				<td>${a2.addr_detail }</td>
				<td>${a2.addr_phone }</td>
				
				<%-- <td><a href="/mypage/updateMainBtnAddress?no=${a2.no}">	<button>메인주소로변경</button></a></td> --%> 	
				 <td><a href="/mypage/updateMainBtnAddress?no=${a2.no}">	<button>메인주소로변경</button></a></td>  
				 <td><a id="updateAddress" data-toggle="modal" data-target="#updateModal" role="button" href="/mypage/updateAddress?no=${a2.no}"><button>수정하기</button></a></td>
				 <td><a href="/mypage/deleteAddress?no=${a2.no}">	<button>삭제하기</button></a></td>  
			</tr>		
				
				
		</c:forEach>
					
	</table> 
	</section>
	
	
	
	</div>
		<!-- 모달창 -->
  			 			<div id="updateModal" class="modal fade" tabindex="-1" role="dialog"> 
  			 				<div class="modal-dialog"> 
  			 					<div class="modal-content"> 
  			 					</div> 
  			 				</div> 
  			 		    </div>
	
	
</div>
</body>
</html>