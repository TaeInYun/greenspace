
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자설정_상품목록</title>
<link href="/css/shop.css" rel="stylesheet"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script type="text/javascript" src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript" src="/js/qty.js"></script>
<script type="text/javascript" src="/js/cart.js"></script>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<script src="//code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
 
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script type="text/javascript">
 $function(){
	  
	 $("#deleteProduct").find(".modal-content").load("/admin/deleteProduct?no=${p.no }"); 
	 $("#updateProduct").find(".modal-content").load("/admin/updateProduct?no=${p.no }"); 
	 
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
				<!-- 본문 -->			
					<section id="content">
					 	<H2>상품목록</H2>
					 	
					 	<form action="/admin/listProduct" method="post">
						 	<input type="text" name="keyword">
							<input type="submit" value="검색">
						</form>
						<table border="1" width="80%">
							<tr>
								<td><input type="checkbox" id="checkedAll" checked="checked"></td>
								<td>상품번호</td>
								<td>사진</td>
								<td>상품이름</td>
								<td>상품브랜드</td>
								<td>상품가격</td>
								<td>상품할인가</td>
								<td>재고수</td>								 
								<td colspan=3>상품관리</td>
							</tr>
							
							<c:forEach var="p" items="${list }">
								<tr>
									<td><input type="checkbox" name="checkList"></td>				
									<td>${p.no }</td>
									<td><img  src="/upload/${p.PRO_THUMBNAIL }" width="100" height="100"></td>
									<td>
										<a href="/admin/detailProduct?no=${p.no}">${p.pro_name} </a>					
									</td>				 
									<td>${p.pro_brand }</td>
									<td>${p.pro_price }</td>
									<td>${p.pro_saleprice }</td>
									<td>${p.pro_stock }</td>
								 
									 
							 
 
									<td> <a id="updateProduct" data-toggle="modal" data-target="#updateModal" role="button" href="/admin/updateProduct?no=${p.no }">수정</a></td>
									<td> <a id="deleteProduct" data-toggle="modal" data-target="#deleteModal" role="button" href="/admin/deleteProduct?no=${p.no }">삭제</a></td>
									<td> <a href="/admin/insertProductOption?no=${p.no }">옵션</a></td>
									
									 
 
								 
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
								<a href="/admin/listProduct?pageNUM=${i }">${i }</a>&nbsp;&nbsp;
							</c:forEach>	
 
					</section>					
					 
					<aside id="aside">
						<jsp:include page="../admin/adminAside.jsp"/>				 		 
					</aside>				
			</div><!-- 전체  section box-->
		</section>
</div>









	 			 
	
	
</body>
</html>